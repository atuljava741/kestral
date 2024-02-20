import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kestral/datamodal/task_category.dart';
import 'package:kestral/datamodal/user_aunthentication.dart';
import 'package:kestral/utils/size_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../apicalls/logout_mutation.dart';
import '../datamodal/incomplete_task.dart';
import '../datamodal/project_detail.dart';
import '../landingpage/landing.dart';
import 'appt_text_style.dart';

class Utils {
  static var navigatorKey = GlobalKey<NavigatorState>();
  static var mockupHeight = 800;
  static var mockupWidth = 360;
  static var deviceHeight;
  static var deviceWidth;

  static String accessToken = "";

  static UserAuthResponse? userInformation;

  static TaskCategory? taskCategory;

  static var highlightColor = Color(0XFFDDF3FF);

  static  SharedPreferences? pref;

  static int intervalMinutes = 10;

  static String timerState = "timer_state";
  static String lastSentTime = "last_seen_time";
  static var startTimestamp = "start_time_stamp";
  static String projectDetailsSP = "projectDetailsSP";

  static String projectName = "projectName";
  static String taskName = "taskName";

  static String taskPriority = "Low";

  static var dueDate = "";

  static String hours = "hours";
  static String minutes = "minutes";

  static String currentTimeZone = "Asia/Kolkata";

  static var showAddButton = true;

  static getIcon(String iconName, double w, double h) {
    return Image.asset(iconName, width: w, height: h);
  }

  static double getHeight(var height) {
    var percent = ((height / mockupHeight) * 100);
    return ((deviceHeight * percent) / 100);
  }

  static double getWidth(var width) {
    var percent = ((width / mockupWidth) * 100);
    return ((deviceWidth * percent) / 100);
  }

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static SharedPreferences getPreference() {
   return pref!;
  }


  //static String selectedProject = "";
  static int selectedProjectId = 0;
  static int selectedSubTaskId = 0;
  static var selectedSubTask = "";
  static int selectedCategoryId = 0;
  static var selectedCategory = "";
  static var selectProjectText = "Select Project";
  static String deviceId = "";
  static String deviceName = "";

  static List<Projects> projectList = [];
  static List<GetInCompleteTasks> taskList = [];
  static List<TaskCategories> categoryList = [];

  static void loadSavedProjectData() {
    Map<String, dynamic> projectData = jsonDecode(
        Utils.getPreference().getString(Utils.projectDetailsSP) ?? "{}");
    selectedProjectId = projectData["projectId"] ?? 0;
    selectedSubTask = projectData["taskDescription"] ?? "";
    selectedCategoryId = projectData["taskCategoryId"] ?? 0;
    selectedSubTaskId = projectData["taskId"] ?? 0;
    selectProjectText =
        Utils.getPreference().getString(Utils.projectName) ?? "";
    selectedSubTask = Utils.getPreference().getString(Utils.taskName) ?? "";
    dueDate = Utils.getPreference().getString("dueDate") ?? "";
    taskPriority = Utils.getPreference().getString("taskPriority") ?? "";
  }

  static Future<void> saveCurrentProjectjsonBodyInPreference() async {
    Map<String, dynamic> projectDetails = <String, dynamic>{
      "projectId": selectedProjectId,
      "employeeId": Utils.userInformation!.data.userAuthentication.employeeId,
      "taskDescription": selectedSubTask,
      "effortInHrsMin": "00:00",
      "totalTimeSpent": "00:00",
      "completion": 0,
      "taskStatusId": 2,
      "taskCategoryId": selectedCategoryId,
      "taskId": selectedSubTaskId,
      "imageCaptureTime": "",
      "isManual": false,
      "mousePressCount": 0,
      "keyPressCount": 0,
      "organizationId": Utils.userInformation!.data.userAuthentication.organizationId,
      "idealFlag": 0,
      "screenshotImageUrl": "",
      "comment": null,
      "timeZone": Utils.currentTimeZone,
    };
    print(projectDetails);
    await Utils.getPreference()
        .setString(Utils.projectDetailsSP, jsonEncode(projectDetails));
  }


  static Future<void> getDeviceInfo(BuildContext context) async {
    Utils.currentTimeZone = getCurrentTimeZone();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Theme
          .of(context)
          .platform == TargetPlatform.android) {
        String strDeviceID = await FlutterKeychain.get(key: "device_unique_id_kestral") ?? "";
        AndroidDeviceInfo androidObj = await deviceInfo.androidInfo;
        if (strDeviceID.isEmpty) {
          String androidId = androidObj.androidId ?? "";
          deviceId = androidId;
          await getPreference().setString("deviceId", deviceId);
          await FlutterKeychain.put(key: "device_unique_id_kestral", value: deviceId);
        }else{
          deviceId = strDeviceID;
          await getPreference().setString("deviceId", strDeviceID);
        }
        // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        // deviceId = getPreference().getString("deviceId") ?? "";
        // String androidId = androidInfo.androidId ?? "";
        // if (deviceId == "" && androidId != "") {
        //   deviceId = androidId;
        //   await getPreference().setString("deviceId", deviceId);
        // } else {
        //   getDeviceId();
        // }
        // print(deviceId);
        deviceName = androidObj.model;
      } else if (Theme
          .of(context)
          .platform == TargetPlatform.iOS) {
        String strDeviceID = await FlutterKeychain.get(key: "device_unique_id_kestral") ?? "";
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        if (strDeviceID.isEmpty) {
          String iosId = iosInfo.identifierForVendor ?? "";
          deviceId = iosId;
          await getPreference().setString("deviceId", deviceId);
          await FlutterKeychain.put(key: "device_unique_id_kestral", value: deviceId);
        }else{
          deviceId = strDeviceID;
          await getPreference().setString("deviceId", strDeviceID);
        }
        deviceName = iosInfo.name;
      }
    } catch (e) {
      print('Failed to get device info: $e');
    }
  }

  static Future<void> getDeviceId() async {
    deviceId = getPreference().getString("deviceId") ?? "";
    if (deviceId == "") {
      var uuid = Uuid();
      String id = uuid.v4();
      deviceId = id;
      await getPreference().setString("deviceId", deviceId);
    }
    print("Device id " + deviceId);
  }

  static void showBottomSheet(BuildContext context, IconData error,
      Color iconColor, String message) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                error,
                size: 30.Sh,
                color: iconColor,
              ),
              SizedBox(width: 10.Sh),
              Flexible(
                child: Text(
                  message,
                  style: AppTextStyle
                      .textStylePoppins12w400,
                ),
              ),
              SizedBox(height: 60.Sh),
            ],
          ),
        );
      },
    );
  }

  static void showProgressBottomSheet(BuildContext context, String message, bool dismissable) {
    showModalBottomSheet(
        context: context,
        isDismissible : dismissable,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(width: 10.Sh),
                Flexible(
                  child: Text(
                    message,
                    style: AppTextStyle
                        .textStylePoppins12w400,
                  ),
                ),
                SizedBox(height: 60.Sh),
              ],
            ),
          );
        });
  }

    /*showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(
        builder:
            (BuildContext context, StateSetter setState) {
          return Container(
            width: double.infinity,
            decoration: const ShapeDecoration(
              color: Color(0xFFF8F5F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.Sh,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      message,
                      style: AppTextStyle
                          .textStylePoppins12w400,
                    )
                  ],
                ),
                SizedBox(
                  height: 60.Sh,
                ),
              ],
            ),
          )
        },
      ),
    );
  }
*/

  static getChip(String priority) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(20), // Set border radius here
        color: getColorOfPriority(priority), // Set background color
      ),
      margin: EdgeInsets.only(bottom: 3, left: 5),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Text(
        priority,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static getColorOfPriority(String priority) {
    if(priority.toLowerCase() == "high"){
      return Color(0xFFF72828);
    }
    if(priority.toLowerCase() == "medium"){
      return Color(0xffF7A428);
    }
    return Color(0xFF27CE38);
  }


  static void showCustomDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Setting to min to take only the required space
              children: [
                SizedBox(height: 56.Sh),
                SvgPicture.asset(
                  'assets/images/alert.svg', // Path to your SVG file
                  width: 64.Sw,
                  height: 64.Sh,
                ),
                SizedBox(height: 20.Sh),
                Text(
                  title,
                  style: AppTextStyle.textStylePoppins18,
                ),
                SizedBox(height: 28.Sh),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStylePoppins15,
                ),
                SizedBox(height: 72),
                Container(
                  width: double.infinity,
                  height: 48.Sh,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff1589CA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0), // Set border radius here
                      ),

                    ),
                    child: Text(
                      'OK',
                      style: AppTextStyle.textStylePoppins16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }

  static void showLogoutDialog(BuildContext context, String title, String message, Function() callback) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Setting to min to take only the required space
              children: [
                SizedBox(height: 56.Sh),
                SvgPicture.asset(
                  'assets/images/alert.svg', // Path to your SVG file
                  width: 64.Sw,
                  height: 64.Sh,
                ),
                SizedBox(height: 20.Sh),
                Text(
                  title,
                  style: AppTextStyle.textStylePoppins18,
                ),
                SizedBox(height: 28.Sh),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStylePoppins15,
                ),
                SizedBox(height: 72),
                Row(
                  children: [
                    Expanded(
                      flex : 1,
                      child: Container(
                        height: 48.Sh,
                        margin: EdgeInsets.only(right:10.Sw),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD5D5D5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0), // Set border radius here
                            ),

                          ),
                          child: const Text(
                            'LATER',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFF252525),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex : 1,
                      child: Container(
                        margin: EdgeInsets.only(left:10.Sw),
                        height: 48.Sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            callback.call();
                            var queue = Utils.getPreference().getString('queue');
                            Utils.deviceId = Utils.getPreference().getString('deviceId')!;
                            await logoutUserMutation(queue);
                            await Utils.getPreference().clear();
                            if (queue != null) {
                              await Utils.getPreference().setString('queue', queue);
                              await Utils.getPreference().setString('deviceId', Utils.deviceId);
                            }
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => LandingPage()),
                                  (route) => false,
                            ); // Close the dialog
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFecc7c7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0), // Set border radius here
                            ),

                          ),
                          child: const Text(
                            'LOGOUT',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Color(0xFFF72727),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

  }

  static String getCurrentTimeZone() {
    Map timezoneNames = {
      0: 'UTC',
      10800000: 'Indian/Mayotte',
      3600000: 'Europe/London',
      7200000: 'Europe/Zurich',
      -32400000: 'Pacific/Gambier',
      -28800000: 'US/Alaska',
      -14400000: 'US/Eastern',
      -10800000: 'Canada/Atlantic',
      -18000000: 'US/Central',
      -21600000: 'US/Mountain',
      -25200000: 'US/Pacific',
      -7200000: 'Atlantic/South_Georgia',
      -9000000: 'Canada/Newfoundland',
      39600000: 'Pacific/Pohnpei',
      25200000: 'Indian/Christmas',
      36000000: 'Pacific/Saipan',
      18000000: 'Indian/Maldives',
      46800000: 'Pacific/Tongatapu',
      21600000: 'Indian/Chagos',
      43200000: 'Pacific/Wallis',
      14400000: 'Indian/Reunion',
      28800000: 'Australia/Perth',
      32400000: 'Pacific/Palau',
      19800000: 'Asia/Kolkata',
      16200000: 'Asia/Kabul',
      20700000: 'Asia/Kathmandu',
      23400000: 'Indian/Cocos',
      12600000: 'Asia/Tehran',
      -3600000: 'Atlantic/Cape_Verde',
      37800000: 'Australia/Broken_Hill',
      34200000: 'Australia/Darwin',
      31500000: 'Australia/Eucla',
      49500000: 'Pacific/Chatham',
      -36000000: 'US/Hawaii',
      50400000: 'Pacific/Kiritimati',
      -34200000: 'Pacific/Marquesas',
      -39600000: 'Pacific/Pago_Pago'
    };

    return timezoneNames[DateTime.now().timeZoneOffset.inMilliseconds];
  }


}

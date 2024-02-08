import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:kestral/datamodal/task_category.dart';
import 'package:kestral/datamodal/user_aunthentication.dart';
import 'package:kestral/utils/size_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../datamodal/incomplete_task.dart';
import '../datamodal/project_detail.dart';
import 'appt_text_style.dart';

class Utils {
  static var mockupHeight = 800;
  static var mockupWidth = 360;
  static var deviceHeight;
  static var deviceWidth;

  static String accessToken = "";

  static UserAuthResponse? userInformation;

  static TaskCategory? taskCategory;

  static var highlightColor = Color(0XFFDDF3FF);

  static SharedPreferences? _pref;

  static int intervalMinutes = 10;

  static String timerState = "timer_state";
  static String lastSentTime = "last_seen_time";
  static var startTimestamp = "start_time_stamp";
  static String projectDetailsSP = "projectDetailsSP";

  static String projectName = "projectName";
  static String taskName = "taskName";

  static String taskPriority = "Low";

  static var dueDate = "";

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
    _pref = await SharedPreferences.getInstance();
  }

  static SharedPreferences getPreference() {
    return _pref!;
  }

  static void showDialog(String s) {
    print("dialog displayed $s");
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
      "organizationId": Utils.userInformation!.data.userAuthentication.orgId,
      "idealFlag": 0,
      "screenshotImageUrl": "",
      "comment": null,
      "timeZone": "Asia/Kolkata",
    };
    await Utils.getPreference()
        .setString(Utils.projectDetailsSP, jsonEncode(projectDetails));
  }


  static Future<void> getDeviceInfo(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    try {
      if (Theme
          .of(context)
          .platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        getDeviceId();
        deviceName = androidInfo.model;
      } else if (Theme
          .of(context)
          .platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        getDeviceId();
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

  static void showProgressBottomSheet(BuildContext context, String message) {
    showModalBottomSheet(
        context: context,
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
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kestral/datamodal/task_category.dart';
import 'package:kestral/landingpage/landing.dart';
import 'package:kestral/task_queue/task_queue.dart';

import '../apicalls/add_time_to_kestral.dart';
import '../apicalls/get_projects.dart';
import '../apicalls/get_task.dart';
import '../apicalls/get_task_categories.dart';
import '../apicalls/logout_mutation.dart';
import '../datamodal/incomplete_task.dart';
import '../datamodal/project_detail.dart';
import '../timer/timer_task.dart';
import '../utils/utils.dart';

class DashboardViewModel extends ChangeNotifier {

  TextEditingController textFieldController = TextEditingController();

  String newTaskPriority = "Low";
  String? value;
  String? selectValue;
  bool showCheckIcon = false;
  var color1 = [Color(0xFFF7F4EF), Color(0xFFFFE7A0)];
  var color2 = [Color(0xFFF1FFEE), Color(0xFFB6F1B1)];
  var currentText = "Select a task or create one to start";
  var currect2Text = "tracking";
  var kestrelText = "Kestrel pro dev";
  var logOutText = "Logout";
  var syncTimeText = "Sync Time";
  var clearCacheText = "Clear Cache";
  var subTaskTitle = "Select Task";
  var projectText = "PROJECT";
  var taskText = "Task";
  var createTaskText = "Create Task";
  var color3 = const Color.fromARGB(255, 83, 181, 67);
  var color4 = const Color(0xFF52452F);
  var projectColor = Colors.blue;
  var projectColor2 = Colors.grey;
  bool selectedText2 = false;
  TimeTracker timeTracker = TimeTracker();

  bool bottomNavVisible = false;

  final BuildContext context;
  DashboardViewModel(this.context);

  bool get obscureText => selectedText2;
  bool get timerState => getTimerState();
  bool isTaskColor = false;
  String get currentDuration => getCurrentDuration();

  void toggleSelectedText() {
    selectedText2 = !selectedText2;
    notifyListeners();
  }

  bool getTimerState() {
    return Utils.getPreference().getBool(Utils.timerState) ?? false;
  }

  String getCurrentDuration() {
    /*if (timerState) {
      int initialTimeStamp =
          Utils.getPreference().getInt(Utils.startTimestamp) ?? 0;
      DateTime startTime =
          DateTime.fromMillisecondsSinceEpoch(initialTimeStamp);

      Duration difference = DateTime.now().difference(startTime);

      // Calculate hours and minutes
      int hours = difference.inHours;
      int minutes = difference.inMinutes.remainder(60);
      minutes = ((minutes) / 10).round() * 10;
      if(minutes<0) minutes =0 ;
      Utils.getPreference().setInt(Utils.minutes, minutes);
      return "${formatWithLeadingZero(hours)}:${formatWithLeadingZero(minutes)}";
    } else {
      return "00:00";
    }*/
    int minutes = Utils.getPreference().getInt(Utils.minutes) ?? 0;
    print(minutes);
    int hours = (minutes / 60).toInt(); // Get the integer division for hours
    int remainingMinutes = (minutes % 60).toInt(); // Get the remaining minutes
    // Format the hours and minutes into a string
    String hourMinuteString = "${formatWithLeadingZero(hours)}:${formatWithLeadingZero(remainingMinutes)}";
    return hourMinuteString;

  }

  init() {
    Utils.loadSavedProjectData();
    getProjects();
    getCategories();
    onlaunchOfScreen();
  }

  void onBackPress() {}

  toogleTaskColor() {
    isTaskColor = !isTaskColor;
  }

  getTaskColor() {
    return isTaskColor ? Colors.blue : Colors.white;
  }

  getLinearGradient() {
    return LinearGradient(
      end: Alignment.bottomCenter,
      begin: Alignment.topCenter,
      colors: timerState ? color2 : color1,
    );
  }

  selectCategory(String str) {
    Utils.selectedCategory = str;
    refreshUI();
  }

  getProjects() async {
    bool success = await getProjectList(
       Utils.userInformation!.data.userAuthentication.employeeId);
    refreshUI();
    return success;
  }



  Future<void> getSubTask(int projectId) async {
    Utils.selectedProjectId = projectId;
    InCompleteTaskList inCompleteTaskList = await getMyTaskList(
        projectId, Utils.userInformation!.data.userAuthentication.employeeId);
    Utils.taskList = inCompleteTaskList.data.getInCompleteTasks;
    refreshUI();
  }

  void getCategories() async {
    TaskCategory taskCategories = await getTaskCategoryList();
    Utils.categoryList = taskCategories.taskCategories;
  }

  String getDueDate() {
    DateTime currentDate = DateTime.now();
    DateTime dateAfter30Days = currentDate.add(Duration(days: 30));
    String formattedDateAfter30Days =
        DateFormat('yyyy-MM-dd').format(dateAfter30Days);
    return formattedDateAfter30Days;
  }

  Future<void> handleTimer() async {
    if (!timerState) {
      await handleStartTimer();
    } else {
      await handleStopTimer();
    }
    refreshUI();
  }

  Future<void> handleStartTimer() async {
    print("Start Time Button clicked");
    if (Utils.selectedProjectId == 0 ||
        Utils.selectedSubTask == "" ||
        Utils.selectedCategoryId == 0 ||
        Utils.selectedSubTaskId == 0) {
      Utils.showCustomDialog(context, "Alert", "Please Select Project and Task");
      return;
    }
    await Utils.saveCurrentProjectjsonBodyInPreference();
    DateTime currentTime = DateTime.now();
    DateTime nearestTenMinutes = roundToNearestTenMinutes(currentTime);
    await Utils.getPreference()
        .setInt(Utils.startTimestamp, nearestTenMinutes.millisecondsSinceEpoch);
    await saveLastStateOfButton(true);
    timeTracker.startTimer(() {
      checkAndSyncPendingData();
    });
  }

  Future<void> handleStopTimer() async {
    //await checkAndSyncPendingData();
    timeTracker.stopTimer();
    await saveLastStateOfButton(false);
    await Utils.getPreference().remove(Utils.lastSentTime);
    await Utils.getPreference().remove(Utils.startTimestamp);
    refreshUI();
  }

  Future<void> onlaunchOfScreen() async {
    await TaskQueue.sinkQueueToServer(context);
    timeTracker.loadTimerFromSharedPreference();
    if (timerState) {
      checkAndSyncPendingData();
      timeTracker.startTimer(() {
        checkAndSyncPendingData();
      });
    }
    refreshUI();
  }

  Future<void> saveLastStateOfButton(bool state) async {
    await Utils.getPreference().setBool(Utils.timerState, state);
  }

  DateTime getLastSentDateTime() {
    int lastSentTime = Utils.getPreference().getInt(Utils.lastSentTime) ?? 0;
    DateTime lastdatetime = DateTime.fromMillisecondsSinceEpoch(lastSentTime);
    if (lastSentTime == 0) {
      int initialTimeStamp =
          Utils.getPreference().getInt(Utils.startTimestamp) ?? 0;
      lastdatetime = DateTime.fromMillisecondsSinceEpoch(initialTimeStamp);
    }

    return lastdatetime;
  }

  Future<void> checkAndSyncPendingData() async {
    DateTime lastdatetime = getLastSentDateTime();
    Duration difference = DateTime.now().difference(lastdatetime);

    int numberOfIntervals =
        (difference.inMinutes / Utils.intervalMinutes).ceil();

    print("checkAndSyncPendingData $numberOfIntervals");
    for (int i = 1; i <= numberOfIntervals; i++) {
      lastdatetime = getLastSentDateTime();
      lastdatetime = roundToNearestTenMinutes(lastdatetime);
      DateTime scheduledTime =
          lastdatetime.add(Duration(minutes: Utils.intervalMinutes));
      DateTime roundedTime = scheduledTime;
      // DateTime roundedTime = roundToNearestInterval(scheduledTime, 10);

      String lastUpdatedTime = DateFormat('HH:mm:ss').format(lastdatetime);
      String formattedTime = DateFormat('HH:mm:ss').format(roundedTime);
      // print(formattedTime);

      String formattedDate = DateFormat('yyyy-MM-dd').format(roundedTime);
      // print(formattedDate);
      await sendTimeToKeastral(
          lastUpdatedTime, formattedTime, formattedDate, roundedTime);
    }
    refreshUI();
  }

  removeTimerDetailsFromSP() async {
    await Utils.getPreference().remove(Utils.timerState);
    await Utils.getPreference().remove(Utils.lastSentTime);
    await Utils.getPreference().remove(Utils.startTimestamp);
    await Utils.getPreference().remove(Utils.projectDetailsSP);
  }

  Future<void> sendTimeToKeastral(String durationFrom, String durationTo,
      String dateOfTask, DateTime scheduledTime) async {
    int minutes = Utils.getPreference().getInt(Utils.minutes) ?? 0;
    bool timeToReset = isBetweenMidnightAndQuarterPastMidnight(scheduledTime);
    if(timeToReset) {
      minutes = 0;
    }
    minutes = minutes + 10;
    await Utils.getPreference().setInt(Utils.minutes,minutes);
    print("Adding to queue");
    print("From $durationFrom - $durationTo");

    Map<String, dynamic> durationData = <String, dynamic>{
      "date": dateOfTask,
      "durationFrom": durationFrom,
      "durationTo": durationTo,
    };
    Map<String, dynamic> projectData = jsonDecode(
        Utils.getPreference().getString(Utils.projectDetailsSP) ?? "{}");
    Map<String, dynamic> apiBody = <String, dynamic>{
      ...projectData,
      ...durationData
    };

    await TaskQueue.addToQueue(apiBody);
    await Utils.getPreference()
        .setInt(Utils.lastSentTime, scheduledTime.millisecondsSinceEpoch);
    await TaskQueue.sinkQueueToServer(context);
  }

  DateTime roundToNearestInterval(DateTime dateTime, int intervalMinutes) {
    int minutes = dateTime.minute;
    int roundedMinutes = (minutes / intervalMinutes).round() * intervalMinutes;
    return dateTime.subtract(Duration(minutes: minutes - roundedMinutes));
  }

  Future<void> logout(context) async {
    Utils.showLogoutDialog(context, "Alert", "Do you want to logout from the Kestral tool?", (){});
  }

  refreshUI() {
    notifyListeners();
  }

  getColor() {
    return timerState ? color3 : color4;
  }

  getImage() {
    return timerState ? "assets/images/start.png" : "assets/images/play.png";
  }

  String formatWithLeadingZero(int value) {
    return value.toString().padLeft(2, '0');
  }

  String getcurrentText() {
    return currentText ?? "";
  }

  String getCurrent2Text() {
    return currect2Text ?? "";
  }

  String getKestrelText() {
    return kestrelText ?? "";
  }

  String getUserNameText() {
    if(Utils.userInformation == null) return "";
    return Utils.userInformation!.data.userAuthentication.employeeName ?? "-";
  }

  String getLogOutText() {
    return logOutText ?? "";
  }

  String getSyncTimeText() {
    return syncTimeText ?? "";
  }

  String getClearCacheText() {
    return clearCacheText ?? "";
  }

  String getSubTaskTitle() {
    return subTaskTitle ?? "";
  }

  String getTaskText() {
    return taskText ?? "";
  }

  String getProjectText() {
    return projectText ?? "";
  }

  String getSelectProjectText() {
    return Utils.selectProjectText ?? "";
  }

  String getCreateTask() {
    return createTaskText ?? "";
  }

  DateTime roundToNearestTenMinutes(DateTime time) {
    int minutes = time.minute;
    int remainder = minutes % 10;
    if (remainder >= 5) {
      // Round up to the next 10 minutes
      return time.add(Duration(minutes: 10 - remainder));
    } else {
      // Round down to the previous 10 minutes
      return time.subtract(Duration(minutes: remainder));
    }
  }

  bool isBetweenMidnightAndQuarterPastMidnight(DateTime inputTime) {
    DateTime midnight = DateTime(inputTime.year, inputTime.month, inputTime.day, 0, 0); // 12:00 AM
    DateTime quarterPastMidnight = DateTime(inputTime.year, inputTime.month, inputTime.day, 0, 15); // 12:15 AM
    return inputTime.isAfter(midnight) && inputTime.isBefore(quarterPastMidnight);
  }
}

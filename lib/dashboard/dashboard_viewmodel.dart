import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kestral/datamodal/task_category.dart';

import '../apicalls/add_time_to_kestral.dart';
import '../apicalls/get_projects.dart';
import '../apicalls/get_task.dart';
import '../apicalls/get_task_categories.dart';
import '../datamodal/incomplete_task.dart';
import '../datamodal/project_detail.dart';
import '../timer/timer_task.dart';
import '../utils/utils.dart';

class DashboardViewModel extends ChangeNotifier {
  final items = ["Item 1", "Item 2", "Item 3", "Item 4"];
  TextEditingController textFieldController = TextEditingController();

  List<Projects> projectList = [];

  List<GetInCompleteTasks>  taskList = [];

  List<TaskCategories> categoryList = [];

  String? value;
  String? selectValue;
  bool showCheckIcon = false;
  var currentTime = "00:00";
  var color1 = [Color(0xFFF7F4EF), Color(0xFFFFE7A0)];
  var color2 = [Color(0xFFF1FFEE), Color(0xFFB6F1B1)];
  bool timerState = false;
  var currentText = "Select a task or create one to start";
  var currect2Text = "tracking";
  bool isPlaying = false;
  var color3 = const Color.fromARGB(255,83, 181, 67);
  var color4 = const Color(0xFF52452F);
  bool isColor = false;
  var projectColor = Colors.blue;
  var projectColor2 = Colors.grey;
  String selectedText = "";
  String selectedTask = "";
  String seletedProject = "";
  var kestrelText = "Kestrel pro dev";
  var adamLongText = "Adam Long";
  var logOutText = "Logout";
  var syncTimeText = "Sync Time";
  var clearCacheText = "Clear Cache";
  var subTaskTitle = "Select Task";
  var projectText = "PROJECT";
  var selectProjectText = "Select Project";
  var taskText = "Task";
  var createTaskText = "Create Task";
  bool selectedText2 = false;

  late int selectedProjectId;

  int selectedSubTaskId = 0;
  var selectedSubTask = "";

  TimeTracker? timeTracker;

  bool get obscureText => selectedText2;
  int selectedCategoryId = 0;
  var selectedCategory = "";
  bool isTaskColor = false;


  void toggleSelectedText() {
    selectedText2 = !selectedText2;
    notifyListeners();
  }

  String getCurrentTime() {
    return currentTime ?? "";
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
  String getAdamLongText() {
    return adamLongText ?? "";
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
    return selectProjectText ?? "";
  }
  String getCreateTask() {
    return createTaskText ?? "";
  }

  init()  {
     getProjects();
     getCategories();
     onlaunchOfScreen();
  }

  void onBackPress() {}

  refreshUI() {
    notifyListeners();
  }

  toggleState() {
    timerState = !timerState;
  }
  togglePlayState() {
      isPlaying = !isPlaying;
  }
  toggleColorState() {
    isColor = !isColor;
  }
  getColor() {
    return isColor ? color3 : color4;
  }
  getImage() {
    return  isPlaying ? "assets/images/start.png" : "assets/images/play.png";
  }
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
    selectedCategory = str;
    refreshUI();
  }

  getProjects() async {
    ProjectList allprojects = await getProjectList(Utils.userInformation!.data.userAuthentication.employeeId);
    projectList = allprojects.getActiveProjectDetailsByEmployeeId;
    refreshUI();
  }

  Future<void> getSubTask(int projectId) async {
    selectedProjectId = projectId;
    InCompleteTaskList inCompleteTaskList = await getMyTaskList(projectId,Utils.userInformation!.data.userAuthentication.employeeId);
    taskList = inCompleteTaskList.data.getInCompleteTasks;
    refreshUI();
  }

  void getCategories() async {
    TaskCategory taskCategories = await getTaskCategoryList();
    categoryList = taskCategories.taskCategories;
  }

  String getDueDate() {
    DateTime currentDate = DateTime.now();
    DateTime dateAfter30Days = currentDate.add(Duration(days: 30));
    String formattedDateAfter30Days = DateFormat('yyyy-MM-dd').format(dateAfter30Days);
    return formattedDateAfter30Days;
  }

  void handleTimer() {
    if(timerState) { // when start button is clicked
      handleStartTimer();
    }
    else { // when stop button is clicked
      handleStopTimer();
    }
  }

  void handleStartTimer() {
    print("Time Button clicked");
    DateTime currentTime = DateTime.now();
    Utils.getPreference().setInt(Utils.startTimestamp, currentTime.millisecondsSinceEpoch) ;
    timeTracker?.startTimer(() {
      checkAndSyncPendingData();
    });
  }

  void handleStopTimer() {
    checkAndSyncPendingData();
    timeTracker?.stopTimer();
    Utils.getPreference().clear();
  }

  void onlaunchOfScreen() {
    timeTracker = TimeTracker();
    timeTracker?.loadTimerFromSharedPreference();
    checkPreferneceForLastStateOfButton();
    if(timerState) {
      checkAndSyncPendingData();
    }
    refreshUI();
  }

  void checkPreferneceForLastStateOfButton() {
    timerState = Utils.getPreference().getInt(Utils.timerState) ?? false;
  }

  void checkAndSyncPendingData() {
    int lastSentTime = Utils.getPreference().getInt(Utils.lastSentTime) ?? 0;
    print("lastSentTime");
    print(lastSentTime);

    DateTime lastdatetime = DateTime.fromMillisecondsSinceEpoch(lastSentTime);
    if(lastSentTime == 0) {
      int initialTimeStamp = Utils.getPreference().getInt(Utils.startTimestamp) ;
      lastdatetime = DateTime.fromMillisecondsSinceEpoch(initialTimeStamp);
    }
    // Calculate the time difference between startTime and endTime
    Duration difference = lastdatetime.difference(DateTime.now());
    print(difference);
    // Calculate the number of intervals based on the difference and intervalMinutes
    int numberOfIntervals = (difference.inMinutes / Utils.intervalMinutes).ceil();
    print("numberOfIntervals");
    print(numberOfIntervals);
    // Set up a Timer for each interval
    for (int i = 1; i <= numberOfIntervals; i++) {
      DateTime scheduledTime = lastdatetime.add(Duration(minutes: i * Utils.intervalMinutes));
      DateTime roundedTime = roundToNearestInterval(scheduledTime, 10);

      // Format rounded time (Hours:Minute:Second)
      String lastUpdatedTime = DateFormat('HH:mm:ss').format(lastdatetime);
      String formattedTime = DateFormat('HH:mm:ss').format(roundedTime);
      print(formattedTime);
      // Format date (YYYY-MM-DD)
      String formattedDate = DateFormat('yyyy-MM-dd').format(roundedTime);
      print(formattedDate);
      sendTimeToKeastral(lastUpdatedTime, formattedTime, formattedDate);
    }
}

  void sendTimeToKeastral(String durationFrom, String durationTo, String dateOfTask) {
      print("sending time to server");
      print(selectedProjectId);
      print(selectedSubTask);
      print(selectedCategoryId);
      print(selectedSubTaskId);
      print(dateOfTask);
      print(durationFrom);
      print(durationTo);
      //addTimeToKestral(selectedProjectId, selectedSubTask,  selectedCategoryId,  selectedSubTaskId, dateOfTask, durationFrom,  durationTo);
  }

  DateTime roundToNearestInterval(DateTime dateTime, int intervalMinutes) {
    int minutes = dateTime.minute;
    int roundedMinutes = (minutes / intervalMinutes).round() * intervalMinutes;
    return dateTime.subtract(Duration(minutes: minutes - roundedMinutes));
  }
}

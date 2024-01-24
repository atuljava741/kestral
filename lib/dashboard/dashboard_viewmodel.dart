import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../datamodal/project_detail.dart';

class DashboardViewModel extends ChangeNotifier {
  final items = ["Item 1", "Item 2", "Item 3", "Item 4"];

  List<Projects> projectList = [];

  final setectTask = [
    "Tasks",
    "Dev pro",
    "Dashboard",
    "Presentation Creation",
    "AI Feature",
    "Drag & Drop Functionality",
    "Payment Gateway"
  ];
  final createTaskItems = [
    "Development",
    "Testing",
    "Project Management",
    "Backend",
    "Front end",
  ];
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

  String seletedProject = "";

  String getCurrentTime() {
    return currentTime ?? "";
  }
  String getcurrentText() {
    return currentText ?? "";
  }
  String getCurrent2Text() {
    return currect2Text ?? "";
  }

  init()  {
     getProjectList();
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

  getLinearGradient() {
    return LinearGradient(
      end: Alignment.bottomCenter,
      begin: Alignment.topCenter,
      colors: timerState ? color2 : color1,
    );
  }

  getProjectList() {

    // store in class variable ProjectDetail
  }
}

import 'package:flutter/material.dart';
import 'package:kestral/datamodal/task_category.dart';
import 'package:kestral/datamodal/user_aunthentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {

  static var mockupHeight = 800;
  static var mockupWidth = 360;
  static var deviceHeight;
  static var deviceWidth;

  static String accessToken = "";

  static UserAuthResponse? userInformation;

  static TaskCategory? taskCategory;

  static var highlightColor = Colors.blue;

  static SharedPreferences? _pref;

  static int  intervalMinutes = 1;

  static String  timerState = "timer_state";

  static String lastSentTime = "last_seen_time";

  static var startTimestamp = "start_time_stamp";

  static getIcon(String iconName, double w, double h) {
    return  Image.asset(iconName, width: w , height : h);
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

  static getPreference() {
    return _pref;
  }

}
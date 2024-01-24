import 'package:flutter/material.dart';

class Utils {

  static var mockupHeight = 800;
  static var mockupWidth = 360;
  static var deviceHeight;
  static var deviceWidth;

  static String accessToken = "";

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
}
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../apicalls/login_mutation.dart';

class LandingPageViewModel extends ChangeNotifier {

   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController emailController = TextEditingController();
   GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
   TextEditingController passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length< 8) {
      return "Enter correct password";
    } else {
      return null;
    }
  }
  Future<void> handleButtonClick(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    if (formKey.currentState?.validate() ?? false) {
      await customLoginMutation(email, password);
      //navigate to dashboard
    } else {
      // bottom sheet showing ," Please enter the corrent information" and ok button which will close the bottom sheet.
    }
  }
  String morningText = "Hey! Good Morning";
  var emailAddressText = "Email Address";
  var passwordText = "Password";
  var buttonLogInText = "Login";
  var orText = "or";
  var valueChoose;
  bool _obscureText2 = true;
  bool get obscureText => _obscureText2;

  void toggleObscureText() {
    _obscureText2 = !_obscureText2;
    notifyListeners();
  }
  String getMorningText() {
    return morningText ?? "";
  }
  String getEmailAddressText() {
    return emailAddressText ?? "";
  }
  String getPasswordText() {
    return passwordText ?? "";
  }
  String getButtonLogInText() {
    return buttonLogInText ?? "";
  }
  String getOrText() {
    return orText ?? "";
  }

  init()  {}


  void onBackPress() {}

  refreshUI() {
    notifyListeners();
  }

  String getLogInText() {
    return "Login";
  }


}

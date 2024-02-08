import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kestral/utils/size_ext.dart';

import '../apicalls/login_mutation.dart';
import '../dashboard/dashboard.dart';
import '../kestrel_pro_page.dart';
import '../utils/utils.dart';

class LandingPageViewModel extends ChangeNotifier {

   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController emailController = TextEditingController();
   GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
   TextEditingController passwordController = TextEditingController();
   String? responseMessage ="Please provide correct Email Address and Password";

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      responseMessage ='Please enter a valid email address';
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      responseMessage ='Please enter a valid email address';
      return 'Please enter a valid email address';
    }
    return null;
  }

   String? validatePassword(String? value) {
     if (value == null || value.isEmpty || value.length < 8) {
       responseMessage ='Please enter a valid password';
       return "Please enter a valid password";
     }
     return null;
   }

   Future<void> handleButtonClick(BuildContext context) async {
     String email = "atul.sharma@47billion.com";//"anshul.upadhyay@47billion.com";//emailController.text;
     String password = "Test@123";////passwordController.text;

     // Validate email and password
     bool isEmailValid = true;//formKey.currentState?.validate() ?? false;
     bool isPasswordValid = true;//passwordFormKey.currentState?.validate() ?? false;

     /*String email = emailController.text;
     String password = passwordController.text;

     // Validate email and password
     bool isEmailValid = formKey.currentState?.validate() ?? false;
     bool isPasswordValid = passwordFormKey.currentState?.validate() ?? false;*/

     if (isEmailValid && isPasswordValid) {
       responseMessage = await customLoginMutation(email, password);
     }
     if(responseMessage == "true") {
         Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => KestralScreen()),
         );
     }
     else {
       String errorMessage = getErrorMessage();
       Utils.showBottomSheet(context, Icons.error, Colors.red, errorMessage);
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

  init()  {

  }


  void onBackPress() {}

  refreshUI() {
    notifyListeners();
  }

  String getLogInText() {
    return "Login";
  }

  String getErrorMessage() {
    bool isEmailValid = formKey.currentState?.validate() ?? false;
    bool isPasswordValid = passwordFormKey.currentState?.validate() ?? false;
    if(!isEmailValid && !isPasswordValid) {
      return "Please Enter a valid Email and Password";
    } else {
      if(!isEmailValid) {
        return "Please enter a valid Email Address";
      } else if(!isPasswordValid){
        return "Please enter a valid Password";
      }
    }
    return responseMessage ?? "";
  }


}

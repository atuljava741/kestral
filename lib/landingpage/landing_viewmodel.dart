import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kestral/utils/size_ext.dart';

import '../apicalls/login_mutation.dart';
import '../dashboard/dashboard.dart';
import '../kestrel_pro_page.dart';

class LandingPageViewModel extends ChangeNotifier {

   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController emailController = TextEditingController();
   GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
   TextEditingController passwordController = TextEditingController();
   String? responseMessage ="Please provide correct Email Address and Password";

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
     if (value == null || value.isEmpty || value.length < 8) {
       return "Password must be at least 8 characters";
     }
     return null;
   }

   Future<void> handleButtonClick(BuildContext context) async {
     String email = emailController.text;
     String password = passwordController.text;

     // Validate email and password
     bool isEmailValid = formKey.currentState?.validate() ?? false;
     bool isPasswordValid = passwordFormKey.currentState?.validate() ?? false;

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
       // Fields are not valid, show a modal bottom sheet with an error message
       showModalBottomSheet(
         context: context,
         builder: (BuildContext context) {
           return Container(
             width: double.infinity,
             padding: EdgeInsets.all(16),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                 const Text(
                   'Error',
                   style: TextStyle(
                     fontSize: 22,
                   ),
                 ),
                 SizedBox(height: 20.Sh),
                 Text(
                   responseMessage ?? "",
                   style: TextStyle(
                     fontSize: 18,
                   ),
                 ),
                 const SizedBox(height: 20),
                 Container(
                   width: double.infinity,
                   padding: EdgeInsets.only(top: 5.Sh, bottom: 5, left: 50.Sw, right: 50.Sw),
                   child: ElevatedButton(
                     onPressed: () {
                       // Close the bottom sheet
                       Navigator.pop(context);
                     },
                     style: ElevatedButton.styleFrom(
                       primary: Colors.blue, // Set the background color to blue
                     ),
                     child: Text('OK', style: TextStyle(color: Colors.white)),
                   ),
                 ),
               ],
             ),
           );
         },
       );
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

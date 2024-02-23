import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kestral/utils/size_ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../apicalls/login_mutation.dart';
import '../apicalls/logout_mutation.dart';
import '../dashboard/dashboard.dart';
import '../kestrel_pro_page.dart';
import '../utils/utils.dart';
import 'landing.dart';
import 'package:aad_oauth/aad_oauth.dart';

class LandingPageViewModel extends ChangeNotifier {
  final navigatorKey = GlobalKey<NavigatorState>();
  String version = "";
  String buildNumber = "";

  final BuildContext context;

  var showProgressBar = false;

  LandingPageViewModel(this.context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  String? responseMessage = "Please provide correct Email Address and Password";

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      responseMessage = 'Please enter a valid email address';
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      responseMessage = 'Please enter a valid email address';
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
      responseMessage = 'Please enter a valid password';
      return "Please enter a valid password";
    }
    return null;
  }

  Future<void> handleButtonClick(BuildContext context) async {
    /*String email = "atul.sharma@47billion.com";//"anshul.upadhyay@47billion.com";//emailController.text;
     String password = "Test@123";////passwordController.text;

     // Validate email and password
     bool isEmailValid = true;//formKey.currentState?.validate() ?? false;
     bool isPasswordValid = true;//passwordFormKey.currentState?.validate() ?? false;*/

    String email = emailController.text;
    String password = passwordController.text;

    // Validate email and password
    bool isEmailValid = formKey.currentState?.validate() ?? false;
    bool isPasswordValid = passwordFormKey.currentState?.validate() ?? false;

    if (isEmailValid && isPasswordValid) {
      responseMessage = await customLoginMutation(email, password);
    } else {
      String errorMessage = getErrorMessage();
      Utils.showBottomSheet(context, Icons.error, Colors.red, errorMessage);
      return;
    }

    if (responseMessage == "true") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => KestralScreen()),
            (route) => false,
      );
    } else {
      responseMessage = responseMessage ??
          "KestralPro is facing some issue. Please try again.";
      print(Utils.getPreference().get("access_token"));
      if (responseMessage!.contains("You are currently logged")) {
        Utils.showLogoutDialog(context, "Kestral Updates", responseMessage!,
                () async {
              var queue = Utils.getPreference().getString('queue');
              Utils.deviceId = Utils.getPreference().getString('deviceId')!;
              await logoutUserMutation(queue);
              await Utils.getPreference().clear();
              await Utils.getPreference().setString('deviceId', Utils.deviceId);
            });
      } else {
        Utils.showCustomDialog(context, "KestrelPro Updates", responseMessage!);
      }
    }
  }

  Future<void> handleAutoLogin(BuildContext context, String email,
      String password) async {
    responseMessage = await customLoginMutation(email, password);

    if (responseMessage == "true") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => KestralScreen()),
            (route) => false,
      );
    } else {
      String errorMessage = getErrorMessage();
      print(Utils.getPreference().get("access_token"));
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
    return getGreetingMessage();
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

  init() {
    print("INIT landing page");
    SharedPreferences.getInstance().then((value) {
      Utils.pref = value;
      print("Trying Auto login");
      autoLogin(context);
      notifyListeners();
    });
    getVersionInfo();
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
    if (!isEmailValid && !isPasswordValid) {
      return "Please Enter a valid Email and Password";
    } else {
      if (!isEmailValid) {
        return "Please enter a valid Email Address";
      } else if (!isPasswordValid) {
        return "Please enter a valid Password";
      }
    }
    return responseMessage ?? "";
  }

  autoLogin(context) async {
    String email = Utils.getPreference().getString("email") ?? "";
    String password = Utils.getPreference().getString("password") ?? "";
    Utils.accessToken = Utils.getPreference().getString("access_token") ?? "";
    Utils.deviceId = Utils.getPreference().getString("deviceId") ?? "";
    if (email != "" && password != "") {
      String? responseMes = await customLoginMutation(email, password);
      if (responseMes == "true") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => KestralScreen()),
              (route) => false,
        );
      }
    }
  }

  onBtnClick_Microsoft() async {
    print("call");
    final Config config = Config(
      tenant: "f47a48fd-3a59-4131-b9c0-cfdad78da389",
      //"Your TenantId",
      clientId: "e4cd8cbf-adb9-4b4c-a80c-0ffd11ae6723",
      scope: "HTTPS://GRAPH.MICROSOFT.COM/USER.READ",
      //"HTTPS://GRAPH.MICROSOFT.COM/PROFILE,HTTPS://GRAPH.MICROSOFT.COM/EMAIL,HTTPS://GRAPH.MICROSOFT.COM/USER.READ",
      redirectUri: "com.app.socialLoginDemo://auth",
      navigatorKey: Utils
          .navigatorKey, // Ensure this key is defined in your main file under MaterialApp.
    );
    final AadOAuth oauth = new AadOAuth(config);
    final result = await oauth.login();

    result.fold(
          (l) => print("Microsoft Authentication Failed!"),
          (r) async {
        print("Microsoft Authentication token ${r.accessToken}!");
        // setState(() {
        //   strToken = "${r.accessToken}";
        // });
      },
    );
  }

  onBtnClick_Google() async {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];
    GoogleSignIn _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: 'your-client_id.apps.googleusercontent.com',
      scopes: scopes,
    );
    try {
      await _googleSignIn.signIn().then((value) {
        print(" hsdg response google ${value}");
        if (value != null) {
          print(value.email);
        }
      });
    } catch (error) {
      print(error);
      print(" error response google ${error}");
    }
  }

  String getGreetingMessage() {
    final hour = DateTime
        .now()
        .hour;

    if (hour < 12) {
      return 'Hey! Good Morning';
    } else if (hour < 17) {
      return 'Hey! Good Afternoon';
    } else {
      return 'Hey! Good Evening';
    }
  }

  void progressBarVisibility(bool pbstate) {
    showProgressBar = pbstate;
    refreshUI();
  }


  void getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    try {
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}

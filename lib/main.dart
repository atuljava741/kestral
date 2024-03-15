import 'package:flutter/material.dart';
import 'package:kestral/utils/utils.dart';
import 'landingpage/landing.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Kestrel',
      navigatorKey: Utils.navigatorKey,
        debugShowCheckedModeBanner : false,
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[300] ?? Colors.blue),
        textSelectionTheme:  TextSelectionThemeData(
          cursorColor: Colors.blue[300], //thereby
          selectionColor: Colors.blue[300],
          selectionHandleColor: Colors.blue[300]
        ),
        useMaterial3: true,
      ),
      home:  const LandingPage()
    );
  }
}

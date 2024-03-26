import 'package:flutter/material.dart';
import 'package:kestral/utils/utils.dart';

import 'landingpage/landing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils().registerConnectivityListener();
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
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[100] ?? Colors.blue),
        textSelectionTheme:  TextSelectionThemeData(
          cursorColor: Colors.blue[100], //thereby
          selectionColor: Colors.blue[100],
          selectionHandleColor: Colors.blue[100]
        ),
        useMaterial3: true,
      ),
      home:  const LandingPage()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kestral/utils/utils.dart';
import 'landingpage/landing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Utils.init();
    return MaterialApp(
      title: 'Kestral',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LandingPage()
    );
  }
}

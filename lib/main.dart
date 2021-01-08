import 'package:fa17_bse_043_lab_final/splash%20screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHAHID FARID' 'FA17-BSE-043',
      theme: ThemeData(

      ),
      home: SplashScreen(
      ),
    );
  }
}



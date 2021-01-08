import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fa17_bse_043/main.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SplashScreen())));
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.grey.shade900,
      child: Image.asset('images/1.jpg'),
    );
  }
}

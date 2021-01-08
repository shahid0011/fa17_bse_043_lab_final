import 'dart:async';
import 'package:flutter/material.dart';


import 'main.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MaterialApp(
          title: 'Notes Taking App',
          home: MyApp(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

        ),),));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('images/111.png'),height: 300,),
            SizedBox(height: 10,),
            Text('Shahid Farid', style: TextStyle(fontSize: 30,color: Colors.black),),
            SizedBox(height: 10,),
            Text('FA17-BSE-043', style:  TextStyle(fontSize: 20,color: Colors.black),),
            SizedBox(height: 10,),

          ],
        ));
  }
}
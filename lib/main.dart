import 'package:fa17_bse_043_lab_final/splash%20screen.dart';
import 'package:flutter/material.dart';
import 'package:fa17_bse_043_lab_final/helper/note_provider.dart';
import 'package:provider/provider.dart';
import 'package:fa17_bse_043_lab_final/screens/note_edit_screen.dart';
import 'package:fa17_bse_043_lab_final/screens/note_view_screen.dart';



void main() {
  runApp(SplashScreen());
}
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
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NoteProvider(),
      child: MaterialApp(
        title: "Flutter Notes",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
          NoteViewScreen.route: (context) => NoteViewScreen(),
          NoteEditScreen.route: (context) => NoteEditScreen(),

        },
      ),
    );
  }
}
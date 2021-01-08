import 'package:fa17_bse_043_lab_final/helper/note_provider.dart';
import 'package:fa17_bse_043_lab_final/units/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fa17_bse_043_lab_final/constants.dart';
import 'package:url_launcher/url_launcher.dart';
@override
Widget build(BuildContext context) {
  return FutureBuilder(
    future: Provider.of<NoteProvider>(context,listen: false).getNotes(),
    builder: (context,snapshot)
    {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }else
      {
        return Container(
        );
      }
    },
  );
}

Widget header() {
  return GestureDetector(
    onTap: _launchUrl,
    child: Container(
      decoration: BoxDecoration(
        color: headerColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(75.0),
        ),
      ),
      height: 150,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ANDROIDRIDE\'S',
            style: headerRideStyle,
          ),
          Text(
            'NOTES',
            style: headerNotesStyle,
          ),
        ],
      ),
    ),
  );
}



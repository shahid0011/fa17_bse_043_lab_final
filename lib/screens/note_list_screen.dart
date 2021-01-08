import 'package:fa17_bse_043_lab_final/helper/note_provider.dart';
import 'package:fa17_bse_043_lab_final/screens/note_edit_screen.dart';
import 'package:fa17_bse_043_lab_final/units/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
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
      }
      else
      {
        if(snapshot.connectionState == ConnectionState.done)
        {
          return Scaffold(
            body: Consumer<NoteProvider>(
              child: noNotesUI(context),
              builder: (context, noteprovider, child) =>
              noteprovider.items.length <= 0
                  ? child
                  : Container(),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                goToNoteEditScreen(context);
              },
              child: Icon(Icons.add),
            ),
          );
        }
        return Container(
          width: 0.0,
          height: 0.0,
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
_launchUrl() async {
  const url = 'https://www.androidride.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
Widget noNotesUI(BuildContext context) {
  return ListView(
    children: [
      header(),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset(
              'crying_emoji.png',
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
          ),
          RichText(
            text: TextSpan(
              style: noNotesStyle,
              children: [
                TextSpan(text: ' There is no note available\nTap on "'),
                TextSpan(
                    text: '+',
                    style: boldPlus,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        goToNoteEditScreen(context);
                      }),
                TextSpan(text: '" to add new note'),
              ],
            ),
          )
        ],
      ),
    ],
  );
}
void goToNoteEditScreen(BuildContext context) {
  Navigator.of(context).pushNamed(NoteEditScreen.route);
}



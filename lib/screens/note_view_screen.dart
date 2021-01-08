import 'package:flutter/material.dart';

class NoteViewScreen extends StatefulWidget {
  static const route = '/note-view';

  @override
  _NoteViewScreenState createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State {
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
}
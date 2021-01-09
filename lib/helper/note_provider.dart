import 'package:fa17_bse_043_lab_final/units/constants.dart';
import 'package:flutter/material.dart';
import 'package:fa17_bse_043_lab_final/helper/database_helper.dart';
import '../models/note.dart';
class NoteProvider with ChangeNotifier {
  List _items = [];
  List get items {
    return [..._items];
  }
  Future getNotes(int id) async {
    final notesList = await DatabaseHelper.getNotesFromDB();
    _items = notesList
        .map(
          (item) =>
          Note(
              item['id'], item['title'], item['content'], item['imagePath']),
    )
        .toList();
    notifyListeners();
  }
}
Future addOrUpdateNote(int id, String title, String content,
    String imagePath, EditMode editMode) async {
  final note = Note(id, title, content, imagePath);

  if (EditMode.ADD == editMode) {
    _items.insert(0, note);
  } else {
    _items[_items.indexWhere((note) => note.id == id)] = note;
  }

  notifyListeners();

  DatabaseHelper.insert(
    {
      'id': note.id,
      'title': note.title,
      'content': note.content,
      'imagePath': note.imagePath,
    },
  );
}
Future deleteNote(int id) {
  _items.removeWhere((element) => element.id == id);
  notifyListeners();
  return DatabaseHelper.delete(id);
}
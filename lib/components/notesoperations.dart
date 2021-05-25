import 'package:flutter/cupertino.dart';
import 'package:quiz/model/note.dart';

class NotesOperation extends ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get getNotes {
    return _notes;
  }

  NotesOperation() {
    addNewNotes('Example:First', 'Example :First Note Description');
  }

  void addNewNotes(title, description) {
    Note note = Note(title, description);

    _notes.add(note);
    notifyListeners();
  }
}

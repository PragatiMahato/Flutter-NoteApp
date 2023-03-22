import 'package:flutter/cupertino.dart';
import 'package:note_provider/note_provider/modal.dart';


class NotesNotifier extends ChangeNotifier {
  final List<Notes> _notes = [];

  List<Notes> get notes => _notes;

  void addNote(Notes note) {
    _notes.add(note);
    notifyListeners();
  }

   void removeNote(Notes note) {
    _notes.removeWhere((item) => item.id == note.id);
    notifyListeners();
  }

  void editNote(Notes note) {
    int index = _notes.indexWhere((element) => element.id == note.id);
    _notes[index] = note;
    notifyListeners();
  }
}

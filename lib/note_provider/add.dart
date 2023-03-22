import 'package:flutter/material.dart';
import 'package:note_provider/note_provider/modal.dart';
import 'package:note_provider/note_provider/provider.dart';
import 'package:note_provider/note_provider/widget/btn.dart';
import 'package:note_provider/note_provider/widget/textfild.dart';
import 'package:provider/provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 248, 238, 226).withOpacity(1),
        body: SingleChildScrollView(
          child: Column(
            children: [
             CustomTextField(hintText: "Title", controller: _titleController),
            CustomTextField(hintText: "Description", controller: _descriptionController),
              const SizedBox(
                height: 350,
              ),

              Button(
                  btnText: "Add Note",
                  callback: () {
                    Notes note = Notes(
                        description: _descriptionController.text,
                        title: _titleController.text,
                        id: DateTime.now().microsecondsSinceEpoch);
                    Provider.of<NotesNotifier>(context, listen: false)
                        .addNote(note);
                    Navigator.pop(context);
                  })
            ],
          ),
        ));
  }
}

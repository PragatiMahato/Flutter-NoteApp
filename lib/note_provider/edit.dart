import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_provider/note_provider/provider.dart';
import 'package:note_provider/note_provider/recent.dart';
import 'package:note_provider/note_provider/widget/btn.dart';
import 'package:note_provider/note_provider/widget/textfild.dart';
import 'package:provider/provider.dart';
import 'modal.dart';

class EditNote extends StatefulWidget {
  const EditNote({
    super.key,
    required this.note,
  });
  final Notes note;
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.note.title);
    _descriptionController =
        TextEditingController(text: widget.note.description);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 238, 226).withOpacity(1),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 15),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.back,
                          color: Color.fromARGB(255, 20, 20, 20),
                          size: 30,
                        )),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: const Text(
                        'Edit Note',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w700),
                      )),
                  Container(
                      margin: const EdgeInsets.only(right: 20, top: 15),
                      child: const Icon(CupertinoIcons.ellipsis_vertical))
                ],
              ),
              CustomTextField(hintText: "Title", controller: _titleController),
              CustomTextField(hintText: "Description", controller: _descriptionController),
              const SizedBox(
                height: 190,
              ),
              Button(
                btnText: "Edit Note",
                callback: () {
                  Notes note = Notes(
                      description: _descriptionController.text,
                      title: _titleController.text,
                      id: widget.note.id);
                  Provider.of<NotesNotifier>(context, listen: false)
                      .editNote(note);
                  Navigator.pop(context);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}

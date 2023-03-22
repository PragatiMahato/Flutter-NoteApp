// ignore_for_file: must_be_immutable, annotate_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/Note/note_modal.dart';

class EditNote extends StatefulWidget {
  EditNote({super.key, required this.note});

  final NoteModal note;

  List<NoteModal> notes = [];
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late final TextEditingController titleEditingController;
  late final TextEditingController descriptionController;
  

  @override
  void initState() {
    titleEditingController = TextEditingController(text: widget.note.title);
    descriptionController =
        TextEditingController(text: widget.note.description);
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    titleEditingController.dispose();
    super.dispose();
  }

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
                          //  Navigator.pop(context, MaterialPageRoute(builder: (context) =>  RecentNotes()),);
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
              Container(
                margin: const EdgeInsets.only(top: 40, left: 25),
                child: TextFormField(
                  controller: titleEditingController,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                    border: InputBorder.none,
                    // border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, left: 25),
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Description",
                  ),
                ),
              ),
              
              const SizedBox(
                height: 190,
              ),
              Container(
                height: 80,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 217, 50, 31).withOpacity(0.8)),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          NoteModal(
                            title: titleEditingController.text,
                            description: descriptionController.text,
                            id: DateTime.now().microsecond,
                          ));
                    },
                    child: const Text(
                      "Edit Note",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}

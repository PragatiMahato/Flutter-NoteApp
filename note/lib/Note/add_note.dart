import 'package:flutter/material.dart';
import 'package:note/Note/note_modal.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final  titleEditingController = TextEditingController();
  final  descEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 248, 238, 226).withOpacity(1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 380,
                margin: const EdgeInsets.only(top: 100, left: 25),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                   maxLines: null,
                  controller: titleEditingController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    label: Text("Title"),
                  ),
                ),
              ),
              Container(
                width: 380,
                margin: const EdgeInsets.only(top: 40, left: 25),
                child: TextField(
                  controller: descEditingController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Description",
                  ),
                  onChanged: (String value) { },
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                height: 80,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 217, 50, 31)
                        .withOpacity(0.8)),
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          NoteModal(
                            title: titleEditingController.text,
                            description: descEditingController.text,
                            id: DateTime.now().microsecond,
                          ));
                    },
                    child: const Text(
                      "Add Note",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ));
  }
}

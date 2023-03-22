import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/Note/add_note.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 238, 226).withOpacity(1),
      appBar: AppBar(
          elevation: 0,
          backgroundColor:
              const Color.fromARGB(255, 248, 238, 226).withOpacity(1),
          title: const Text(
            'All Notes',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 19,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 64, 59, 55)),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.text_alignleft,
                color: Color.fromARGB(255, 64, 59, 55),
                size: 28,
              ))),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 130),
                child: const Image(
                    image: AssetImage('assets/images/group_note.png')),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Create Your First Note',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Add a note about anything (your thoughts \n on climate change, or your history essay) \nand share it witht the world.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 95, 92, 88)),
              ),
              const SizedBox(
                height: 90,
              ),
              Container(
                height: 80,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 217, 50, 31)
                        .withOpacity(0.8)),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddNote()));
                    },
                    child: const Text(
                      "Create A Note",
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}

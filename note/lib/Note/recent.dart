// ignore_for_file: unused_import, prefer_const_constructors, camel_case_types, must_be_immutable, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/Note/add_note.dart';
import 'package:note/Note/create_note.dart';
import 'package:note/Note/edit_note.dart';
import 'package:note/Note/note_modal.dart';

class RecentNotes extends StatefulWidget {
  const RecentNotes({super.key});

  @override
  State<RecentNotes> createState() => _RecentNotesState();
}

class _RecentNotesState extends State<RecentNotes> {
  List<NoteModal> notes = [];

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 248, 238, 226).withOpacity(1),
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
                      onPressed: () async {
                        NoteModal note = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddNote()));

                   setState(() {
                    notes.add(note);
                  });
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 238, 226),
      appBar: AppBar(
        elevation: 0,
          backgroundColor: const Color.fromARGB(255, 248, 238, 226),
          title: const Text(
            'Recent Note',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.format_align_left,
                  color: Colors.black,
                ));
          })),
      body: GridView.builder(
        itemCount: notes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          // print("Current index is $index");
          NoteModal note = notes[index];
          return GestureDetector(
            onTap: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => EditNote(note: note))));

            
            },
            child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    note.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(note.description),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          NoteModal note = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNote()));
          setState(() {
            notes.add(note);
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
  
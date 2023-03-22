import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit.dart';
import 'provider.dart';
import 'widget/floating_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
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
      body: Consumer<NotesNotifier>(builder: (context, notesNotifier, child) {
        return GridView.builder(
          itemCount: notesNotifier.notes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            EditNote(note: notesNotifier.notes[index]))));
              },
              child: Card(
                margin: const EdgeInsets.only(left: 15, right: 15),
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      notesNotifier.notes[index].title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      notesNotifier.notes[index].description,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.only(top: 100),
                      child: IconButton(
                          onPressed: () {
                            notesNotifier
                                .removeNote(notesNotifier.notes[index]);
                          },
                          icon: const Icon(Icons.delete)),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: const CustomFloating_btn(),
    );
  }
}

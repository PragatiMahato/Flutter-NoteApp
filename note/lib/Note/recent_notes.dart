// // ignore_for_file: unused_import, prefer_const_constructors, camel_case_types, must_be_immutable, unused_local_variable

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:note/Note/add_note.dart';
// import 'package:note/Note/create_note.dart';
// import 'package:note/Note/edit_note.dart';
// import 'package:note/Note/note_modal.dart';
// import 'package:provider/provider.dart';

// class RecentNotes extends StatefulWidget {
//    const RecentNotes({super.key,});

//   @override
//   State<RecentNotes> createState() => _RecentNotesState();
// }

// class _RecentNotesState extends State<RecentNotes> {
//   List<NoteModal> notes = [];
//   List<NoteModal> notemodal = [];
//   @override
//   Widget build(BuildContext context) {
//     if (notes.isEmpty) {
//       return Scaffold(
//         backgroundColor:
//             const Color.fromARGB(255, 248, 238, 226).withOpacity(1),
//         appBar: AppBar(
//             elevation: 0,
//             backgroundColor:
//                 const Color.fromARGB(255, 248, 238, 226).withOpacity(1),
//             title: const Text(
//               'All Notes',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontSize: 19,
//                   fontFamily: 'Nunito',
//                   fontWeight: FontWeight.w900,
//                   color: Color.fromARGB(255, 64, 59, 55)),
//             ),
//             leading: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   CupertinoIcons.text_alignleft,
//                   color: Color.fromARGB(255, 64, 59, 55),
//                   size: 28,
//                 ))),
//         body: ListView(
//           children: [
//             Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(top: 130),
//                   child: const Image(
//                       image: AssetImage('assets/images/group_note.png')),
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 const Text(
//                   'Create Your First Note',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontFamily: 'Nunito',
//                       fontSize: 25,
//                       fontWeight: FontWeight.w800),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 const Text(
//                   'Add a note about anything (your thoughts \n on climate change, or your history essay) \nand share it witht the world.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontFamily: 'Nunito',
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Color.fromARGB(255, 95, 92, 88)),
//                 ),
//                 const SizedBox(
//                   height: 90,
//                 ),
//                 Container(
//                   height: 80,
//                   width: 370,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: const Color.fromARGB(255, 217, 50, 31)
//                           .withOpacity(0.8)),
//                   child: TextButton(
//                       onPressed: () async {
//                         NoteModal note = await Navigator.of(context).push(
//                             MaterialPageRoute(
//                                 builder: (context) => const AddNote()));
//                         setState(() {
//                           notes.add(note);
//                         });
//                       },
//                       child: const Text(
//                         "Create A Note",
//                         style: TextStyle(
//                             fontFamily: 'Nunito',
//                             fontSize: 22,
//                             fontWeight: FontWeight.w800,
//                             color: Colors.white),
//                       )),
//                 )
//               ],
//             ),
//           ],
//         ),
//       );
//     }
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 248, 238, 226).withOpacity(1),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color.fromARGB(255, 248, 238, 226).withOpacity(1),
//         title: Text(
//           'Recent Notes',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontSize: 19,
//               fontFamily: 'Nunito',
//               fontWeight: FontWeight.w900,
//               color: Color.fromARGB(255, 64, 59, 55)),
//         ),
//         leading: IconButton(
//             onPressed: () {},
//             icon: Icon(
//               CupertinoIcons.text_alignleft,
//               color: Color.fromARGB(255, 64, 59, 55),
//               size: 28,
//             )),
//       ),
//       body: GridView.builder(
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//           itemCount: notes.length,
//           itemBuilder: ((BuildContext context, int index) {
//             NoteModal note = notes[index];
//             return GestureDetector(
//               onTap: () async { final NoteModal noteModal = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: ((context) => EditNote(note: note))));
//                 int index = notes.indexWhere(((element) {
//                   return element.id == note.id;
//                 }));
//                 setState(() {
//                   notes[index] =  noteModal;
//                 });
//               },
//               child: Card(
//                 margin: EdgeInsets.only(
//                   top: 20,
//                   left: 15,
//                 ),
//                 color: Color.fromARGB(255, 255, 255, 255),
//                 child: Container(
//                   // fit: BoxFit.contain,
//                   padding: EdgeInsets.only(top: 10),
//                   child: Column(
//                     children: [
//                       Text(
//                         note.title,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 18,
//                             color: Color.fromARGB(255, 82, 81, 81)),
//                       ),
//                       Text(
//                         note.description,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16,
//                             color: Color.fromARGB(255, 106, 106, 106)),
//                       ),
//                       Container(
//                 alignment: Alignment.bottomRight,
//                 margin: const EdgeInsets.only(left: 60, top: 60),
//                 child: IconButton(
//                     onPressed: () {
//                        Provider.of<NotesProviders>(context,listen: false).removeNotes(index);
//                     },
//                     icon: const Icon(
//                       Icons.delete,
//                       size: 30,
//                     )),
//               ),

//                     ],
//                   ),
//                 ),
//               ),
//             );
//           })),
//       floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.white,
//           child: Icon(
//             Icons.add,
//             color: Colors.black,
//           ),
//           onPressed: () async {
//             NoteModal note = await Navigator.of(context)
//                 .push(MaterialPageRoute(builder: (context) => AddNote()));
//             setState(() {
//               notes.add(note);
//             });
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:note_provider/note_provider/add.dart';

class CustomFloating_btn extends StatelessWidget {
  const CustomFloating_btn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNote(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

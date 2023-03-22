import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomTextField(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80, left: 25),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}

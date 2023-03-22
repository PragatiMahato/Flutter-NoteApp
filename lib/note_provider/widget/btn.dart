import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnText;
  final Color? btncolor;
  final VoidCallback callback;
  final double? borderRadius;

  const Button(
      {super.key,
      required this.btnText,
       this.btncolor,
      required this.callback,
       this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      height: 80,
      width: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btncolor?? const Color.fromARGB(255, 217, 50, 31).withOpacity(0.8)),
      child: TextButton(
        
          onPressed: callback,
          child:  Text(
            btnText,
            style: const TextStyle(
                fontFamily: 'Nunito', fontSize: 22, color: Colors.white),
          )),
    );
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              //box outerline
              borderSide: BorderSide(color: Color.fromARGB(255, 212, 211, 211)),
            ),
            focusedBorder: const OutlineInputBorder(
              //outerline gets colored
              borderSide:
                  BorderSide(color: Color.fromRGBO(17, 106, 123, 0.992)),
            ),
            //background box
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            filled: true,
            hintText: hintText,
            hintStyle:
                //hinttext
                const TextStyle(color: Color.fromARGB(255, 140, 139, 139))),
      ),
    );
  }
}

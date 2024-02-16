import 'package:flutter/material.dart';
import 'package:front_end/logScreen.dart';

class MyButtonLog extends StatelessWidget {
  final Function()? onTap;
  const MyButtonLog({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
            Navigator.push( // Navigate to LogScreen
              context,
              MaterialPageRoute(builder: (context) =>  LogScreen()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "Log In",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
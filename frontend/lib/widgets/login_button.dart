import 'package:flutter/material.dart';
import 'package:front_end/screens/login_screen.dart';

class MyButtonLog extends StatelessWidget {
  final Function()? onTap;
  const MyButtonLog({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
            Navigator.push(
              // Navigate to LogScreen
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
        },
        child: Container(
          width: 210, // Adjust width as needed
          height: 60, // Adjust height as needed
          padding: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 25), // Adjust padding as needed
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white, // Background color white
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: Color.fromRGBO(0, 74, 173, 0.992)), // Border color black
          ),
          child: Center(
            child: Text(
              "Log In",
              style: TextStyle(
                color: Colors.black, // Text color black
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

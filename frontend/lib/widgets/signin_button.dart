import 'package:flutter/material.dart';
import 'package:front_end/screens/sign_up_screen.dart';

class MyButtonSign extends StatelessWidget {
  final Function()? onTap;
  const MyButtonSign({super.key, required this.onTap});

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
              MaterialPageRoute(builder: (context) => SignupPage()),
            );
          }
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(93, 224, 230, 0.992),
                Color.fromRGBO(0, 74, 173, 0.992)
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: 210, // Adjust width as needed
            height: 60, // Adjust height as needed
            child: Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

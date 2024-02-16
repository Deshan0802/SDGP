import 'package:flutter/material.dart';
import 'package:front_end/signupPage.dart';

class MyButtonSign extends StatelessWidget {
  final Function()? onTap;
  const MyButtonSign({Key? key, required this.onTap}) : super(key: key);

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
              MaterialPageRoute(builder: (context) => const SignupPage()),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 48, 141, 130),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "Sign In",
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

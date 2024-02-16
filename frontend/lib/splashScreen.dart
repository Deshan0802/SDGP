import 'dart:async';
import 'package:flutter/material.dart';
import 'package:front_end/welcomePage.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffd116a7b), Color(0xffdc2dedc)],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
    )));
  }
}

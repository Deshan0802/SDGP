import 'dart:async';
import 'package:flutter/material.dart';
import 'package:front_end/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
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
          width:
              MediaQuery.of(context).size.width * 1.0, // 100% of screen width
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(17, 106, 123, 0.992),
                Color.fromRGBO(194, 222, 220, 0.992)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Image Widget for the Logo (Circular Positioned)
              Positioned(
                top: MediaQuery.of(context).size.height *
                    0.3, // Adjust the value as needed
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.5, // Adjust the width as needed
                  height: MediaQuery.of(context).size.width *
                      0.5, // Adjust the height as needed
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/signup-login-screens/signwave-logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Text Widget for the App Name and Motto
              Positioned(
                bottom: MediaQuery.of(context).size.height *
                    0.3, // Adjust height after image LOGo
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SignWave',
                      style: TextStyle(
                        color: Color.fromARGB(255, 4, 4, 4),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Beyond Words, Within Reach',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
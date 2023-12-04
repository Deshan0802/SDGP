import 'dart:async';
import 'package:flutter/material.dart';
import 'package:asl_application/main.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){

      Navigator.pushReplacement(
          context as BuildContext,
          MaterialPageRoute(
            builder: (context)=>WelcomePage (),));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:Container(
              decoration: BoxDecoration(
                gradient:LinearGradient(
                  colors: [Color(0xFFd116A7B), Color(0xFFdC2DEDC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,

                ),

              ),



            )
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:front_end/widgets/reusable.dart';

class ASLToText extends StatelessWidget {
  const ASLToText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        headerText: 'ASL to Text',
        bottomSheetContent:
            'Easily Translate ASL Into English By Using Your Camera.',
      ),
      body: Center(
        child: Container(
          height: 450,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.redAccent, // choose your border color
              width: 2, // choose your border width
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                SizedBox(
                  height: 350,
                  width: 250,
                  child: Center(
                    child: Column(
                      children: [
                        const Center(
                          child: Text(
                            '"ASL to Text" functionality is currently being enhanced.',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Image.asset(
                          'assets/images/asl-to-text-screen/stay_tuned.gif',
                          height: 200,
                          width: 200,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

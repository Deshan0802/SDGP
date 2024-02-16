// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 220, 219, 219)),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[100]),
      child: Image.asset(
        imagePath,
        height: 35,
      ),
    );
  }
}

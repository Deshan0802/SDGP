import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio to ASL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const AudioToAsl(), // Displaying the AudioToAsl widget as the home page
    );
  }
}

class AudioToAsl extends StatefulWidget {
  const AudioToAsl({super.key});

  @override
  State<AudioToAsl> createState() => _AudioToAslState();
}

class _AudioToAslState extends State<AudioToAsl> {
  bool isRecordingButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // The back button in the app bar
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                "Transform your Audio to ASL ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                " Record an audio ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              _recordingSection(), // Calling the function
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 90), // Add horizontal padding
                child: MaterialButton(
                  minWidth: 0, // Set minWidth to 0
                  height: 60,
                  onPressed: () async {
                    setState(() {
                      isRecordingButtonSelected = !isRecordingButtonSelected;
                    });
                  },
                  color: isRecordingButtonSelected
                      ? const Color(0xFF820300)
                      : const Color(0xFF365486),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        isRecordingButtonSelected
                            ? 'assets/images/audio-to-asl-screen/stopicon.png'
                            : 'assets/images/audio-to-asl-screen/audio.png',
                        width: 30, // Set the width of the image
                        height: 30, // Set the height of the image
                      ),
                      const SizedBox(width: 20),
                      Text(
                        isRecordingButtonSelected
                            ? "Stop recording"
                            : "Start recording",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ), // Set button color based on the selected button
                ),
              ),
              const SizedBox(height: 20),

              _audioPlaySection(), // Calling the method to play the recording
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F1EB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _recordingSection() {
    return RippleAnimation(
      repeat: true,
      color: const Color(0xFF365486),
      minRadius: 40,
      ripplesCount: 6,
      child: Container(
        width: 110,
        height: 110,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFF7FC7D9),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          'assets/images/audio-to-asl-screen/audio.png',
          width: 50,
          height: 50,
        ),
      ),
    );
  }

  _audioPlaySection() {
    return Container(
      width: MediaQuery.of(context).size.width - 110,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF7FC7D9),
      ),
      child: Row(
        children: [
          _audioControl(),
          _audioProgress(),
        ],
      ),
    );
  }

  _audioControl() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.play_arrow_rounded),
      color: Colors.black,
      iconSize: 30,
    );
  }

  _audioProgress() {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: LinearPercentIndicator(
          percent: 1.0,
          backgroundColor: Colors.black,
          progressColor: Colors.white,
        ),
      ),
    );
  }
}

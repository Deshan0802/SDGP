import 'package:flutter/material.dart';
import 'package:front_end/screens/asl_to_text_screen.dart';
import 'package:front_end/screens/audio_to_asl_screen.dart';
import 'package:front_end/screens/documet_to_asl_screen.dart';
import 'package:front_end/screens/profile_screen.dart';
import 'package:front_end/screens/text_to_asl_screen.dart';
import 'package:front_end/widgets/reusable.dart';

class newDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color
                  blurRadius: 8, // Spread radius
                  offset: const Offset(0, 3), // Shadow offset
                ),
              ],
            ),
            // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      'DashBoard',
                      style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Welcome User!',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40, 20, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      },
                      child: Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade800,
                        ),
                        child: const Icon(
                          Icons.person_2_outlined,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListView(
                children: [
                  Row(
                    children: [
                      FeatureSection(
                        color: Color.fromARGB(255, 25, 217, 169),
                        iconType: Icons.translate,
                        featureName: "Text To ASL",
                        featureDescription: 'Converts English Text Into ASL',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TextToASL()),
                          );
                        },
                      ),
                      FeatureSection(
                        color: Colors.purple.shade300,
                        iconType: Icons.picture_as_pdf_outlined,
                        featureName: "Documents",
                        featureDescription: 'Converts Documnets Into ASL',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PdfToAsl()),
                          );
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      FeatureSection(
                        color: Colors.yellowAccent.shade700,
                        featureName: "Audio To ASL",
                        iconType: Icons.audio_file_outlined,
                        featureDescription: 'Converts Audio Files Into ASL',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AudioToAsl()),
                          );
                        },
                      ),
                      FeatureSection(
                        color: Colors.redAccent.shade400,
                        featureName: "ASL To Text",
                        iconType: Icons.sign_language,
                        featureDescription:
                            "Converts ASL Guestures Into English Language",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ASLToText()),
                          );
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      FeatureSection(
                        color: Colors.blue.shade300,
                        featureName: "ASL For Videos",
                        iconType: Icons.video_camera_back_outlined,
                        featureDescription: "Generate ASL Captions For Videos",
                        // onTap: () {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => newVideoToASL()),
                        //     );
                        // },
                      ),
                      FeatureSection(
                        color: Colors.greenAccent.shade400,
                        featureName: "ASL For YouTube",
                        iconType: Icons.play_circle_fill,
                        featureDescription: "Generate ASL Captions For YouTube",
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

// Feature Section
class FeatureSection extends StatelessWidget {
  late Color color;
  final String featureName;
  final String featureDescription;
  final IconData iconType;

  final VoidCallback? onTap;

  FeatureSection({
    required this.color,
    required this.featureName,
    required this.iconType,
    required this.featureDescription,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        padding: const EdgeInsets.all(20.0),
        height: 180,
        decoration: BoxDecoration(
          color: color,
          borderRadius:
              BorderRadius.circular(17), // Adjust the radius as needed
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              blurRadius: 10, // Spread radius
              offset: const Offset(0, 3), // Shadow offset
              spreadRadius: -2,
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                iconType,
                color: Colors.white,
                size: 42,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                featureDescription,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                featureName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

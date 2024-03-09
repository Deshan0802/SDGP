import 'package:flutter/material.dart';
import 'package:front_end/screens/audio_to_asl_screen.dart';
import 'package:front_end/screens/pdf_to_asl_screen.dart';
import 'package:front_end/screens/profile_screen.dart';
import 'package:front_end/screens/text_to_asl_screen.dart';
import 'package:front_end/widgets/reusable.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  // int currentIndex = 0; moved to ReUsable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const CustomHeaderText(
                    headerText: 'DashBoard', headerTextSize: 48.0),
                CustomWhiteBox(
                  whiteBox: _buildProfileRow(),
                  verticalMargin: 10.0,
                  horizontalMargin: 0.0,
                  verticalPadding: 16.0,
                  horizontalPadding: 16.0,
                ),
                CustomWhiteBox(
                  whiteBox: _buildConversionOptions(),
                  verticalMargin: 10.0,
                  horizontalMargin: 0.0,
                  verticalPadding: 16.0,
                  horizontalPadding: 16.0,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  List<Widget> _buildProfileRow() {
    return [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildProfileIcon(),
            _buildProfileDetails(),
          ],
        ),
      )
    ];
  }

  Widget _buildProfileIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 47, 122, 1),
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: const Icon(
        Icons.person,
        size: 75,
        color: Colors.white,
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              const Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 47, 122, 1),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 47, 122, 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: const Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildConversionOptions() {
    return [
      Column(
        children: [
          _buildConversionText('Convert Text To ASL'),
          CustomBlueBox(
            firstElementName: 'Text',
            thirdElementName: 'ASL',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TextToASL()),
              );
            },
            buttonVerticalMargin: 10.0,
            buttonHorizontalMargin: 10.0,
          ),
          _buildConversionText('Convert PDF To ASL'),
          CustomBlueBox(
            firstElementName: 'PDF',
            thirdElementName: 'ASL',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PdfToAsl()),
              );
            },
            buttonVerticalMargin: 10.0,
            buttonHorizontalMargin: 10.0,
          ),
          _buildConversionText('Convert Image To ASL'),
          const CustomBlueBox(
            firstElementName: 'Image',
            thirdElementName: 'ASL',
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ImageToASL()),
            //   );
            // },
            buttonVerticalMargin: 10.0,
            buttonHorizontalMargin: 10.0,
          ),
          _buildConversionText('Convert Audio To ASL'),
          CustomBlueBox(
            firstElementName: 'Audio',
            thirdElementName: 'ASL',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AudioToAsl()),
              );
            },
            buttonVerticalMargin: 10.0,
            buttonHorizontalMargin: 10.0,
          ),
          _buildConversionText('Convert Video To ASL'),
          const CustomBlueBox(
            firstElementName: 'Video',
            thirdElementName: 'ASL',
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => VideoToASL()),
            //   );
            // },
            buttonVerticalMargin: 10.0,
            buttonHorizontalMargin: 10.0,
          ),
          _buildConversionText('Convert ASL To Text'),
          const CustomBlueBox(
            firstElementName: 'ASL',
            thirdElementName: 'Text',
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => ASLToText()),
            //   );
            // },
            buttonVerticalMargin: 10.0,
            buttonHorizontalMargin: 10.0,
          ),
        ],
      ),
    ];
  }

  Widget _buildConversionText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(0, 47, 122, 1),
      ),
    );
  }
}

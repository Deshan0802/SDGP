import 'package:flutter/material.dart';
import 'package:front_end/audioToAsl.dart';
import 'package:front_end/pdf_to_asl_page.dart';
import 'package:front_end/profile_page.dart';
// import 'package:front_end/imageToAsl.dart';
// import 'package:front_end/PDFToASL.dart';
// import 'package:front_end/VideoToASL.dart';
import 'package:front_end/reUsable.dart';
import 'package:front_end/textToASL.dart';
// import 'package:mytest/ASLToText.dart';

class DashBoard extends StatefulWidget {
  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  // int currentIndex = 0; moved to ReUsable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                CustomHeaderText(headerText: 'DashBoard', headerTextSize: 48.0),
                CustomWhiteBox(
                  whiteBox: _buildProfileRow(),
                  VerticalMargin: 10.0,
                  HorizontalMargin: 0.0,
                  VerticalPadding: 16.0,
                  HorizontalPadding: 16.0,
                ),
                CustomWhiteBox(
                  whiteBox: _buildConversionOptions(),
                  VerticalMargin: 10.0,
                  HorizontalMargin: 0.0,
                  VerticalPadding: 16.0,
                  HorizontalPadding: 16.0,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 47, 122, 1),
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Icon(
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
              Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 47, 122, 1),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 47, 122, 1),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: Text(
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
                MaterialPageRoute(builder: (context) => TextToASL()),
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
                MaterialPageRoute(builder: (context) => const pdfToAsl()),
              );
            },
            buttonVerticalMargin: 10.0,
            buttonHorizontalMargin: 10.0,
          ),
          _buildConversionText('Convert Image To ASL'),
          CustomBlueBox(
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
                MaterialPageRoute(builder: (context) => audioToAsl()),
              );
            },
            buttonVerticalMargin: 10.0,
            buttonHorizontalMargin: 10.0,
          ),
          _buildConversionText('Convert Video To ASL'),
          CustomBlueBox(
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
          CustomBlueBox(
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
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(0, 47, 122, 1),
      ),
    );
  }
}

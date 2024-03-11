import 'package:flutter/material.dart';
import 'package:front_end/screens/newTextToASL.dart';
import 'package:front_end/screens/ReUsable.dart';
import 'package:front_end/screens/newTextToASL.dart';
// import 'package:mytest/newVideoToASL.dart';

class newDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            WelocmeSection(),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0,),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        FeatureSection(
                            color: Colors.tealAccent.shade400,
                            iconType: Icons.handshake,
                            featureName: "Text To ASL",
                            featureDescription: 'Converts Inputed into ASL',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => newTextToASL()),
                                );
                            },
                        ),
                        FeatureSection(
                            color: Colors.purple.shade300,
                            iconType: Icons.picture_as_pdf_outlined,
                            featureName: "Documents",
                            featureDescription: 'Converts Documnets into ASL',)
                      ],
                    ),
                    Row(
                      children: [
                        FeatureSection(
                            color: Colors.yellowAccent.shade700,
                            featureName: "Audio To ASL",
                            iconType: Icons.audio_file_outlined,
                            featureDescription: 'Converts Audio files into ASL',),
                        FeatureSection(
                            color: Colors.redAccent.shade400,
                            featureName: "ASL To Text",
                            iconType: Icons.text_fields,
                            featureDescription: "Converts ASL Guestures into redable Text",)
                      ],
                    ),
                    Row(
                      children: [
                        FeatureSection(
                            color: Colors.deepPurple.shade400,
                            featureName: "Image To ASL",
                            iconType: Icons.image,
                            featureDescription: "Converts an Image into ASL",),
                        FeatureSection(
                            color: Colors.deepOrange,
                            featureName: "Video To ASL",
                            iconType: Icons.video_camera_back_outlined,
                            featureDescription: "Converts Video into ASL",
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => newVideoToASL()),
                            //     );
                            // },
                            )
                      ],
                    ),
                    Row(
                      children: [
                        FeatureSection(
                            color: Colors.blue.shade300,
                            featureName: "Image To ASL",
                            iconType: Icons.image,
                            featureDescription: "Converts an Image into ASL",),
                        FeatureSection(
                            color: Colors.greenAccent.shade400,
                            featureName: "Video To ASL",
                            iconType: Icons.video_camera_back_outlined,
                            featureDescription: "Converts Video into ASL",)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class WelocmeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              blurRadius: 10.0, // Spread radius
              offset: Offset(0, 3), // Shadow offset
            ),
          ],
        ),
      // margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DashBoard',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome User',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade800,
            ),
            child: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureSection extends StatelessWidget {
  late Color color;
  final String featureName;
  final String featureDescription;
  final IconData iconType;

  final VoidCallback? onTap;
  
  FeatureSection(
      {required this.color, required this.featureName, required this.iconType, required this.featureDescription, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
        padding: EdgeInsets.all(20.0),
        height: 170,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5), // Shadow color
              blurRadius: 10.0, // Spread radius
              offset: Offset(0, 3), // Shadow offset
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
                size: 40.0,
              ),
              Text(
                featureDescription,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                ),
              ),
              Text(
                featureName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
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

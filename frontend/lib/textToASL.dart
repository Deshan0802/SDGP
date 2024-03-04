import 'package:flutter/material.dart';
import 'reUsable.dart';

class TextToASL extends StatefulWidget {
  @override
  TextToASLState createState() => TextToASLState();
}

class TextToASLState extends State<TextToASL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 217, 217, 1),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  CustomBackButton(),
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: CustomHeaderText(
                            headerText: 'Translator',
                            headerTextSize: 32.0,
                          ))),
                  SizedBox(
                    width: 60.0,
                  ),
                ],
              ),
              CustomBlueBox(
                firstElementName: 'English',
                thirdElementName: 'ASL',
                buttonVerticalMargin: 10.0,
                buttonHorizontalMargin: 0.0,
              ),
              CustomWhiteBox(
                whiteBox: <Widget>[
                  CustomPointlessButton(
                    borderRaduis: 10.0,
                    buttonHeight: 10.0,
                    buttonLength: 20.0,
                    buttonName: 'English',
                  ),
                  TextField(
                    maxLines: 5,
                  ),
                ],
                VerticalMargin: 10.0,
                HorizontalMargin: 0.0,
                VerticalPadding: 16.0,
                HorizontalPadding: 16.0,
              ),
              CustomWhiteBox(
                whiteBox: <Widget>[
                  CustomPointlessButton(
                    borderRaduis: 10.0,
                    buttonHeight: 10.0,
                    buttonLength: 20.0,
                    buttonName: 'ASL',
                  ),
                ],
                VerticalMargin: 10.0,
                HorizontalMargin: 0.0,
                VerticalPadding: 16.0,
                HorizontalPadding: 16.0,
              ),
              CustomButton(
                borderRaduis: 30.0,
                buttonVerticalPadding: 10.0,
                buttonHorizontalPadding: 20.0,
                buttonName: "Convert",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

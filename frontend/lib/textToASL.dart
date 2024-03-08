import 'package:flutter/material.dart';
import 'reUsable.dart';
import 'package:http/http.dart' as http;

class TextToASL extends StatefulWidget {
  @override
  TextToASLState createState() => TextToASLState();
}

class TextToASLState extends State<TextToASL> {
  TextEditingController _textEditingController = TextEditingController();

  Future<void> _sendTextToBackend(String text) async {
    var url = Uri.parse('http://10.0.2.2:8000/textToAsl');
    var response = await http.post(url, body: {'text': text});
    if (response.statusCode == 200) {
      // Successfully sent text to the backend
      print('Text sent successfully');
    } else {
      // Handle errors
      print('Failed to send text: ${response.statusCode}');
    }
  }

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
              ElevatedButton(
                onPressed: () {
                  _sendTextToBackend(_textEditingController.text);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  backgroundColor:
                      Color.fromRGBO(0, 47, 122, 1), // Background color
                ),
                child: Text(
                  'Convert',
                  style: TextStyle(
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

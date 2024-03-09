import 'package:flutter/material.dart';
import 'package:front_end/reusable.dart';
import 'package:http/http.dart' as http;

class TextToASL extends StatefulWidget {
  const TextToASL({super.key});

  @override
  TextToASLState createState() => TextToASLState();
}

class TextToASLState extends State<TextToASL> {
  final TextEditingController _textEditingController = TextEditingController();

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
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const Row(
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
              const CustomBlueBox(
                firstElementName: 'English',
                thirdElementName: 'ASL',
                buttonVerticalMargin: 10.0,
                buttonHorizontalMargin: 0.0,
              ),
              const CustomWhiteBox(
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
                verticalMargin: 10.0,
                horizontalMargin: 0.0,
                verticalPadding: 16.0,
                horizontalPadding: 16.0,
              ),
              const CustomWhiteBox(
                whiteBox: <Widget>[
                  CustomPointlessButton(
                    borderRaduis: 10.0,
                    buttonHeight: 10.0,
                    buttonLength: 20.0,
                    buttonName: 'ASL',
                  ),
                ],
                verticalMargin: 10.0,
                horizontalMargin: 0.0,
                verticalPadding: 16.0,
                horizontalPadding: 16.0,
              ),
              ElevatedButton(
                onPressed: () {
                  _sendTextToBackend(_textEditingController.text);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  backgroundColor:
                      const Color.fromRGBO(0, 47, 122, 1), // Background color
                ),
                child: const Text(
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
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

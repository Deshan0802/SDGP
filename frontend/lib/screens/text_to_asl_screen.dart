import 'package:flutter/material.dart';
import 'package:front_end/widgets/reusable.dart';
import 'package:front_end/widgets/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class TextToASL extends StatefulWidget {
  const TextToASL({Key? key}) : super(key: key);

  @override
  TextToASLState createState() => TextToASLState();
}

class TextToASLState extends State<TextToASL> {
  String _textFieldValue = '';
  // String _baseApiURL = 'http://ip_address_backend:5000/textToASL';
  String _baseApiURL = 'http://127.0.0.1:5000/textToASL';
  String _api = '';

  void _resetApi() {
    setState(() {
      _api = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            newHeader(
              headerTextInfo: 'Converts Input Text Into ASL',
              headerText: 'Text To ASL',
            ),
            Transform.scale(
              scale: 1,
              child: VideoPlayerScreen(
                api: _api,
                resetApi: _resetApi,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: TextField(
                maxLines: 1,
                onChanged: (value) {
                  setState(() {
                    _textFieldValue = value;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade400,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: InkWell(
                onTap: () {
                  // Perform any desired action with _textFieldValue
                  setState(() {
                    _api = _baseApiURL + '?inputText=' + _textFieldValue;
                  });
                  print(_api);
                },
                child: Text(
                  'Generate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

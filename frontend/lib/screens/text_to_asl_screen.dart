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
  String _baseApiURL = 'http://10.0.2.2:5000/textToASL';
  String _api = '';

  void _resetApi() {
    setState(() {
      _api = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          headerText: "Text To ASL",
          bottomSheetContent: 'Converts Input Text Into ASL.'),
        bottomNavigationBar: CustomNavigationBar(),
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          // bottomNavigationBar: CustomNavigationBar(),
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
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
        ));
  }
}

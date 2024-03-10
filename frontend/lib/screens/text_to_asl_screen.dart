import 'package:flutter/material.dart';
import 'package:front_end/widgets/reusable.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class TextToASL extends StatefulWidget {
  const TextToASL({Key? key}) : super(key: key);

  @override
  TextToASLState createState() => TextToASLState();
}

class TextToASLState extends State<TextToASL> {
  final TextEditingController _textEditingController = TextEditingController();

  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  Future<void> _sendTextToBackend(String text) async {
    var url = Uri.parse('http://10.0.2.2:8000/text_to_asl');
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
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(
      'assets/videos/after.mp4',
    );
    _initializeVideoPlayerFuture = _videoController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
      appBar: AppBar(
        title: const Text(
          'Text to ASL',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.blueGrey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                CustomWhiteBox(
                  // Removed const keyword
                  whiteBox: <Widget>[
                    const CustomPointlessButton(
                      borderRaduis: 10.0,
                      buttonHeight: 10.0,
                      buttonLength: 20.0,
                      buttonName: 'English',
                    ),
                    TextField(
                      controller: _textEditingController,
                      maxLines: 3,
                    ),
                  ],
                  verticalMargin: 10.0,
                  horizontalMargin: 0.0,
                  verticalPadding: 15.0,
                  horizontalPadding: 15.0,
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
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  width: 290,
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_videoController.value.isPlaying) {
                        _videoController.pause();
                      } else {
                        _videoController.play();
                      }
                    });
                  },
                  backgroundColor: const Color.fromRGBO(0, 47, 122, 1),
                  foregroundColor: Colors.white,
                  mini: true,
                  child: Icon(
                    _videoController.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

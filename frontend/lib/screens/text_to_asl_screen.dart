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
    var url = Uri.parse('http://10.0.2.2:8000/text-to-asl');
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
      backgroundColor: Color.fromARGB(255, 220, 220, 220),
      appBar: const CustomAppBar(
        headerText: 'Text to ASL',
        bottomSheetContent: ('Converts Input Text Into ASL'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),

                //ASL output section
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: SizedBox(
                        height: 300,
                        width: 290,
                        child: FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
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
                      backgroundColor: Colors.black,
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
                const SizedBox(height: 20),

                //English text input section
                Column(
                  children: [
                    CustomWhiteBox(
                      whiteBox: <Widget>[
                        Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          child: const Center(
                            child: Text(
                              'English',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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
                    ElevatedButton.icon(
                      onPressed: () {
                        _sendTextToBackend(_textEditingController.text);
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text("Convert"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Background color
                        foregroundColor: Colors.white, // Text color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

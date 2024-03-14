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
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(
        headerText: 'Text to ASL',
        bottomSheetContent: ('Converts Input Text Into ASL'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30),

                //ASL output section
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
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
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: FloatingActionButton(
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
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _videoController.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                _videoController.value.isPlaying
                                    ? 'Pause'
                                    : 'Play',
                              ),
                              const SizedBox(width: 6),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                //English text input section
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Text(
                                  'English',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _textEditingController,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 310,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _textEditingController.clear();
                              },
                              icon: const Icon(Icons.clear_all),
                              label: const Text("Clear All"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 137, 137, 137),
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                _sendTextToBackend(_textEditingController.text);
                              },
                              icon: const Icon(Icons.refresh),
                              label: const Text("Convert"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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

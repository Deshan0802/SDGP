import 'package:flutter/material.dart';
import 'package:front_end/widgets/reusable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ASLForYtb extends StatefulWidget {
  const ASLForYtb({Key? key}) : super(key: key);

  @override
  _ASLForYtbState createState() => _ASLForYtbState();
}

class _ASLForYtbState extends State<ASLForYtb> {
  late YoutubePlayerController _controller;
  TextEditingController _urlController = TextEditingController();
  String? _videoId;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _urlController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _loadVideo() {
    final videoId = YoutubePlayer.convertUrlToId(_urlController.text);
    if (videoId != null) {
      setState(() {
        _videoId = videoId;
        _controller.load(videoId); // Load the new video
      });
      // Remove focus from text field to dismiss keyboard
      _focusNode.unfocus();
    } else {
      // Handle invalid URL
      // You can show a snackbar or display an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid YouTube URL'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        headerText: 'ASL For YouTube',
        bottomSheetContent: 'Generate ASL Translations For YouTube Videos.',
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: SizedBox(
          child: Column(
            children: [
              // Output section
              const SizedBox(
                height: 3,
              ),
              if (_videoId != null)
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                )
              else
                Container(
                  width: double.infinity,
                  height: 225,
                  color: const Color.fromARGB(
                      255, 203, 203, 203), // Placeholder color
                  child: const Center(
                    child: Text('Video Preview'),
                  ),
                ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 225,
                width: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: const Center(child: Text('ASL Translations')),
              ),
              const SizedBox(
                height: 50,
              ),
              // Input Section
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _urlController,
                  focusNode: _focusNode,
                  style: const TextStyle(fontSize: 12),
                  decoration: const InputDecoration(
                    labelText: 'Enter YouTube URL',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1), // Adjust the width of the border
                    ),
                    contentPadding: EdgeInsets.fromLTRB(
                        12, 8, 8, 8), // Adjust the vertical padding
                  ),
                ),
              ),

              ElevatedButton.icon(
                onPressed: _loadVideo,
                icon: const Icon(Icons.refresh),
                label: const Text("Load Video"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:front_end/widgets/reusable.dart';
import 'package:video_player/video_player.dart';

class VideoToASL extends StatefulWidget {
  const VideoToASL({Key? key}) : super(key: key);

  @override
  _VideoToASLState createState() => _VideoToASLState();
}

class _VideoToASLState extends State<VideoToASL> {
  VideoPlayerController? _videoController;
  bool _showPlayButton = false;

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          headerText: 'ASL for Videos',
          bottomSheetContent: 'Generates ASL Translations For Video Files'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 325,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Stack(
                  children: [
                    if (_videoController != null &&
                        _videoController!.value.isInitialized)
                      FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _videoController!.value.size.width,
                          height: _videoController!.value.size.height,
                          child: AspectRatio(
                            aspectRatio: _videoController!.value.aspectRatio,
                            child: VideoPlayer(_videoController!),
                          ),
                        ),
                      ),
                    if (_videoController != null &&
                        _videoController!.value.isInitialized &&
                        !_videoController!.value.isPlaying &&
                        _showPlayButton)
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _openFullScreenVideo();
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: const Text("Play"),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles(
                      type: FileType.video, // Only allow video files
                      allowMultiple: false,
                    );
                    if (result != null) {
                      // Handle selected file
                      PlatformFile file = result.files.first;
                      String? filePath = file.path;
                      if (filePath != null) {
                        // Initialize the video player with the selected video
                        _videoController =
                            VideoPlayerController.file(File(filePath));
                        // Listen for when the video player is initialized
                        _videoController!.initialize().then((_) {
                          // Update the state to rebuild the widget with the video player
                          setState(() {
                            _showPlayButton = true;
                          });
                        });
                      }
                    }
                  } catch (e) {
                    print('Error picking video file: $e');
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
                child: const SizedBox(
                  height: 75,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.video_library, // Changed icon to video icon
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Select video",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle conversion logic
                  // For demonstration, I'm setting ASL Translation to the video file path
                  if (_videoController != null) {
                    _videoController!.pause();
                    // Display the video file path in ASL Translation Box
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('ASL Translation'),
                          content: Text(_videoController!.dataSource ??
                              'No video selected'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                icon: const Icon(Icons.refresh),
                label: const Text("Convert"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Background color
                  foregroundColor: Colors.white, // Text color
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  void _openFullScreenVideo() {
    if (_videoController != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text(
                'Selected Video',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Center(
              child: AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              ),
            ),
          ),
        ),
      );
      _videoController!.play();
    }
  }
}

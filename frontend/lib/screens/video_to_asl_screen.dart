import 'dart:io';
import 'package:chewie/chewie.dart';
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
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool _showPlayButton = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          headerText: "ASL for Videos",
          bottomSheetContent: 'Generate ASL Translations For Videos.'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 350,
                height: 410,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: _chewieController != null &&
                        _chewieController!
                            .videoPlayerController.value.isInitialized
                    ? Chewie(
                        controller: _chewieController!,
                      )
                    : Center(
                        child: _showPlayButton
                            ? ElevatedButton.icon(
                                onPressed: _openFullScreenVideo,
                                icon: const Icon(Icons.play_arrow),
                                label: const Text("Play"),
                              )
                            : ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.7),
                                  BlendMode.srcOver,
                                ),
                                child: Image.asset(
                                  'assets/images/video-to-asl-screen/video_icon.jpg',
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 200,
                width: 200,
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
                        _videoController =
                            VideoPlayerController.file(File(filePath));
                        await _videoController.initialize();
                        _chewieController = ChewieController(
                          videoPlayerController: _videoController,
                          autoPlay: false,
                          looping: false,
                          // Other chewie options can be set here
                        );
                        setState(() {
                          _showPlayButton = true;
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
                        Icons.video_library,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Select video",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  if (_videoController.value.isInitialized) {
                    _videoController.pause();
                    // Display the video file path in ASL Translation Box
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('ASL Translation'),
                          content: Text(_videoController.dataSource!),
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
                  } else {
                    // Handle case where _videoController is not initialized
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('ASL Translation'),
                          content: const Text('No video selected'),
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
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  void _openFullScreenVideo() {
    if (_videoController.value.isInitialized) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text(
                'Selected Video',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
              ),
            ),
            body: Center(
              child: AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              ),
            ),
          ),
        ),
      );
      _videoController.play();
    }
  }
}

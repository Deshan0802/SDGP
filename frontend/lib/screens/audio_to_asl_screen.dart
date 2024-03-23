import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:front_end/widgets/reusable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio To ASL',
      home: AudioToAsl(),
    );
  }
}

class AudioToAsl extends StatefulWidget {
  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioToAsl> {
  FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  bool _isRecording = false;
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _recorder.openAudioSession();
    _filePath = (await getTemporaryDirectory()).path + '/test.aac';
    print('File path: $_filePath');
    await _requestMicrophonePermission();
  }

  Future<void> _requestMicrophonePermission() async {
    PermissionStatus status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Microphone permission not granted');
    }
  }

  @override
  void dispose() {
    _recorder.closeAudioSession();
    super.dispose();
  }

  Future<void> _toggleRecording() async {
    if (!_isRecording) {
      try {
        await _recorder.startRecorder(toFile: _filePath);
        setState(() {
          _isRecording = true;
        });
      } catch (e) {
        print('Failed to start recording: $e');
      }
    } else {
      try {
        await _recorder.stopRecorder();
        setState(() {
          _isRecording = false;
        });
      } catch (e) {
        print('Failed to stop recording: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          headerText: 'Audio To ASL',
          bottomSheetContent: 'Converts Audio Files Or Voice Clips Into ASL'),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: const Center(child: Text('ASL Translation')),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                //Handle play logic
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text("Play"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Background color
                foregroundColor: Colors.white, // Text color
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            //Input section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.audio,
                        allowMultiple: false,
                      );
                      if (result != null) {
                        // Handle selected file
                        PlatformFile file = result.files.first;
                        String? filePath = file.path;
                        if (filePath != null) {
                          // Do something with the selected file path
                          print('Selected file path: $filePath');
                        }
                      }
                    } catch (e) {
                      print('Error picking audio file: $e');
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
                          Icons.audio_file,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Select file",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Record Your Audio Here',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: ElevatedButton(
                                    onPressed: _toggleRecording,
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(20),
                                      shape: const CircleBorder(),
                                      backgroundColor: _isRecording
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                    child: Icon(
                                      _isRecording ? Icons.stop : Icons.mic,
                                      size: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Logic for selecting audio file
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  },
                                  style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        color: Colors.black, width: 2),
                                    textStyle: const TextStyle(fontSize: 13),
                                  ),
                                  child: const Text(
                                    'Select This Recording',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
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
                          Icons.mic,
                          color: Colors.black,
                          size: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Record",
                          style: TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                //Handle conversion logic (Send audio file to backend)
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
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

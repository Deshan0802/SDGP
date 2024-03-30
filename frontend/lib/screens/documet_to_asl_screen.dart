import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:front_end/widgets/reusable.dart';
import 'package:front_end/widgets/vid_widget.dart';
import 'package:image_picker/image_picker.dart';

class PdfToAsl extends StatefulWidget {
  const PdfToAsl({Key? key});

  @override
  _PdfToAslState createState() => _PdfToAslState();
}

class _PdfToAslState extends State<PdfToAsl> {
  String uploadFileUrlDocument = 'http://192.168.1.4:8000/document-to-asl';
  String downloadTranslationUrlDocument =
      'http://192.168.1.4:8000/download-translation-document';
  String _url = '';
  String? filePath;

  Future<void> _openFileExplorer(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        print('File picked: ${result.files.single.path}');
        final file = File(result.files.single.path!);
        filePath = result.files.single.path;
        // await _uploadFile(file, context);
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  void _resetUrl() {
    setState(() {
      _url = '';
    });
  }

  // Future<void> _uploadFile(File file, BuildContext context) async {
  //   try {
  //     var uri = Uri.parse(uploadFileUrlDocument);
  //     var request = http.MultipartRequest('POST', uri)
  //       ..files.add(await http.MultipartFile.fromPath(
  //         'file',
  //         file.path,
  //       ));

  //     var response = await request.send();

  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _url = 'Your generated URL'; // Update with actual URL if needed
  //       });
  //       print('File uploaded successfully');
  //     } else {
  //       print('Failed to upload file');
  //     }
  //   } catch (e) {
  //     print('Error uploading file: $e');
  //   }
  // }

  Future<void> _openCamera(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // Do something with the picked image
      print('Image picked: ${pickedImage.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        headerText: 'Documents to ASL',
        bottomSheetContent: ('Translate PDF Documents Into ASL'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                // Add your ASL conversion section here
                const SizedBox(height: 20),

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
                  child: Center(
                    child: Transform.scale(
                      scale: 1,
                      child: VideoPlayerWidget(
                        url: _url,
                        resetUrl: _resetUrl,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 60),

                // Input section
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _openFileExplorer(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                        child: SizedBox(
                          height: 75,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.picture_as_pdf,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Select file",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add space between the buttons
                      ElevatedButton(
                        onPressed: () => _openCamera(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                        child: SizedBox(
                          height: 75,
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Scan",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () async {
                    var request = http.MultipartRequest(
                        'POST', Uri.parse(uploadFileUrlDocument));
                    request.files.add(
                        await http.MultipartFile.fromPath('file', filePath!));
                    var response = await request.send();
                    if (response.statusCode == 200) {
                      setState(() {
                        _url = downloadTranslationUrlDocument;
                      });
                    }
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text("Convert"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
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

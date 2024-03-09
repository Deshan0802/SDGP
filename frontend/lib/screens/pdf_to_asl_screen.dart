import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:front_end/widgets/reusable.dart';

class PdfToAsl extends StatelessWidget {
  const PdfToAsl({Key? key});

  Future<void> _openFileExplorer(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        // File selected, you can handle it here
        print('File picked: ${result.files.single.path}');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

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
      appBar: AppBar(
        title: const Text(
          'PDF to ASL',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, //Align children to the top
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _openFileExplorer(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.redAccent, width: 2),
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
                            Icons.picture_as_pdf,
                            color: Colors.red,
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
                    onPressed: () => _openCamera(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.redAccent, width: 2),
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
                            Icons.camera_alt,
                            color: Colors.red,
                            size: 30,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Scan",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  //Handle conversion logic
                },
                icon: const Icon(Icons.refresh),
                label: const Text("Convert"),
              ),
              const SizedBox(height: 50),

              //ASL section
              Container(
                height: 275,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                    'assets/images/document-to-asl-screen/model.png'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  //Handle play logic
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text("Play"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

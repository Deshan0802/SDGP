import 'package:flutter/material.dart';
import 'package:front_end/reUsable.dart';
import 'package:file_picker/file_picker.dart';

class pdfToAsl extends StatelessWidget {
  const pdfToAsl({Key? key}) : super(key: key);

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
                  height: 90,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.picture_as_pdf,
                        color: Colors.red,
                        size: 50,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Select file to convert",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ],
                  ),
                ),
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
                child: Image.asset('assets/model.png'),
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
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:front_end/widgets/reusable.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final List<String> dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    String headerText = "Help center";
    String bottomSheetContent =
        "This is the help center page. Contact us for any isssues!";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(93, 224, 230, 0.992),
        title: Text(
          headerText,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 100,
                    child: SizedBox.expand(
                      child: Center(
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            bottomSheetContent,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
        elevation: 2, //AppBar shadow
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(93, 224, 230, 0.992),
                Color.fromRGBO(0, 74, 173, 0.992)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Column(
                      children: [
                        SizedBox(height: 10),
                      ],
                    ),
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        'assets/images/help-center-screen/Help_center_image.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white, // Change the color to white
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How can we help you?',
                            style: TextStyle(
                                fontSize: 22,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Problem Description',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            child: TextField(
                              style: TextStyle(
                                  color: Colors
                                      .black), // Changed font color to black
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xfc116a7b),
                                    width: 2.0,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 70.0,
                                  horizontal: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // this is the Submit button
                      MaterialButton(
                        minWidth: 250,
                        height: 60,
                        onPressed: () async {},
                        child: Container(
                          width: 160,
                          height: 50,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 25,
                          ), // Adjust padding as needed
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(93, 224, 230, 0.992),
                                Color.fromRGBO(0, 74, 173, 0.992)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // Button
                          child: const Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Adjust font size as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

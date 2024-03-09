import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final List<String> dropdownOptions = ['Option 1', 'Option 2', 'Option 3'];
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // The back button in the app bar
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Column(
                children: [
                  Text(
                    'Help Center ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'How can we help you today?',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align children to the left
                children: [
                  Text(
                    'Frequently Asked',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection:
                    Axis.horizontal, // Setting the scroll direction vertically
                child: Row(
                  children: List.generate(
                    10,
                    (index) {
                      Color boxColor;
                      if (index % 4 == 0) {
                        boxColor = const Color(
                            0xFF86A7FC); // Changing the colors of the boxes one after the other
                      } else if (index % 4 == 1) {
                        boxColor = const Color(0xFFC499F3);
                      } else if (index % 4 == 2) {
                        boxColor = const Color(0xFFF875AA);
                      } else {
                        boxColor = const Color(0xFF99BC85);
                      }

                      return Container(
                        width:
                            120, // Return the boxes with selected height and width
                        height: 150,
                        color: boxColor, // Setting color of the boxes
                        margin: const EdgeInsets.all(8.0),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F1EB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align children to the left
                        children: [
                          Text(
                            'What type of problem do you have?',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Dropdown for selecting options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 250,
                            margin: const EdgeInsets.only(
                                left: 35), // Adjust the left margin as needed
                            child: DropdownButtonFormField<String>(
                              value: selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value;
                                });
                              },
                              items: dropdownOptions.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    width:
                                        200, // Adjust the width of the dropdown items if needed
                                    child: Text(value),
                                  ),
                                );
                              }).toList(),
                              hint: const Text('Select an option'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align children to the left
                        children: [
                          Text(
                            'Problem Description',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 350,
                            child: TextField(
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
                                  vertical: 30.0,
                                  horizontal: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                      MaterialButton(
                        minWidth: 200,
                        height: 40,
                        onPressed: () {},
                        color: const Color(0xFF99BC85),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
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
    );
  }
}
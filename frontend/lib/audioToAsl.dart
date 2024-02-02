import 'package:flutter/material.dart';

class audioToAsl extends StatefulWidget {
  @override
  _AudioToAslState createState() => _AudioToAslState();
}

class _AudioToAslState extends State<audioToAsl> {
  String playPauseImagePath = 'assets/pause.png';
  String recordImagePath = 'assets/record.png';

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
          icon: Icon(
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
            children: [
              Text(
                "Translator",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 50,
                width: 300,
                color: Color(0xFF86A7FC),
              ),
              SizedBox(height: 20),
              Text(
                " Record an audio ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFF9843),
                ),
                child: Image.asset(
                  'assets/audio1.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            playPauseImagePath =
                                (playPauseImagePath == 'assets/pause.png')
                                    ? 'assets/play.png'
                                    : 'assets/pause.png';
                          });
                        },
                        minWidth: 40,
                        height: 40,
                        child: Image.asset(
                          playPauseImagePath,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 25),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            recordImagePath =
                                (recordImagePath == 'assets/record.png')
                                    ? 'assets/tickmark.png'
                                    : 'assets/record.png';
                          });
                        },
                        minWidth: 40,
                        height: 70,
                        child: Image.asset(
                          recordImagePath,
                          width: 40,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 40),
                      MaterialButton(
                        onPressed: () {},
                        minWidth: 25,
                        height: 28,
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "-OR-",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: [
                    MaterialButton(
                      minWidth: 120,
                      height: 40,
                      onPressed: () {},
                      color: Color(0xFF99BC85),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Select audio file",
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
              SizedBox(height: 30),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F1EB),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
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

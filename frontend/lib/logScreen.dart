import 'package:flutter/material.dart';

import 'helpCenter.dart';

class logScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //Creating the appbar
        elevation: 0,
        backgroundColor:
            Color(0xFFdC2DEDC), // Setting the background color of the appbar
        leading: IconButton(
          onPressed: () {
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
          color: Color(0xFFdC2DEDC),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Log in to your account',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ), // Adjust the spacing between
              Expanded(
                child: Container(
                  // Creating a seperate box to include user inputs
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60, // Ajust the spacing between the containers
                      ),
                      Container(
                        width: 350,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                color: Color(0xFFd116A7B),
                                width: 2.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0,
                              horizontal: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 350, // Adjust the width of the container
                            child: TextField(
                              obscureText: true, // To take password input
                              decoration: InputDecoration(
                                // To take input from the user
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                    color: Color(0xFFd116A7B),
                                    width: 2.0,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.remove_red_eye),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  // Ajust the space between the box and the text
                                  vertical: 15.0,
                                  horizontal: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20, // Adjust the height
                          ),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      30.0), // Adjust the padding between the the right border
                              child: Text(
                                'Forgot password?',
                                textAlign:
                                    TextAlign.right, // Align the text right
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFd116A7B),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      MaterialButton(
                        minWidth: 250,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => helpCenter()));
                        },
                        color: Color(
                            0xFFd116A7B), // defining the shape of the sign in button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text('- OR -',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            )),
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

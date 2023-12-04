import 'package:flutter/material.dart';


class signupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Set to start here
          children: [
        Column(
        children: [
        Text(
        'Sign up',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Sign up to our page',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        ],
      ),
        SizedBox(   // To maintain the space between buttons
        height: 60,
      ),
        Column(
        children: [
          Container(
            width: 350, // Adjust the width of the container
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
        ],
      ),
            SizedBox(   // To maintain the space between buttons
              height: 40,
            ),
            Column(
              children: [
                Container(
                  width: 350, // Adjust the width of the container
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
              ],
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
                    decoration: InputDecoration(   // To take input from the user
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                          color: Color(0xFFd116A7B),
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed:null,
                        icon: Icon(Icons.remove_red_eye_sharp),
                      ),
                      contentPadding: EdgeInsets.symmetric( // Ajust the space between the box and the text
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ),

              ],
            ),



          ],),
    ),
      ),
    );

  }
}

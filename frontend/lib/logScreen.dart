import 'package:asl_application/homePage.dart';
import 'package:flutter/material.dart';


class logScreen extends StatelessWidget {  // For the log in screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // setting the background color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,   // Creating the back button to go to the previous page
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(  // To make the content scrollable
      child:Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Set to start here
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
            SizedBox(   // To maintain the space between buttons
              height: 60,
            ),
            Column(
              children: [
                Container(
                  width: 350, // Adjust the width of the container
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
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
                      hintText: 'Password',
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
            Column(
              children: [
                SizedBox(
                  height: 20,  // Adjust the height
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(right: 30.0), // Adjust the padding between the the right border
                    child: Text(
                      'Forgot password?',
                      textAlign: TextAlign.right, // Align the text right
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFd116A7B),
                      ),
                    ),
                  ),
                ),
              ],
            ),


            SizedBox(height:50),
            MaterialButton(
              minWidth: 250,
              height: 60,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> homePage()));

              },
              color: Color(0xFFd116A7B), // defining the shape of the sign in button
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text('- OR -',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              )),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
                minWidth: 250,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => homePage()));
                }
                ),
            
          ],
        ),
      ),
      ),
    );
  }
}
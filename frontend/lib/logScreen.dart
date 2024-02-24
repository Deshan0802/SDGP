// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:front_end/dashBoard.dart';
import 'package:front_end/signupPage.dart';
import 'helpCenter.dart';
import 'package:front_end/components/my_textfield.dart';
import 'package:front_end/components/square_tile.dart';

class LogScreen extends StatelessWidget {
  LogScreen({super.key});

  //text editing Controllers Omen

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //Creating the appbar
        elevation: 0,
        backgroundColor: const Color.fromARGB(
            252, 194, 222, 220), // Setting the background color of the appbar
        leading: IconButton(
          onPressed: () {
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
          color: const Color.fromARGB(252, 194, 222, 220),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 2, // Adjust the width of the border as needed
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/Haaand.png',
                    width: 100, // Adjust width as needed
                    height: 100, // Adjust height as needed
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Column(
                children: [
                  Text(
                    'Beyond Words,Within Reach',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login Page',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ), // Adjust the spacing between
              Expanded(
                child: Container(
                  // Creating a seperate box to include user inputs
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),

                  child: Column(
                    children: [
                      const SizedBox(
                        //White Box Size
                        height: 40,
                      ),

                      MyTextField(
                        controller: usernameController,
                        hintText: 'Username',
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // User Password
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      //forgot password textfield

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 93, 92, 92)),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      MaterialButton(
                        minWidth: 250,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashBoard()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(17, 106, 123, 0.992),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      //Or continue with message
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('Or Continue With',
                                  style: TextStyle(color: Colors.grey[700])),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //google + facebook +twitter buttons

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //google
                          SquareTile(imagePath: 'assets/images/googleLogo.png'),
                          SizedBox(
                            width: 25,
                          ),

                          //Facebook
                          SquareTile(
                              imagePath: 'assets/images/facebookLogo.png'),
                          SizedBox(
                            width: 25,
                          ),
                          //Twitter,
                          SquareTile(
                              imagePath: 'assets/images/twitterLogo.png'),
                        ],
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      //If the  user is not Signed Yet Sign Up Now register click goes to SugnUp
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not a Member?'),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage()));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
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

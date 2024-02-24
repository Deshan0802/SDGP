// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:front_end/components/square_tile.dart';
import 'package:front_end/components/my_textfield.dart';
import 'audioToAsl.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  //text editing Controllers Omen

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(252, 194, 222, 220),
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
          color: const Color.fromRGBO(194, 222, 220, 0.992),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              const Column(
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
                    'Sign up to SignWave',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        //White Box Size
                        height: 50,
                      ),

                      //text fields

                      MyTextField(
                        controller: usernameController,
                        hintText: 'Enter Your Username',
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
                        height: 20,
                      ),
                      MyTextField(
                        controller: passwordController2,
                        hintText: ' Confirm Password',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                        minWidth: 250,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const audioToAsl()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(251, 0, 0, 0),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign In",
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
                        height: 10,
                      ),
                      //Or continue with message
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Color.fromRGBO(189, 189, 189, 1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text('Or Sign Up With',
                                  style: TextStyle(
                                      color: Color.fromRGBO(97, 97, 97, 1))),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Color.fromRGBO(189, 189, 189, 1),
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

import 'package:flutter/material.dart';
import 'package:front_end/screens/dashboard_screen.dart';
import 'package:front_end/screens/forgot_password_screen.dart';
import 'package:front_end/screens/sign_up_screen.dart';
import 'package:front_end/widgets/my_textfield.dart';
import 'package:front_end/widgets/square_tile.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing Controllers Omen

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(
      BuildContext context, String username, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Login Sucessful ",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 12,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => newDashBoard(),
        ),
      );
    } else {
      final decodedResponse = json.decode(response.body);
      final loginmessage = decodedResponse['error'];
      Fluttertoast.showToast(
        msg: loginmessage,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 2,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 12,
      );
      print('Login failed');
    }
  }

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
                    'assets/images/signup-login-screens/signwave-logo.png',
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

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return const ForgotPasswordPage();
                                  }),
                                );
                              },
                              child: const Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Color.fromRGBO(33, 150, 243, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                      MaterialButton(
                        minWidth: 250,
                        height: 60,
                        onPressed: () async {
                          String username = usernameController.text;
                          String password = passwordController.text;
                          await login(context, username,
                              password); // Pass the context, username, and password to login function
                        },
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(17, 106, 123, 0.992),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          //Button
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
                          SquareTile(
                              imagePath:
                                  'assets/images/signup-login-screens/google-logo.png'),
                          SizedBox(
                            width: 25,
                          ),

                          //Facebook
                          SquareTile(
                              imagePath:
                                  'assets/images/signup-login-screens/facebook-logo.png'),
                          SizedBox(
                            width: 25,
                          ),
                          //Twitter,
                          SquareTile(
                              imagePath:
                                  'assets/images/signup-login-screens/twitter-logo.png'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
                                  color: Color.fromRGBO(33, 150, 243, 1),
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

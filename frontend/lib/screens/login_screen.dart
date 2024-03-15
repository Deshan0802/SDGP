// ignore_for_file: avoid_print, use_build_context_synchronously, library_private_types_in_public_api, overridden_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_end/screens/dashboard_screen.dart';
import 'package:front_end/screens/forgot_password_screen.dart';
import 'package:front_end/screens/sign_up_screen.dart';
import 'package:front_end/widgets/my_textfield.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  final Key? key; // Accepting Key as a parameter

  const LoginPage({this.key})
      : super(key: key); // Passing the key to the super constructor

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing Controllers Omen

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late FirebaseAuth auth;
  User? user;

  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((event) {
      setState(() {
        user = event;
      });
    });
  }

  Future<void> login(
      BuildContext context, String username, String password) async {
    final response = await http.post(
      Uri.parse('http://signwave.pythonanywhere.com/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    final decodedResponse = json.decode(response.body);
    final loginMessage = decodedResponse['message'];
    Fluttertoast.showToast(
      msg: loginMessage,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 12,
    );

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => newDashBoard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //Creating the appbar
        elevation: 0,
        backgroundColor: const Color.fromRGBO(
            93, 224, 230, 0.992), // Setting the background color of the appbar
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 220, // Adjust width as needed
                height: 90, // Adjust height as needed
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/signup-login-screens/signwave-wordmark-logo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const Column(
                children: [
                  SizedBox(
                    height: 30,
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
                        height: 30,
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
                        height: 20,
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

                      const SizedBox(height: 25),
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
                          width: 210,
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 25), // Adjust padding as needed
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

                          // Login Button
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16, // Adjust font size as needed
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
                              child: Text('Or',
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
                        height: 25,
                      ),

                      //google Sign in buttons

                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: ElevatedButton(
                                onPressed: handleGoogleSignIn,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color.fromARGB(
                                      255, 0, 0, 0), // Text color of button
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20), // Rounded corners
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/signup-login-screens/google-logo.png', // Replace this with your Google logo asset
                                        height: 24.0,
                                      ),
                                      const SizedBox(
                                          width:
                                              10), // Space between text and logo
                                      const Text(
                                          'Continue With Google'), // Text of the button
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //If the  user is not Signed Yet Sign Up Now register click goes to SugnUp
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not a Member?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 111, 109, 109),
                                  fontWeight: FontWeight.w500)),
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

  void handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      // auth.signInWithProvider(googleAuthProvider);
      final UserCredential userCredential =
          await auth.signInWithProvider(googleAuthProvider);
      // Access user data using userCredential.user
      print("Google Sign-In Successful: ${userCredential.user!.displayName}");
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              newDashBoard(), // Navigate to Dashboard after successful sign-in
        ),
      );
    } catch (error) {
      print("Error signing in with Google: $error");
    }
  }
}

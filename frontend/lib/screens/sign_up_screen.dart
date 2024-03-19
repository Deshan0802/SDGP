import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front_end/screens/dashboard_screen.dart';
import 'package:front_end/screens/welcome_screen.dart';
import 'package:front_end/widgets/my_textfield.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //text editing Controllers Omen
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordConfirmedController = TextEditingController();

  final lnameController = TextEditingController();

  final fnameController = TextEditingController();

  final emailController = TextEditingController();
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


  Future<void> registerUser(BuildContext context) async {
    const url = 'http://signwave.pythonanywhere.com/sign-up';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'first_name': fnameController.text,
      'last_name': lnameController.text,
      'email': emailController.text,
      'username': usernameController.text,
      'password': passwordController.text,
      'password_confirmed': passwordConfirmedController.text
    });

    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Registration successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomePage()));
    } else {
      final decodedResponse = json.decode(response.body);
      final message = decodedResponse['message'];
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(93, 224, 230, 0.992),
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
      body: Scrollbar(
        child: SingleChildScrollView(
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
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                const SizedBox(
                  height: 65,
                ),
                Container(
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
                        controller: fnameController,
                        hintText: ' First Name',
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      MyTextField(
                        controller: lnameController,
                        hintText: ' Last Name',
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      MyTextField(
                        controller: emailController,
                        hintText: 'Email Address',
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

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
                        controller: passwordConfirmedController,
                        hintText: ' Confirm Password',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MaterialButton(
                        minWidth: 250,
                        height: 60,
                        onPressed: () async {
                          await registerUser(context);
                        },
                        // Signin button
                        child: Container(
                          width: 210,
                          height: 60,
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
                              "Sign Up",
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
                              child: Text('Or',
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
                        height: 25,
                      ),

                      const SizedBox(
                        height: 30, // Adjust the height for further scrolling
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

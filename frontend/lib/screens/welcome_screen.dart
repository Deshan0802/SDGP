import 'package:flutter/material.dart';
import 'package:front_end/widgets/login_button.dart';
import 'package:front_end/widgets/signin_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void logUserIn() {}
  void signInUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
            10.0), // Set the preferred height of the app bar
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          // Other properties and widgets for the AppBar
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white, // background color of the container

          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    "Welcome to SignWave!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lets get going!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                height: 350, // Adjust height as needed
                width: 350, // Adjust width as needed
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/welcome-screen/welcomepage-background-image.png"),
                    fit: BoxFit
                        .cover, // Ensure the image covers the entire container
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  // Log in Button
                  MyButtonLog(
                    onTap: logUserIn,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // sign-in button
                  MyButtonSign(
                    onTap: signInUser,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

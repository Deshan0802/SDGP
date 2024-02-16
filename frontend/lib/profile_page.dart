import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SignWave());
}

class SignWave extends StatelessWidget {
  const SignWave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.blueGrey), // Set the color of the back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    75), // Half of the radius to make it circular
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                    color: Colors.blueGrey.withOpacity(0.7), // Shadow color
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 75,
                backgroundImage:
                    AssetImage('assets/profile/sample-profile-picture.png'),
              ),
            ),
            const SizedBox(height: 50),
            itemProfile('Name', 'Hirushan Pathirage', CupertinoIcons.person),
            const SizedBox(height: 20),
            itemProfile('Phone', '070-4143-401', CupertinoIcons.phone),
            const SizedBox(height: 20),
            itemProfile(
                'Email', 'chamuditha.20220457@iit.ac.lk', CupertinoIcons.mail),
            const SizedBox(height: 20),
            itemProfile('Address', 'No 435, Galle Road, Colombo 03.',
                CupertinoIcons.building_2_fill),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              child: Container(
                  width: 70,
                  child: const Center(
                      child:
                          Text('Edit', style: TextStyle(color: Colors.white)))),
            ),
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.blueGrey.withOpacity(.3),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.blueGrey), // Set the color of the back arrow
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const CircleAvatar(
              radius: 85,
              backgroundImage:
                  AssetImage('assets/profile/sample-profile-picture.png'),
            ),
            const SizedBox(height: 40),
            itemProfile('Name', 'Hirushan Pathirage', CupertinoIcons.person),
            const SizedBox(height: 20),
            itemProfile('Phone', '070-4143-401', CupertinoIcons.phone),
            const SizedBox(height: 20),
            itemProfile(
                'Email', 'chamuditha.20220457@iit.ac.lk', CupertinoIcons.mail),
            const SizedBox(height: 20),
            itemProfile('Address', 'No 435, Galle Road, Colombo 03.',
                CupertinoIcons.building_2_fill),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the Edit Profile page
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  child: Container(
                      width: 70,
                      child: const Center(
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.white)))),
                ),
                const SizedBox(width: 25), // Adjust the spacing between buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the Edit Profile page
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  child: Container(
                      width: 70,
                      child: const Center(
                          child: Text('Save',
                              style: TextStyle(color: Colors.white)))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              color: Colors.blueGrey.withOpacity(.3),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}

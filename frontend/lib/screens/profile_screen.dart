import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front_end/screens/settings_screen.dart';
import 'package:front_end/widgets/reusable.dart';
import 'package:image_picker/image_picker.dart';

class SignWave extends StatelessWidget {
  const SignWave({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Profile',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: 'Hirushan Pathirage');
    lastNameController = TextEditingController(text: 'Pathirage');
    emailController =
        TextEditingController(text: 'chamuditha.20220457@iit.ac.lk');
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile',
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined,
              color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 26,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    width: double.infinity,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        const SizedBox(height: 15),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all<double>(0),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            )),
                          ),
                          child: const Text(
                            'Settings',
                            style: TextStyle(color: Colors.blue, fontSize: 17),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfilePage(
                                  firstNameController: firstNameController,
                                  lastNameController: lastNameController,
                                  emailController: emailController,
                                  onSave: (newValues) {
                                    setState(() {
                                      firstNameController.text =
                                          newValues['name'] ??
                                              firstNameController.text;
                                      lastNameController.text =
                                          newValues['lastName'] ??
                                              lastNameController.text;
                                      emailController.text =
                                          newValues['email'] ??
                                              emailController.text;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all<double>(0),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            )),
                          ),
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(color: Colors.blue, fontSize: 17),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle "Log Out" button press
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            elevation: MaterialStateProperty.all<double>(0),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            )),
                          ),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(color: Colors.blue, fontSize: 17),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
        elevation: 1, //AppBar shadow
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                      color: Colors.blueGrey.withOpacity(0.7),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(
                      'assets/images/profile-screen/sample-profile-picture.png'),
                ),
              ),
              const SizedBox(height: 50),
              itemProfile('Name', firstNameController, CupertinoIcons.person),
              const SizedBox(height: 20),
              itemProfile(
                  'Last Name', lastNameController, CupertinoIcons.person),
              const SizedBox(height: 20),
              itemProfile('Email', emailController, CupertinoIcons.mail),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  Widget itemProfile(
      String title, TextEditingController controller, IconData iconData) {
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
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blueGrey)),
        subtitle: Text(
          controller.text,
          style: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
            color: Colors.blueGrey,
          ),
        ),
        leading: Icon(
          iconData,
          size: 30,
          color: Colors.blueGrey,
        ),
        tileColor: Colors.white,
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;

  final Function(Map<String, String>) onSave;

  const EditProfilePage({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.onSave,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late String initialName;
  late String initialLastName;
  late String initialEmail;
  late String initialAddress;

  @override
  void initState() {
    super.initState();
    initialName = widget.firstNameController.text;
    initialLastName = widget.lastNameController.text;
    initialEmail = widget.emailController.text;
  }

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
              color: Colors.blueGrey),
          onPressed: () {
            _restoreInitialValues();
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 85,
                    backgroundImage: AssetImage(
                        'assets/images/profile-screen/sample-profile-picture.png'),
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      final ImageSource? pickedSource =
                          await showModalBottomSheet<ImageSource>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text('Take a photo'),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pop(ImageSource.camera);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text('Choose from gallery'),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pop(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );

                      if (pickedSource != null) {
                        final picker = ImagePicker();
                        final pickedImage =
                            await picker.pickImage(source: pickedSource);
                        if (pickedImage != null) {
                          // Handle the picked image
                        }
                      }
                    },

                    backgroundColor: Colors.blue, // Change button color here
                    mini: true,
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ), // Set to true for a smaller button
                  ),
                ],
              ),
              const SizedBox(height: 40),
              itemProfile('Name', widget.firstNameController,
                  CupertinoIcons.person_fill),
              const SizedBox(height: 25),
              itemProfile('Last Name', widget.lastNameController,
                  CupertinoIcons.phone_fill),
              const SizedBox(height: 25),
              itemProfile(
                  'Email', widget.emailController, CupertinoIcons.mail_solid),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _restoreInitialValues();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    child: const SizedBox(
                        width: 70,
                        child: Center(
                            child: Text('Cancel',
                                style: TextStyle(color: Colors.white)))),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      widget.onSave({
                        'name': widget.firstNameController.text,
                        'LastName': widget.lastNameController.text,
                        'email': widget.emailController.text,
                      });
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    child: const SizedBox(
                        width: 70,
                        child: Center(
                            child: Text('Save',
                                style: TextStyle(color: Colors.white)))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  void _restoreInitialValues() {
    setState(() {
      widget.firstNameController.text = initialName;
      widget.lastNameController.text = initialLastName;
      widget.emailController.text = initialEmail;
    });
  }

  Widget itemProfile(
      String title, TextEditingController controller, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            color: Colors.blue.withOpacity(.3),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18)),
        subtitle: TextField(
          controller: controller,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.zero,
            isDense: true, // Set to true to reduce the vertical space
          ),
        ),
        leading: Icon(
          iconData,
          color: Colors.blue,
          size: 35,
        ),
        tileColor: Colors.white,
      ),
    );
  }
}

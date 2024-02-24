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
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Hirushan Pathirage');
    phoneController = TextEditingController(text: '070-4143-401');
    emailController =
        TextEditingController(text: 'chamuditha.20220457@iit.ac.lk');
    addressController =
        TextEditingController(text: 'No 435, Galle Road, Colombo 03.');
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

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
              color: Colors.blueGrey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
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
                backgroundImage:
                    AssetImage('assets/profile/sample-profile-picture.png'),
              ),
            ),
            const SizedBox(height: 50),
            itemProfile('Name', nameController, CupertinoIcons.person),
            const SizedBox(height: 20),
            itemProfile('Phone', phoneController, CupertinoIcons.phone),
            const SizedBox(height: 20),
            itemProfile('Email', emailController, CupertinoIcons.mail),
            const SizedBox(height: 20),
            itemProfile(
                'Address', addressController, CupertinoIcons.building_2_fill),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                            nameController: nameController,
                            phoneController: phoneController,
                            emailController: emailController,
                            addressController: addressController,
                            onSave: (newValues) {
                              setState(() {
                                nameController.text =
                                    newValues['name'] ?? nameController.text;
                                phoneController.text =
                                    newValues['phone'] ?? phoneController.text;
                                emailController.text =
                                    newValues['email'] ?? emailController.text;
                                addressController.text = newValues['address'] ??
                                    addressController.text;
                              });
                            },
                          )),
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
        title: Text(title),
        subtitle: Text(
          controller.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final Function(Map<String, String>) onSave;

  const EditProfilePage({
    Key? key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.addressController,
    required this.onSave,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late String initialName;
  late String initialPhone;
  late String initialEmail;
  late String initialAddress;

  @override
  void initState() {
    super.initState();
    initialName = widget.nameController.text;
    initialPhone = widget.phoneController.text;
    initialEmail = widget.emailController.text;
    initialAddress = widget.addressController.text;
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
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 85,
                backgroundImage:
                    AssetImage('assets/profile/sample-profile-picture.png'),
              ),
              const SizedBox(height: 40),
              itemProfile('Name', widget.nameController, CupertinoIcons.person),
              const SizedBox(height: 20),
              itemProfile(
                  'Phone', widget.phoneController, CupertinoIcons.phone),
              const SizedBox(height: 20),
              itemProfile('Email', widget.emailController, CupertinoIcons.mail),
              const SizedBox(height: 20),
              itemProfile('Address', widget.addressController,
                  CupertinoIcons.building_2_fill),
              const SizedBox(height: 40),
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
                    child: Container(
                        width: 70,
                        child: const Center(
                            child: Text('Cancel',
                                style: TextStyle(color: Colors.white)))),
                  ),
                  const SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: () {
                      widget.onSave({
                        'name': widget.nameController.text,
                        'phone': widget.phoneController.text,
                        'email': widget.emailController.text,
                        'address': widget.addressController.text,
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
      ),
    );
  }

  void _restoreInitialValues() {
    setState(() {
      widget.nameController.text = initialName;
      widget.phoneController.text = initialPhone;
      widget.emailController.text = initialEmail;
      widget.addressController.text = initialAddress;
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
            color: Colors.blueGrey.withOpacity(.3),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}

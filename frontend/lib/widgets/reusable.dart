import 'package:flutter/material.dart';
import 'package:front_end/screens/dashboard_screen.dart';
import 'package:front_end/screens/help_center_screen.dart';
import 'package:front_end/screens/profile_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String headerText;
  final String bottomSheetContent;

  const CustomAppBar({
    Key? key,
    required this.headerText,
    required this.bottomSheetContent,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        headerText,
        style: const TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon:
            const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.info_outline,
            color: Colors.black,
            size: 26,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 100,
                  child: SizedBox.expand(
                    child: Center(
                        child: SizedBox(
                      width: 300,
                      child: Text(
                        bottomSheetContent,
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    )),
                  ),
                );
              },
            );
          },
        ),
      ],
      // flexibleSpace: Container(
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Color.fromRGBO(100, 245, 250, 0.900), // Light Blue
      //         Color.fromRGBO(102, 204, 255, 0.990), // Lighter Sky Blue
      //         Color.fromRGBO(51, 153, 255, 0.900), // Sky Blue
      //       ],
      //       begin: Alignment.centerLeft,
      //       end: Alignment.centerRight,
      //     ),
      //   ),
      // ),
      elevation: 2, //AppBar shadow
      shadowColor: Colors.black,
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex = 0;

  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => newDashBoard()),
            );
            break;

          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HelpCenter()),
            );
            break;

          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
            break;
        }
        // setState(() {
        //   currentIndex = index;
        // });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'Help',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class newHeader extends StatelessWidget {
  final String headerTextInfo;
  final String headerText;

  newHeader({
    required this.headerTextInfo,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            newBackButton(),
            newInfoButton(),
          ],
        ),
        Column(
          children: [
            Text(
              headerTextInfo,
              style: TextStyle(fontSize: 10.0, color: Colors.grey),
            ),
            Text(
              headerText,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              color: Colors.grey.shade700,
              thickness: 1.0,
            ),
          ],
        )
      ],
    );
  }
}

class newBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate back to the previous screen
        Navigator.of(context).pop();
      },
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.shade400,
        ),
        child: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}

class newInfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.info,
      color: Colors.blue.shade400,
      size: 40.0,
    );
  }
}

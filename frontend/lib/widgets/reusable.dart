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
      elevation: 1, //AppBar shadow
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

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

class CustomWhiteBox extends StatelessWidget {
  final List<Widget> whiteBox;
  final double verticalMargin;
  final double horizontalMargin;
  final double verticalPadding;
  final double horizontalPadding;

  const CustomWhiteBox({
    super.key,
    required this.verticalMargin,
    required this.horizontalMargin,
    this.verticalPadding = 0.0,
    this.horizontalPadding = 0.0,
    required this.whiteBox,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: verticalMargin, horizontal: horizontalMargin),
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: whiteBox,
        ));
  }
}

class CustomBlueBox extends StatelessWidget {
  final String firstElementName;
  final String thirdElementName;
  final double buttonVerticalMargin;
  final double buttonHorizontalMargin;

  final VoidCallback? onTap;

  const CustomBlueBox({
    super.key,
    required this.firstElementName,
    required this.thirdElementName,
    required this.buttonVerticalMargin,
    required this.buttonHorizontalMargin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 47, 122, 1),
          borderRadius: BorderRadius.circular(60.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.symmetric(
            vertical: buttonVerticalMargin, horizontal: buttonHorizontalMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildConversionBox(firstElementName),
            const Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: 50,
            ),
            _buildConversionBox(thirdElementName),
          ],
        ),
      ),
    );
  }

  Widget _buildConversionBox(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(0, 47, 122, 1),
        ),
      ),
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

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  // String buttonName;

  const CustomBackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 47, 122, 1),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const BackButton(
        color: Colors.white,
      ),
    );
  }
}

class CustomPointlessButton extends StatelessWidget {
  final double borderRaduis;
  final double buttonHeight;
  final double buttonLength;
  final String buttonName;

  const CustomPointlessButton({
    super.key,
    required this.borderRaduis,
    required this.buttonHeight,
    required this.buttonLength,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: buttonHeight, horizontal: buttonLength),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 47, 122, 1),
        borderRadius: BorderRadius.circular(borderRaduis),
      ),
      child: Text(
        buttonName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final double borderRaduis;
  final double buttonVerticalMargin;
  final double buttonHorizontalMargin;
  final double buttonVerticalPadding;
  final double buttonHorizontalPadding;
  final String buttonName;

  const CustomButton({
    super.key,
    required this.borderRaduis,
    required this.buttonVerticalPadding,
    required this.buttonHorizontalPadding,
    this.buttonVerticalMargin = 0.0,
    this.buttonHorizontalMargin = 0.0,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: buttonVerticalPadding, horizontal: buttonHorizontalPadding),
      margin: EdgeInsets.symmetric(
          vertical: buttonVerticalMargin, horizontal: buttonHorizontalMargin),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 47, 122, 1),
        borderRadius: BorderRadius.circular(borderRaduis),
      ),
      child: Text(
        buttonName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

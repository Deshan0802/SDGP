import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class CustomHeaderText extends StatelessWidget {
  final String headerText;
  final double headerTextSize;

  CustomHeaderText({
    required this.headerText,
    required this.headerTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      style: TextStyle(
        fontSize: headerTextSize,
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(0, 47, 122, 1),
      ),
    );
  }
}

class CustomWhiteBox extends StatelessWidget {
  final List<Widget> whiteBox;
  final double VerticalMargin;
  final double HorizontalMargin;
  final double VerticalPadding;
  final double HorizontalPadding;

  CustomWhiteBox({
    required this.VerticalMargin,
    required this.HorizontalMargin,
    this.VerticalPadding = 0.0,
    this.HorizontalPadding = 0.0,
    required this.whiteBox,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: VerticalMargin, horizontal: HorizontalMargin),
        padding: EdgeInsets.symmetric(
            vertical: VerticalPadding, horizontal: HorizontalPadding),
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

  CustomBlueBox({
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
          color: Color.fromRGBO(0, 47, 122, 1),
          borderRadius: BorderRadius.circular(60.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.symmetric(
            vertical: buttonVerticalMargin, horizontal: buttonHorizontalMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildConversionBox(firstElementName),
            Icon(
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
      padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(0, 47, 122, 1),
        ),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;

          case 1:
            Navigator.pushNamed(context, '/help');
            break;

          case 2:
            Navigator.pushNamed(context, '/profile');
            break;
        }
        // setState(() {
        //   currentIndex = index;
        // });
      },
      items: [
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

  CustomBackButton({
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 47, 122, 1),
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

  CustomPointlessButton({
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
        color: Color.fromRGBO(0, 47, 122, 1),
        borderRadius: BorderRadius.circular(borderRaduis),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
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

  CustomButton({
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
        color: Color.fromRGBO(0, 47, 122, 1),
        borderRadius: BorderRadius.circular(borderRaduis),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

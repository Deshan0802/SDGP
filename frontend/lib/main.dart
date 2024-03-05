import 'package:flutter/material.dart';
import 'splashScreen.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:front_end/settings_page.dart';

void main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueChangeObserver<bool>(
        cacheKey: SettingsPage.keyDarkMode,
        defaultValue: false,
        builder: (_, isDarkMode, __) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'SignWave',
              theme: isDarkMode
                  ? ThemeData.dark().copyWith(
                      primaryColor: Colors.teal,
                    )
                  : ThemeData.light().copyWith(primaryColor: Colors.green),
              home: splashScreen(),
            ));
  }
}

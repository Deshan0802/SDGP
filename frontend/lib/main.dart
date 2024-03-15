import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:front_end/firebase_options.dart';
import 'package:front_end/screens/settings_screen.dart';
import 'package:front_end/screens/splash_screen.dart';
// import 'package:front_end/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
              home: const SplashScreen(),
            ));
  }
}

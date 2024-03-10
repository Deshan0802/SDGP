import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:front_end/widgets/icon_widget.dart';
import 'package:front_end/widgets/utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const keyLanguage = 'key-language';
  static const keyDarkMode = 'key-dark-mode';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          title: const Text("Settings",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              )),
          centerTitle: true,
          backgroundColor: Colors.orange,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ))),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          buildProfileInfo(),
          const SizedBox(height: 16),
          SettingsGroup(
            title: 'GENERAL SETTINGS',
            children: <Widget>[
              const SizedBox(height: 2),
              buildDarkMode(),
              buildLanguage(),
              buildAbout(),
              buildTermsAndConditions(),
              buildPrivacyPolicy(),
              buildRateApp(context),
              buildShareApp(context),
            ],
          ),
        ],
      )));

  Widget buildProfileInfo() => const Column(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(
                'assets/images/profile-screen/sample-profile-picture.png'),
          ),
          SizedBox(height: 8),
          Text(
            'Username',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      );

  Widget buildDarkMode() => SwitchSettingsTile(
        settingKey: SettingsPage.keyDarkMode,
        leading: const IconWidget(
          icon: Icons.dark_mode,
          color: Colors.black,
        ),
        title: 'Dark Mode',
        onChange: (_) {},
      );

  Widget buildLanguage() => DropDownSettingsTile(
        leading: const IconWidget(
          icon: Icons.language,
          color: Colors.blue,
        ),
        settingKey: SettingsPage.keyLanguage,
        title: 'Language',
        selected: 1,
        values: const <int, String>{
          1: 'English',
          2: 'Chinese',
          3: 'Portuguese',
        },
        onChange: (language) {/* NOOP*/},
      );

  Widget buildAbout() => SimpleSettingsTile(
      title: 'About',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.info,
        color: Colors.yellow,
      ),
      onTap: () => Utils.showSnackBar(context, 'Clicked About'));

  Widget buildTermsAndConditions() => SimpleSettingsTile(
      title: 'Terms and Conditions',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.note,
        color: Colors.green,
      ),
      onTap: () => Utils.showSnackBar(context, 'Clicked Terms and Conditions'));

  Widget buildPrivacyPolicy() => SimpleSettingsTile(
      title: 'Privacy Policy',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.privacy_tip,
        color: Colors.red,
      ),
      onTap: () => Utils.showSnackBar(context, 'Clicked Privacy Policy'));

  Widget buildRateApp(BuildContext context) => SimpleSettingsTile(
      title: 'Rate This App',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.star,
        color: Colors.purple,
      ),
      onTap: () => Utils.showSnackBar(context, 'Clicked Rate This App'));

  Widget buildShareApp(BuildContext context) => SimpleSettingsTile(
      title: 'Share This App',
      subtitle: '',
      leading: const IconWidget(
        icon: Icons.share,
        color: Colors.pink,
      ),
      onTap: () => Utils.showSnackBar(context, 'Clicked Share This App'));
}

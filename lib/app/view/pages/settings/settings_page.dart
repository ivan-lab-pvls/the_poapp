// import 'package:flutter/material.dart';
// import 'package:tradings/app/view/pages/settings/comp/settings_widget.dart';

// import '../../resources/custom_textstyles.dart';
// import '../../resources/my_colors.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 14),
//           child: Column(
//             children: [
//               Text(
//                 "Settings",
//                 style: CustomTextStyles.customTextStyle(
//                   color: MyColors.greyWhite,
//                   fontWeight: FontWeight.w800,
//                   fontSize: 19,
//                 ),
//               ),
//               const SizedBox(height: 14),
//               SettingsWidget(title: "Privacy policy", onTap: () {}),
//               const SizedBox(height: 14),
//               SettingsWidget(title: "Terms of use", onTap: () {}),
//               const SizedBox(height: 14),
//               SettingsWidget(title: "Support", onTap: () {}),
//               const SizedBox(height: 14),
//               SettingsWidget(title: "Restore purchases", onTap: () {}),
//               Switch(value: false, onChanged: (newValue){
//                 _themeMeneger.toggleTheme(newValue);
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

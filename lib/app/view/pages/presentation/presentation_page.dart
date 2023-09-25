// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:tradings/app/view/pages/bottom_nav/bottom_nav.dart';
import '../../components/custom_button.dart';
import '../../res/my_colors.dart';
import '../../res/custom_textstyles.dart';
import 'presentation_model.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage({Key? key}) : super(key: key);

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  late PageController _pageController;
  final _list = ContentModelList().listOfPages;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: ContentModelList().listOfPages.length,
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: ((context, index) => OnboardContent(
                    title: _list[index].title,
                    text: _list[index].text,
                    image: _list[index].image,
                  )),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              height: 56,
              onPressed: () async {
                if (_pageIndex == 3) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNav(),
                    ),
                    (route) => false,
                  );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              textColor: MyColors.white,
              text: "Next",
              color: MyColors.blue,
            ),
          ),
          const SizedBox(height: 44)
        ],
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String title, text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: CustomTextStyles.customTextStyle(
              color: MyColors.black,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: CustomTextStyles.customTextStyle(
              color: MyColors.dark,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

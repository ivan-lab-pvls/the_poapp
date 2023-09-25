import 'package:flutter/material.dart';
import 'package:tradings/app/view/pages/calculator/calculator_page.dart';
import 'package:tradings/app/view/pages/home/home_page.dart';
import 'package:tradings/app/view/pages/news/news_page.dart';
import 'package:tradings/app/view/pages/simulator/simulator_page.dart';
import '../../../../main.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final _screens = <Widget>[
    const HomePage(),
    const NewsPage(),
    const SimulatorPage(),
    CalculatorPage(),
    const SettingsPage()
  ];
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: IndexedStack(
        index: currentIndex,
        children: List.generate(
          _screens.length,
          (index) => _screens[index],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.background,
          ),
          color: Theme.of(context).colorScheme.background,
        ),
        padding: const EdgeInsets.only(
          bottom: 22,
          top: 14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => setState(() => currentIndex = 0),
              child: Image.asset(
                "assets/images/home_icon.png",
                width: 30,
                color: currentIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 1),
              child: Image.asset(
                "assets/images/news_icon.png",
                width: 30,
                color: currentIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 2),
              child: Image.asset(
                "assets/images/simulator_icon.png",
                width: 30,
                color: currentIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 3),
              child: Image.asset(
                "assets/images/calculator_icon.png",
                width: 30,
                color: currentIndex == 3
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            InkWell(
              onTap: () => setState(() => currentIndex = 4),
              child: Image.asset("assets/images/settings_icon.png",
                  width: 30,
                  color: currentIndex == 4
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

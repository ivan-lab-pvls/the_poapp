import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tradings/app/view/pages/home/comp/assets_widget.dart';
import 'package:tradings/app/view/pages/home/data/asset_model.dart';
import 'package:tradings/app/view/pages/home/data/assets_content.dart';
import 'package:tradings/app/view/res/custom_textstyles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AssetModel> assets = [];

  @override
  void initState() {
    initAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: ListView(
            children: [
              Text(
                "Assets",
                style: CustomTextStyles.customTextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 14),
              Column(
                children: List.generate(
                  assets.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: AssetsWidget(
                      image: assets[index].image,
                      sum: assets[index].price.toStringAsFixed(2),
                      sumTwo: assets[index].percentage,
                      currency: assets[index].name,
                      onTap: () {},
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  initAssets() {
    final _assets = AssetsContent.assets;
    final double minValue = -2.0;
    final double maxValue = 2.0;
    for (var ass in _assets) {
      final randomDouble =
          (Random().nextDouble() * (maxValue - minValue)) + minValue;
      ass.percentage = randomDouble;
      ass.isUp = randomDouble > 0;
    }
    _assets.shuffle();
    setState(() {
      assets = _assets;
    });
  }
}

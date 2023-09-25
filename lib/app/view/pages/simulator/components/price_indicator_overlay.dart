import 'package:flutter/material.dart';

import '../../../res/my_colors.dart';

class PriceIndicatorOverlay extends StatelessWidget {
  final double price;
  final double height;
  final double chartHeight;

  const PriceIndicatorOverlay({
    required this.price,
    required this.height,
    required this.chartHeight,
  });

  @override
  Widget build(BuildContext context) {
    final priceLabel = '\$${price.toStringAsFixed(2)}';

    return Positioned(
      right: 10.0, // Позиция полоски справа от графика (можно настроить)
      top: 200,
      child: Container(
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: MyColors.blue,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text(
          priceLabel,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tradings/app/view/res/my_colors.dart';

import '../../res/custom_textstyles.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double costPrice = 100.0;
  double sellingPrice = 100.0;
  int decimalPlaces = 2;
  double margin = 0.0;

  void calculateMargin() {
    setState(() {
      margin = (sellingPrice - costPrice) / costPrice;
      margin = double.parse(margin.toStringAsFixed(decimalPlaces));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Calculator',
                  style: CustomTextStyles.customTextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cost price',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                          Text(
                            '\$${costPrice.toStringAsFixed(2)}',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Slider(
                        value: costPrice,
                        thumbColor: MyColors.green,
                        activeColor: Theme.of(context).colorScheme.background,
                        inactiveColor: Colors.grey,
                        min: 100.0,
                        max: 100000.0,
                        onChanged: (value) {
                          setState(() {
                            costPrice = value;
                          });
                          calculateMargin();
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$100',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey,
                            ),
                          ),
                          Text(
                            '\$100 000',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Selling price',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                          Text(
                            '\$${sellingPrice.toStringAsFixed(2)}',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Slider(
                        value: sellingPrice,
                        thumbColor: MyColors.green,
                        activeColor: Theme.of(context).colorScheme.background,
                        inactiveColor: Colors.grey,
                        min: 100.0,
                        max: 100000.0,
                        onChanged: (value) {
                          setState(() {
                            sellingPrice = value;
                          });
                          calculateMargin();
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$100',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey,
                            ),
                          ),
                          Text(
                            '\$100 000',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Accuracy, decimal places',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                          Text(
                            '$decimalPlaces',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).colorScheme.background,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Slider(
                        value: decimalPlaces.toDouble(),
                        thumbColor: MyColors.green,
                        activeColor: Theme.of(context).colorScheme.background,
                        inactiveColor: Colors.grey,
                        min: 0,
                        max: 10,
                        onChanged: (value) {
                          setState(() {
                            decimalPlaces = value.toInt();
                          });
                          calculateMargin();
                        },
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '0',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey,
                            ),
                          ),
                          Text(
                            '10',
                            style: CustomTextStyles.customTextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: MyColors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Calculation results:',
                        style: CustomTextStyles.customTextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                      Text(
                        margin.toStringAsFixed(decimalPlaces),
                        style: CustomTextStyles.customTextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

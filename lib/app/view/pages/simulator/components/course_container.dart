import 'package:flutter/material.dart';

import '../../../res/custom_textstyles.dart';

class CourseContainer extends StatelessWidget {
  final String image;
  final String name;
  final double price;
  final int index;
  final bool isSelected;
  const CourseContainer({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: index == 3 ? 10 : 0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 48,
            width: 48,
          ),
          SizedBox(width: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: CustomTextStyles.customTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.background),
              ),
              Text(
                '\$ ${price.toStringAsFixed(2)}',
                style: CustomTextStyles.customTextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.background),
              ),
              SizedBox(height: 4),
              if (isSelected)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    'selected',
                    style: CustomTextStyles.customTextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}

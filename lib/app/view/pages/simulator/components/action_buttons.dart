import 'package:flutter/material.dart';
import 'package:tradings/app/view/res/custom_textstyles.dart';
import 'package:tradings/app/view/res/my_colors.dart';

class ActionButtons extends StatelessWidget {
  final Function() onUp;
  final Function() onDown;
  const ActionButtons({
    super.key,
    required this.onUp,
    required this.onDown,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onDown,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: MyColors.red,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 32,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'DOWN',
                    style: CustomTextStyles.customTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: onUp,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: MyColors.green,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_drop_up,
                    color: Colors.white,
                    size: 32,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'UP',
                    style: CustomTextStyles.customTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


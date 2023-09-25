import 'package:flutter/material.dart';
import 'package:tradings/app/view/components/custom_animated_container.dart';

import '../../../res/custom_textstyles.dart';

class SettingsWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  const SettingsWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimationContainer(
      onPressed: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: CustomTextStyles.customTextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).colorScheme.background,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../components/custom_animated_container.dart';
import '../../../res/custom_textstyles.dart';
import '../../../res/my_colors.dart';

class NewsWidget extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String date;
  final Function() onTap;
  const NewsWidget({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimationContainer(
      onPressed: onTap,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 224,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 224,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: MyColors.blue.withOpacity(0.7),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: CustomTextStyles.customTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text(
                    title,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.customTextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    formatTimeDifference(
                        DateTime.tryParse(date) ?? DateTime.now()),
                    style: CustomTextStyles.customTextStyle(
                      color: MyColors.grey2,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatTimeDifference(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 1) {
      return '${difference.inDays} d ago';
    } else if (difference.inHours > 1) {
      return '${difference.inHours} h ago';
    } else {
      return '${difference.inMinutes} m ago';
    }
  }
}

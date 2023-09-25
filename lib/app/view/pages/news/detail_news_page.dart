import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tradings/app/view/pages/news/data/models/article_model.dart';
import 'package:tradings/app/view/res/my_colors.dart';

import '../../res/custom_textstyles.dart';

class DetailNewsPage extends StatelessWidget {
  final ArticleModel articleModel;
  const DetailNewsPage({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GestureDetector(
              onTap: () {
                Share.share(articleModel.url);
              },
              child: Image.asset("assets/images/share_icon.png",
                  width: 25, color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ListView(
          children: [
            Text(
              articleModel.authorFormatted,
              style: CustomTextStyles.customTextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              articleModel.headline,
              style: CustomTextStyles.customTextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.circle, color: MyColors.grey, size: 6),
                const SizedBox(width: 10),
                Text(
                  formatTimeDifference(
                      DateTime.tryParse(articleModel.dateLastPublished) ??
                          DateTime.now()),
                  style: CustomTextStyles.customTextStyle(
                    color: MyColors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 224,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: NetworkImage(
                    articleModel.promoImage.url,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              articleModel.description,
              style: CustomTextStyles.customTextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ],
        ),
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

import 'package:flutter/material.dart';
import 'package:tradings/app/view/pages/news/comp/news_widget.dart';
import 'package:tradings/app/view/pages/news/data/fetch_articles/fetch_articles_cubit.dart';
import 'package:tradings/app/view/pages/news/detail_news_page.dart';
import '../../res/custom_textstyles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

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
                "News",
                style: CustomTextStyles.customTextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 14),
              BlocProvider(
                create: (context) =>
                    FetchArticlesCubit()..fetchArticlesWithStates(),
                child: BlocBuilder<FetchArticlesCubit, FetchArticlesState>(
                  builder: (context, state) {
                    return state.when(
                      init: () => SizedBox(),
                      prgrs: () => SpinKitPulse(
                        color: Theme.of(context).colorScheme.primary,
                        size: 100.0,
                      ),
                      scss: (articles) {
                        return Column(
                          children: List.generate(
                            articles.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: NewsWidget(
                                image: articles[index].promoImage.url,
                                name: articles[index].authorFormatted,
                                title: articles[index].shorterHeadline,
                                date: articles[index].dateLastPublished,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailNewsPage(
                                        articleModel: articles[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      fld: (message) => Text(message),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

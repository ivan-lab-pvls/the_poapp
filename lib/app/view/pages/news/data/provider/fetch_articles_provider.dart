import 'package:dio/dio.dart';
import 'package:tradings/app/view/pages/news/data/models/article_model.dart';

class FetchArticlesProvider {
  static Future<List<ArticleModel>> fetchNewsByCategoryFromServer() async {
    final dio = Dio(BaseOptions(
      headers: {
        'X-RapidAPI-Key': '3401a96be2msh45b8ca512eadd61p166194jsn2983e33bb4c8'
      },
    ));

    try {
      final response = await dio.get(
        'https://cnbc.p.rapidapi.com/news/v2/list-trending?tag=Articles&count=30',
      );

      final articles = <ArticleModel>[];
      if (response.data != null) {
        response.data['data']['mostPopularEntries']['assets'].forEach((v) {
          articles.add(ArticleModel.fromJson(v));
        });
      }
      return articles;
    } catch (e) {
      throw Exception(e);
    }
  }
}

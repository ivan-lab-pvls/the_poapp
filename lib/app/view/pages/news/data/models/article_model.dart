class ArticleModel {
  late String headline;
  late String shorterHeadline;
  late String dateLastPublished;
  late String description;
  late String authorFormatted;
  late String url;
  late PromoImage promoImage;

  ArticleModel({
    required this.headline,
    required this.shorterHeadline,
    required this.dateLastPublished,
    required this.description,
    required this.authorFormatted,
    required this.url,
    required this.promoImage,
  });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    shorterHeadline = json['shorterHeadline'];
    dateLastPublished = json['dateLastPublished'];
    description = json['description'];
    authorFormatted = json['authorFormatted'];
    url = json['url'];
    promoImage = PromoImage.fromJson(json['promoImage']);
  }
}

class PromoImage {
  late String url;

  PromoImage({required this.url});

  PromoImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}

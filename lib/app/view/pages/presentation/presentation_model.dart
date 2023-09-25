class PresentationModel {
  final String title;
  final String text;
  final String image;

  PresentationModel({
    required this.text,
    required this.title,
    required this.image,
  });
}

class ContentModelList {
  List<PresentationModel> listOfPages = <PresentationModel>[
    PresentationModel(
      title: 'Display of current stock prices:',
      image: "assets/images/presentation_one.png",
      text:
          'Here you will find the current prices of Assets. We\nprovide information on current values, changes\nand volume of transactions.',
    ),
    PresentationModel(
      title: 'List of latest news from the world of finance:',
      image: "assets/images/presentation_two.png",
      text:
          'In the news section, you will always be updated\nwith the latest happenings in the world of finance.\nWe provide fresh and important news for you.',
    ),
    PresentationModel(
      title: 'Margin Calculator:',
      image: "assets/images/presentation_three.png",
      text:
          'The margin calculator will help you to calculate\nyour potential profit or loss on trades. Enter the\nrequired data and get accurate results.',
    ),
    PresentationModel(
      title: 'Trade simulator:',
      image: "assets/images/presentation_four.png",
      text:
          'Trading on a convenient and clear simulator with many quotes and settings',
    ),
  ];
}

class AssetModel {
  final String image;
  final String name;
  final double price;
  late double percentage;
  late bool isUp;

  AssetModel({
    required this.name,
    required this.image,
    required this.price,
    required this.percentage,
    required this.isUp,
  });
}

class Destination {
  String title;
  String subTitle;
  String imageUrl;
  double price;
  double rating;
  String about;
  bool isFav = false;

  Destination({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.about,
    required this.price,
    required this.rating,
  });

}

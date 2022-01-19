class OnBoardModel {
  String message;
  String img;

  OnBoardModel({required this.message, required this.img});
}

class Utils {
  static List<OnBoardModel> getOnBoard() {
    return [
      OnBoardModel(
          message:
              "You only live once, But if you \ndo it right once is enough.",
          img: "assets/travel.png"),
      OnBoardModel(message: "A journey of a thousand miles \nbegins with a single step", img: "assets/shades.png"),
      OnBoardModel(message: "Love is the food of life,\nTravel is Dessert", img: "assets/plane.png")
    ];
  }
}


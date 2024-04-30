class ProductModel {
  String name;
  String mealType;
  String cover;
  List<String> images;
  double price;
  double Protein;
  double Fats;
  double Fiber;
  double Calories;
  double GlycemicIndex;
  ProductModel({
    required this.name,
    required this.cover,
    required this.images,
    required this.price,
    required this.mealType,
    required this.Protein,
    required this.Fats,
    required this.Fiber,
    required this.Calories,
    required this.GlycemicIndex,
  });
}

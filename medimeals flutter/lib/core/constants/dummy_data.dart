import '../models/dummy_bundle_model.dart';
import '../models/dummy_product_model.dart';

class Dummy {
  /// List Of Dummy Products
  static List<ProductModel> products = [
    ProductModel(
      name: 'Karela Thepla',
      cover: 'https://static.toiimg.com/thumb/59967464.cms?imgsize=553800&width=800&height=800',
      images: ['https://static.toiimg.com/thumb/59967464.cms?imgsize=553800&width=800&height=800'],
      price: 35,
      mealType:'Breakfast',
      Protein: 2.3,
      Fats: 6.5,
      Fiber: 0.4,
      Calories: 120,
      GlycemicIndex:18
    ),
    ProductModel(
      name: 'Moong Dal and Matar Khichdi',
      cover: 'https://c.ndtvimg.com/2022-03/j5jbs6g_khichdi_625x300_25_March_22.jpg?im=FaceCrop,algorithm=dnn,width=620,height=350',
      images: ['https://c.ndtvimg.com/2022-03/j5jbs6g_khichdi_625x300_25_March_22.jpg?im=FaceCrop,algorithm=dnn,width=620,height=350'],
      price: 50,
      mealType:'Lunch, Dinner',
      Protein: 2,
      Fats: 7.8,
      Fiber: 0.7,
      Calories: 135,
      GlycemicIndex: 29

    ),
    ProductModel(
      name: 'Rajma Chana Salad',
      cover: 'https://www.tarladalal.com/members/9306/procstepimgs/step-19_garnish-heathy-rajma-kabuli-chana-salad-with-coriander-4-198346.jpg',
      images: ['https://www.tarladalal.com/members/9306/procstepimgs/step-19_garnish-heathy-rajma-kabuli-chana-salad-with-coriander-4-198346.jpg'],
        price: 120,
        mealType:'BBreakfast, Lunch,Dinner',
        Protein: 6.1,
        Fats: 5.5,
        Fiber: 1.9,
        Calories: 146,
        GlycemicIndex:29,
    ),
  ];

  /// List Of Dummy Bundles
  static List<BundleModel> bundles = [
    BundleModel(
      name: 'Dal Idli',
      cover: 'https://cdn.tarladalal.com/members/9306/big/big_moong_dal_idli-16758.jpg',
        price: 30,
        mealType:'Breakfast',
        Protein: 2,
        Fats: 0.1,
        Fiber: 0.8,
        Calories: 41,
        GlycemicIndex:22
    ),
    BundleModel(
      name: 'Chicken Vegetable Soup',
      cover: 'https://peppybowl.in/wp-content/uploads/2021/09/Natukodi-Soup.jpg',
        price: 150,
        mealType:'Lunch,Dinner',
        Protein: 10,
        Fats: 3.6,
        Fiber: 4.6,
        Calories: 168,
        GlycemicIndex:18
    ),
    BundleModel(
      name: 'Red poha',
      cover: 'https://www.sailusfood.com/wp-content/uploads/2015/02/red-aval-upma.jpg',
        price: 50,
        mealType:'Breakfast',
        Protein: 2.3,
        Fats: 6.5,
        Fiber: 0.4,
        Calories: 120,
        GlycemicIndex:18
    ),
    BundleModel(
      name: 'Dhokla',
      cover: 'https://cdn.tarladalal.com/td_cont_img/Moong-Dal-Dhokla-2.JPG',
        price: 45,
        mealType:'Breakfast',
        Protein: 2.3,
        Fats: 6.5,
        Fiber: 0.4,
        Calories: 120,
        GlycemicIndex:18
    ),
  ];
}

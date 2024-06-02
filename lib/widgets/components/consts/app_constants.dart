import '../../model/categories_model.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> bannersImages = [
    "assets/Backgrounds/banner1.jpg",
    "assets/Backgrounds/banner2.jpg",
    "assets/Backgrounds/banner3.png",
    "assets/Backgrounds/banner4.jpg",
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
      id: "News",
      image: "assets/categories/book_img.png",
      name: "Tin tức",
    ),
    CategoriesModel(
      id: "Notification",
      image: "assets/categories/notification-bell.png",
      name: "Thông báo",
    ),
    CategoriesModel(
      id: "Club",
      image: "assets/categories/logo.png",
      name: "Câu lạc bộ",
    ),
    CategoriesModel(
      id: "Medal",
      image: "assets/categories/medal.png",
      name: "Bảng xếp hạng",
    ),
    CategoriesModel(
      id: "Watches",
      image: "assets/categories/watch.png",
      name: "Watches",
    ),
    CategoriesModel(
      id: "Clothes",
      image: "assets/categories/fashion.png",
      name: "Clothes",
    ),
    CategoriesModel(
      id: "Shoes",
      image: "assets/categories/shoes.png",
      name: "Shoes",
    ),
    CategoriesModel(
      id: "Cosmetics",
      image: "assets/categories/cosmetics.png",
      name: "Cosmetics",
    ),
  ];
}

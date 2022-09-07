import 'package:restaurant_app/core/constants/app_string.dart';

class Menu {
  final String title, image, name;
  final double price;

  Menu(
      {required this.name,
      required this.title,
      required this.image,
      required this.price});
}

class CategoryMenu {
  final String category;
  final List<Menu> items;

  CategoryMenu({required this.category, required this.items});
}

final List<CategoryMenu> allCategoryMenus = [
  CategoryMenu(
    category: StringConstant.reservaName,
    items: [],
  ),
  CategoryMenu(
    category: StringConstant.menuName,
    items: [],
  ),
  CategoryMenu(
    category: StringConstant.reviewsName,
    items: [],
  ),
];

final List<CategoryMenu> demoCategoryMenus = [
  CategoryMenu(
    category: StringConstant.menuName,
    items: [
      Menu(
        price: 7.4,
        image: "assets/image/f_6.png",
        title: StringConstant.oysterDish,
        name: '',
      ),
      Menu(
        price: 9.0,
        image: "assets/image/f_7.png",
        title: StringConstant.oysterOn,
        name: '',
      ),
      Menu(
        price: 8.5,
        image: "assets/image/f_8.png",
        title: StringConstant.friendRice,
        name: '',
      ),
    ],
  ),
];
final List<CategoryMenu> reserCategoryMenus = [
  CategoryMenu(
    category: StringConstant.booked,
    items: [
      Menu(
        price: 7.4,
        image: "",
        title: StringConstant.notesDay,
        name: StringConstant.notesName * 5,
      ),
    ],
  ),
];

final List<CategoryMenu> reviewsCategoryMenus = [
  CategoryMenu(
    category: StringConstant.reviewsName,
    items: [
      Menu(
        price: 7.4,
        image: "",
        title: StringConstant.name,
        name: StringConstant.comment,
      ),
    ],
  ),
];

import 'package:flutter/material.dart';
import 'package:restaurant_app/feature/home_page/model/category_model.dart';
import 'package:restaurant_app/feature/home_page/model/favorite_model.dart';
import 'package:restaurant_app/feature/home_page/model/menu_draw_model.dart';
import 'package:restaurant_app/feature/home_page/model/open_Rest_model.dart';

class HomeViewModel extends ChangeNotifier {
  late final List<CategoryModel> _catItem = CategoryItems().items;
  List<CategoryModel> get catModel => _catItem;

  late final List<HomeFavoriteModel> _favItem = HomeFavoriteItems().items;
  List<HomeFavoriteModel> get favModel => _favItem;

  late final List<OpenRestModel> _openItem = OpenRestItems().items;
  List<OpenRestModel> get openModel => _openItem;

  late final List<DrawModel> _drawItem = DrawItems().items;
  List<DrawModel> get drawModel => _drawItem;

  categoryToList(CategoryModel catModel) {
    _catItem.contains(catModel);
    notifyListeners();
  }

  favoriteToList(HomeFavoriteModel favModel) {
    _favItem.contains(favModel);
    notifyListeners();
  }

  openToList(OpenRestModel openModel) {
    _openItem.contains(openModel);
    notifyListeners();
  }

  drawToList(DrawModel drawModel) {
    _drawItem.contains(drawModel);
    notifyListeners();
  }

  bool menuOpenMi = false;
  menuOpenClose() {
    menuOpenMi = !menuOpenMi;
    notifyListeners();
  }
}

import 'package:flutter/widgets.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/constants/image_const.dart';

class CategoryModel {
  final Widget imagePath;
  final String title;

  CategoryModel({required this.imagePath, required this.title});
}

class CategoryItems {
  late final List<CategoryModel> items;

  CategoryItems() {
    items = [
      CategoryModel(
          imagePath: const PngImage(name: ImageItems.seafood),
          title: StringConstant.all),
      CategoryModel(
          imagePath: const PngImage(name: ImageItems.chinese),
          title: StringConstant.chinese),
      CategoryModel(
          imagePath: const PngImage(name: ImageItems.seafood),
          title: StringConstant.seafood),
      CategoryModel(
          imagePath: const PngImage(name: ImageItems.salad),
          title: StringConstant.salad),
      CategoryModel(
          imagePath: const PngImage(name: ImageItems.salad),
          title: StringConstant.vegetarian),
    ];
  }
}

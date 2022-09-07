import 'package:flutter/widgets.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/constants/image_const.dart';

class HomeFavoriteModel {
  final Widget imagePath;
  final String title;

  HomeFavoriteModel({required this.imagePath, required this.title});
}

class HomeFavoriteItems {
  late final List<HomeFavoriteModel> items;

  HomeFavoriteItems() {
    items = [
      HomeFavoriteModel(
          imagePath: const PngImage(name: ImageItems.foodmail),
          title: StringConstant.food),
      HomeFavoriteModel(
          imagePath: const PngImage(name: ImageItems.chinesehub),
          title: StringConstant.chinesehub),
      HomeFavoriteModel(
          imagePath: const PngImage(name: ImageItems.lunch),
          title: StringConstant.lunch),
      HomeFavoriteModel(
          imagePath: const PngImage(name: ImageItems.lunch),
          title: StringConstant.banga),
    ];
  }
}

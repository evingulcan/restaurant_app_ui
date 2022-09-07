import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/constants/image_const.dart';

class FavoriteModel {
  final Widget imagePath;
  final String title;
  final String price;
  final String point;

  FavoriteModel(
      {required this.point,
      required this.price,
      required this.imagePath,
      required this.title});
}

class FavoriteItems {
  late final List<FavoriteModel> items;

  FavoriteItems() {
    items = [
      FavoriteModel(
        imagePath: const PngImage(name: ImageItems.favorite1),
        point: StringConstant.point,
        title: StringConstant.favoriName,
        price: StringConstant.prices,
      ),
      FavoriteModel(
        imagePath: const PngImage(name: ImageItems.favorite2),
        point: StringConstant.point,
        title: StringConstant.favoriName,
        price: StringConstant.prices,
      ),
      FavoriteModel(
        imagePath: const PngImage(name: ImageItems.favorite3),
        point: StringConstant.point,
        title: StringConstant.favoriName,
        price: StringConstant.prices,
      ),
      FavoriteModel(
        imagePath: const PngImage(name: ImageItems.favorite4),
        point: StringConstant.point,
        title: StringConstant.favoriName,
        price: StringConstant.prices,
      ),
      FavoriteModel(
        imagePath: const PngImage(name: ImageItems.favorite5),
        point: StringConstant.point,
        title: StringConstant.favoriName,
        price: StringConstant.prices,
      ),
      FavoriteModel(
        imagePath: const PngImage(name: ImageItems.favorite6),
        point: StringConstant.point,
        title: StringConstant.favoriName,
        price: StringConstant.prices,
      ),
    ];
  }
}

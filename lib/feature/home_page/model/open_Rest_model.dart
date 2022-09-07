import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/constants/image_const.dart';

class OpenRestModel {
  final Widget imagePath;

  final String text;
  final String title;
  final Color color;

  OpenRestModel(
      {required this.imagePath,
      required this.text,
      required this.title,
      required this.color});
}

class OpenRestItems {
  late final List<OpenRestModel> items;

  OpenRestItems() {
    items = [
      OpenRestModel(
          imagePath: const PngImage(name: ImageItems.resto),
          text: StringConstant.awesome,
          title: StringConstant.restoHouse,
          color: AppColors.poppypower),
      OpenRestModel(
          imagePath: const PngImage(name: ImageItems.arsalan),
          text: StringConstant.supercafe,
          title: StringConstant.arsalan,
          color: AppColors.outoftheblue)
    ];
  }
}

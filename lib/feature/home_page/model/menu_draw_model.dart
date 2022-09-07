import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';

class DrawModel {
  final String title;
  final Widget icon;

  DrawModel({
    required this.title,
    required this.icon,
  });
}

class DrawItems {
  late final List<DrawModel> items;

  DrawItems() {
    items = [
      DrawModel(
          icon: const Icon(
            Icons.home_outlined,
            color: AppColors.russet,
          ),
          title: StringConstant.myHome),
      DrawModel(
          icon: const Icon(
            Icons.search,
            color: AppColors.russet,
          ),
          title: StringConstant.yourOrder),
      DrawModel(
          icon: const Icon(
            Icons.settings_outlined,
            color: AppColors.russet,
          ),
          title: StringConstant.setting),
      DrawModel(
          icon: const Icon(
            Icons.help_outline,
            color: AppColors.russet,
          ),
          title: StringConstant.whish),
      DrawModel(
          icon: const Icon(
            Icons.alarm,
            color: AppColors.russet,
          ),
          title: StringConstant.menu),
      DrawModel(
          icon: const Icon(
            Icons.logout,
            color: AppColors.russet,
          ),
          title: StringConstant.logout),
    ];
  }
}

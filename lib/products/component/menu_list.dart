import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/home_page/model/menu_draw_model.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key, required DrawModel model})
      : _model = model,
        super(key: key);

  final DrawModel _model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.middlePadding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton.icon(
          onPressed: null,
          icon: _model.icon,
          label: Text(
            _model.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                ),
          ),
        ),
      ),
    );
  }
}

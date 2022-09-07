import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/home_page/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, required CategoryModel model})
      : _model = model,
        super(key: key);

  final CategoryModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pagePaddingRigth,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            child: _model.imagePath,
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Text(_model.title),
        ],
      ),
    );
  }
}

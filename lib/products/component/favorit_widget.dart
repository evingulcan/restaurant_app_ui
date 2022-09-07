import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/home_page/model/favorite_model.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({Key? key, required HomeFavoriteModel model})
      : _model = model,
        super(key: key);

  final HomeFavoriteModel _model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pagePaddingRigth,
      child: Column(
        children: [
          Container(
            height: context.dynamicHeight(0.20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
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

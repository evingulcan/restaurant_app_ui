import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/favorite_page/model/favorite_model.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    Key? key,
    required FavoriteModel model,
  })  : _model = model,
        super(key: key);
  final FavoriteModel _model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.cardPadding,
      child: Container(
        height: context.dynamicHeight(0.20),
        width: context.dynamicWidth(0.4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                offset: Offset(
                  0,
                  0,
                ),
                color: AppColors.anon,
                blurRadius: 10)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _model.imagePath,
            Padding(
              padding: context.pagePaddingLeftTopRigth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _model.title,
                  ),
                  Container(
                    width: context.dynamicWidth(0.08),
                    decoration: context.cardDecoraiton,
                    child: Center(
                      child: Text(
                        _model.point,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: context.pagePaddingLeftTop,
              child: Text('\$ ${_model.price}'),
            ),
          ],
        ),
      ),
    );
  }
}

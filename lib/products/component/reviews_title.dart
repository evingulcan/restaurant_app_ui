import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/extensions/extension.dart';

import 'package:restaurant_app/products/component/slider_column.dart';

class ReviewsCategoryItem extends StatelessWidget {
  const ReviewsCategoryItem({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.paddingNormalVertical,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Row(children: [
              SizedBox(
                height: context.dynamicHeight(0.15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConstant.rating,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      StringConstant.ratingNum,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          Icon(Icons.star,
                              size: 20,
                              color: i == 4
                                  ? AppColors.black.withOpacity(0.7)
                                  : AppColors.california),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.dynamicWidth(0.07),
              ),
              Column(children: const [
                SliderColumnWidget(
                  num: 95,
                  text: '5',
                ),
                SliderColumnWidget(
                  num: 60,
                  text: '4',
                ),
                SliderColumnWidget(
                  num: 50,
                  text: '3',
                ),
                SliderColumnWidget(
                  num: 30,
                  text: '2',
                ),
                SliderColumnWidget(
                  num: 10,
                  text: '1',
                ),
              ]),
            ]),
          ],
        ),
        ...items,
      ],
    );
  }
}

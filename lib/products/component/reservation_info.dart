import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/extensions/extension.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstant.istanbul,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: AppColors.blueMetallic),
          ),
          Row(
            children: [
              for (int i = 0; i < 5; i++)
                Icon(Icons.star,
                    size: 20,
                    color:
                        i == 4 ? AppColors.silverlined : AppColors.california),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              const Icon(Icons.mode_comment_outlined),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              Text(
                StringConstant.reviews3,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: AppColors.silverlined,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
            ],
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Row(
            children: [
              const Icon(Icons.local_atm),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              Text(
                StringConstant.under,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: AppColors.silverlined,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              const Icon(Icons.restaurant),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              Text(
                StringConstant.turk,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: AppColors.silverlined,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: context.dynamicHeight(0.01),
          ),
          Row(
            children: [
              const Icon(Icons.location_on_outlined),
              SizedBox(
                width: context.dynamicWidth(0.03),
              ),
              Text(
                StringConstant.adres,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: AppColors.silverlined,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

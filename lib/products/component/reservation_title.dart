import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/products/component/time_container_widget.dart';

class ReservationCategoryItem extends StatelessWidget {
  const ReservationCategoryItem({
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
        Row(
          children: [
            const Icon(
              Icons.date_range_outlined,
              color: AppColors.outoftheblue,
            ),
            SizedBox(
              width: context.dynamicWidth(0.03),
            ),
            Text(
              StringConstant.book,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: AppColors.outoftheblue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              width: context.dynamicWidth(0.03),
            ),
            Text(
              StringConstant.timestoday,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: AppColors.outoftheblue,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const TimeContainer(),
        ...items,
      ],
    );
  }
}

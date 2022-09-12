import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';

class ReviewsCard extends StatelessWidget {
  const ReviewsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.name,
    required this.price,
  }) : super(key: key);

  final String image, title, name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: context.dynamicHeight(0.03)),
      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.blueMetallic.withOpacity(0.4),
            child: Text(
              StringConstant.dl,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(width: context.dynamicWidth(0.03)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ]),
        SizedBox(height: context.dynamicHeight(0.02)),
        Row(
          children: [
            for (int i = 0; i < 5; i++)
              Icon(Icons.star,
                  size: 20,
                  color: i == 4 ? Colors.black45 : AppColors.california),
          ],
        ),
      ]),
    ]);
  }
}

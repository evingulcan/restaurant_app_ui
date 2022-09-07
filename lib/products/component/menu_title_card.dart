import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String image, title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.dynamicWidth(0.30),
          height: context.dynamicHeight(0.13),
          child: Image.asset(image),
        ),
        SizedBox(width: context.dynamicWidth(0.05)),
        Expanded(
          child: DefaultTextStyle(
            style: const TextStyle(color: AppColors.silverlined),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                const Text(
                  StringConstant.shortbread,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                Row(
                  children: [
                    const Text(StringConstant.price),
                    SizedBox(
                      width: context.dynamicWidth(0.02),
                    ),
                    const CircleAvatar(
                      radius: 2,
                      backgroundColor: AppColors.darkGrey,
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.02),
                    ),
                    const Text(StringConstant.chinese),
                    const Spacer(),
                    Text(
                      "USD$price",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.california,
                            fontWeight: FontWeight.w500,
                          ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

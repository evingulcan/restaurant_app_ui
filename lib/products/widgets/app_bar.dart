import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_string.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: color,
              size: 20,
            )),
        Text(
          StringConstant.back,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

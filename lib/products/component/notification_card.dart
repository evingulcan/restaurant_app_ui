import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/image_const.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/notification_page/model/notification_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key, required NotificationModel model})
      : _model = model,
        super(key: key);

  final NotificationModel _model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pagePadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _model.imagePath,
          SizedBox(
            width: context.dynamicWidth(0.05),
          ),
          SizedBox(
            width: context.dynamicWidth(0.70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _model.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.darkGrey, fontWeight: FontWeight.bold),
                ),
                Text(
                  _model.text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.darkGrey, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const PngImage(name: ImageItems.clock),
                    SizedBox(
                      width: context.dynamicWidth(0.03),
                    ),
                    Text(
                      _model.date,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.chanceofrain,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

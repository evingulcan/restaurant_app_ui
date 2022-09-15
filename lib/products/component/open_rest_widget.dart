import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/home_page/model/open_rest_model.dart';

class OpenRestWidget extends StatelessWidget {
  const OpenRestWidget({Key? key, required OpenRestModel model})
      : _model = model,
        super(key: key);

  final OpenRestModel _model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.14),
      width: context.dynamicWidth(0.80),
      decoration: context.boxDecoraiton,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _model.imagePath,
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  _model.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.blueMetallic,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: context.dynamicWidth(0.02),
                ),
                Container(
                  height: context.dynamicHeight(0.03),
                  width: context.dynamicWidth(0.35),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _model.color,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.white,
                          size: 20,
                        ),
                        Text(
                          _model.text,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold),
                        ),
                        Container()
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: context.dynamicHeight(0.01),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on_outlined, color: Colors.black26),
                Text(
                  StringConstant.addresText,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.black.withOpacity(0.2),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: context.dynamicHeight(0.01),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('35-42 Min'),
                SizedBox(
                  width: context.dynamicWidth(0.03),
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20,
                ),
                const Text('4.5'),
                SizedBox(
                  width: context.dynamicWidth(0.03),
                ),
                const Icon(
                  Icons.call,
                  size: 20,
                ),
                SizedBox(
                  width: context.dynamicWidth(0.02),
                ),
                const Text(StringConstant.contact),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

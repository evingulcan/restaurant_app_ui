import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/core/constants/image_const.dart';
import 'package:kartal/kartal.dart';
import 'package:restaurant_app/core/extensions/extension.dart';

class RestaruantAppBar extends StatelessWidget {
  const RestaruantAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      const PngImage(name: ImageItems.resto4),
      const PngImage(name: ImageItems.resto1),
    ];
    return SliverAppBar(
      expandedHeight: context.dynamicHeight(0.21),
      backgroundColor: AppColors.white,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: _stackWidget(list, context),
      ),
      leading: Padding(
        padding: context.paddingNormalLeft,
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {},
          ),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          child: IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: context.paddingLowHorizontal,
          child: CircleAvatar(
            backgroundColor: AppColors.white,
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  Stack _stackWidget(List<Widget> list, BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            enlargeCenterPage: false,
          ),
          items: list
              .map((item) => SizedBox(
                  height: context.dynamicHeight(0.10),
                  width: MediaQuery.of(context).size.width,
                  child: item))
              .toList(),
        ),
        Padding(
          padding: context.pagePaddingTop,
          child: Center(
            child: Container(
              height: context.dynamicHeight(0.04),
              width: context.dynamicWidth(0.40),
              decoration: context.middelDecoraiton,
              child: Center(
                child: Text(
                  StringConstant.seeAll,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

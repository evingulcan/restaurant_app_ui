import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/reservation_page/model/reservation_model.dart';

class RestaurantCategories extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;
  RestaurantCategories({
    required this.onChanged,
    required this.selectedIndex,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        height: 52,
        color: AppColors.white,
        child: Categories(onChanged: onChanged, selectedIndex: selectedIndex));
  }

  @override
  double get maxExtent => 52;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class Categories extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final int selectedIndex;
  const Categories(
      {Key? key, required this.onChanged, required this.selectedIndex})
      : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Categories oldWidget) {
    controller.animateTo(80.0 * widget.selectedIndex,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              allCategoryMenus.length,
              (index) => Padding(
                padding: context.pagePaddingLeft,
                child: TextButton(
                  onPressed: () {
                    widget.onChanged(index);
                  },
                  style: TextButton.styleFrom(
                      primary: widget.selectedIndex == index
                          ? AppColors.poppypower
                          : AppColors.chanceofrain),
                  child: Text(
                    allCategoryMenus[index].category,
                    style: const TextStyle(fontSize: 20),
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

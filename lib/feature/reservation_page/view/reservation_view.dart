import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/reservation_page/model/reservation_model.dart';
import 'package:restaurant_app/feature/reservation_page/viewModel/reservation_view_model.dart';
import 'package:restaurant_app/products/component/menu_title_card.dart';
import 'package:restaurant_app/products/component/reservation_categories.dart';
import 'package:restaurant_app/products/component/menu_title.dart';
import 'package:restaurant_app/products/component/person_dateTime_widget.dart';
import 'package:restaurant_app/products/component/reservation_appBar.dart';
import 'package:restaurant_app/products/component/reservation_info.dart';
import 'package:restaurant_app/products/component/reservation_title.dart';
import 'package:restaurant_app/products/component/reservation_title_card.dart';
import 'package:restaurant_app/products/component/reviews_title.dart';
import 'package:restaurant_app/products/component/reviews_title_card.dart';
import 'package:restaurant_app/products/mixin/reservation_category.dart';
import 'package:restaurant_app/products/widgets/bottom_navbar.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({Key? key}) : super(key: key);

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage>
    with ReservationCategory {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavbar(pageid: 1),
        backgroundColor: AppColors.white,
        body: Consumer(
          builder: ((context, value, child) {
            return CustomScrollView(controller: scrollController, slivers: [
              const RestaruantAppBar(),
              const SliverToBoxAdapter(
                child: RestaurantInfo(),
              ),
              SliverPersistentHeader(
                delegate: RestaurantCategories(
                  onChanged:
                      context.read<ReservationViewModel>().scrollToCategory,
                  selectedIndex: context
                      .read<ReservationViewModel>()
                      .selectedCategoryIndex,
                ),
                pinned: true,
              ),
              SliverPadding(
                padding: context.paddingLowHorizontal,
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, categoryIndex) {
                      List<Menu> itemRs =
                          reserCategoryMenus[categoryIndex].items;
                      List<Menu> itemRv =
                          reviewsCategoryMenus[categoryIndex].items;
                      List<Menu> itemM = demoCategoryMenus[categoryIndex].items;
                      return Column(
                        children: [
                          const PersonDateTimeWidget(),
                          SizedBox(
                            height: context.dynamicHeight(0.03),
                          ),
                          _reservationCategory(categoryIndex, itemRs, context),
                          _menuCategory(categoryIndex, itemM, context),
                          _reviewsCategory(categoryIndex, itemRv, context),
                        ],
                      );
                    },
                    childCount: demoCategoryMenus.length,
                  ),
                ),
              ),
            ]);
          }),
        ));
  }

  ReviewsCategoryItem _reviewsCategory(
      int categoryIndex, List<Menu> itemRv, BuildContext context) {
    return ReviewsCategoryItem(
      title: reviewsCategoryMenus[categoryIndex].category,
      items: List.generate(
        itemRv.length,
        (index) => Padding(
          padding: context.pagePaddingBottom,
          child: ReviewsCard(
            name: itemRv[index].name,
            title: itemRv[index].title,
            image: itemRv[index].image,
            price: itemRv[index].price,
          ),
        ),
      ),
    );
  }

  MenuCategoryItem _menuCategory(
      int categoryIndex, List<Menu> itemM, BuildContext context) {
    return MenuCategoryItem(
      title: demoCategoryMenus[categoryIndex].category,
      items: List.generate(
        itemM.length,
        (index) => Padding(
          padding: context.pagePaddingBottom,
          child: MenuCard(
            title: itemM[index].title,
            image: itemM[index].image,
            price: itemM[index].price,
          ),
        ),
      ),
    );
  }

  ReservationCategoryItem _reservationCategory(
      int categoryIndex, List<Menu> itemRs, BuildContext context) {
    return ReservationCategoryItem(
      title: reserCategoryMenus[categoryIndex].category,
      items: List.generate(
        itemRs.length,
        (index) => Padding(
            padding: context.pagePaddingBottomTop,
            child: Column(
              children: [
                ReservationCard(
                  title: itemRs[index].title,
                  image: itemRs[index].image,
                  price: itemRs[index].price,
                  name: itemRs[index].name,
                ),
              ],
            )),
      ),
    );
  }
}

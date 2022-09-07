import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/feature/reservation_page/model/reservation_model.dart';
import 'package:restaurant_app/feature/reservation_page/viewModel/reservation_view_model.dart';

final scrollController = ScrollController();
List<double> breackPoints = [];
mixin ReservationCategory<T extends StatefulWidget> on State<T> {
  double restoInfoHeight = 200 + 170 - kToolbarHeight;

  @override
  void initState() {
    super.initState();
    createBreackPoints();
    scrollController.addListener(() {
      context
          .read<ReservationViewModel>()
          .updateCategoryIndexOnScroll(scrollController.offset);
    });
  }

  void createBreackPoints() {
    double firstBreackPoint =
        restoInfoHeight + 50 + (116 * allCategoryMenus[0].items.length);
    breackPoints.add(firstBreackPoint);
    for (var i = 1; i < allCategoryMenus.length; i++) {
      double breackPoint =
          breackPoints.last + 50 + (116 * allCategoryMenus[0].items.length);
      breackPoints.add(breackPoint);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_app/feature/reservation_page/model/reservation_model.dart';
import 'package:restaurant_app/products/mixin/reservation_category.dart';

class ReservationViewModel extends ChangeNotifier {
  List<String> toTimeList = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14"
  ];

  List<bool> toTimeListSelect = [
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  var formattedDate = DateFormat(' h:mm a, d MMM, EEEE').format(DateTime.now());
  String selectedToTime = "2";
  int selectedCategoryIndex = 0;

  double restoInfoHeight = 200 + 170 - kToolbarHeight;

  updateToList(int index) {
    toTimeListSelect[index] = !toTimeListSelect[index];
    toTimeListSelect[index] == true
        ? selectedToTime = toTimeList[index]
        : selectedToTime = ' ';
    notifyListeners();

    for (int i = 0; i < toTimeListSelect.length; i++) {
      toTimeListSelect[i] = false;
      notifyListeners();
    }
    toTimeListSelect[index] = !toTimeListSelect[index];
    toTimeListSelect[index] == true
        ? selectedToTime = toTimeList[index]
        : selectedToTime = ' ';
    notifyListeners();
  }

  dateToList(DateTime dateTime) {
    formattedDate = dateTime as String;
    notifyListeners();
  }

  scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;

      for (var i = 0; i < index; i++) {
        totalItems += allCategoryMenus[i].items.length;
      }
      scrollController.animateTo(
        restoInfoHeight + (116 * totalItems) + (50 * index),
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

      selectedCategoryIndex = index;
      notifyListeners();
    }
  }

  updateCategoryIndexOnScroll(double offset) {
    for (var i = 0; i < allCategoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breackPoints.first) & (selectedCategoryIndex != 0)) {
          selectedCategoryIndex = 0;
          notifyListeners();
        }
      } else {
        if ((breackPoints[i - 1] <= offset) & (offset < breackPoints[i])) {
          if (selectedCategoryIndex != i) {
            selectedCategoryIndex = i;
            notifyListeners();
          }
        }
      }
    }
  }
}

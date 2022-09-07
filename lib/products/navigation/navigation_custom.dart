import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/feature/favorite_page/view/favorite_view.dart';
import 'package:restaurant_app/feature/home_page/view/home_view.dart';
import 'package:restaurant_app/feature/notification_page/view/notification_view.dart';
import 'package:restaurant_app/feature/profile_page/view/profile_view.dart';
import 'package:restaurant_app/feature/reservation_page/view/reservation_view.dart';
import 'package:restaurant_app/main.dart';

mixin NavigatorCustom<T extends MyApp> on Widget {
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    List<String> filtered = routeSettings.name!.split("/");
    switch (filtered[1]) {
      case "/":
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          settings: routeSettings,
          reverseDuration: const Duration(seconds: 0),
        );
      case StringConstant.profil:
        return PageTransition(
          child: const ProfilePage(),
          type: PageTransitionType.fade,
          settings: routeSettings,
          reverseDuration: const Duration(seconds: 0),
        );
      case StringConstant.shop:
        return PageTransition(
          child: const ReservationsPage(),
          type: PageTransitionType.fade,
          settings: routeSettings,
          reverseDuration: const Duration(seconds: 0),
        );
      case StringConstant.home:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          settings: routeSettings,
          reverseDuration: const Duration(seconds: 0),
        );

      case StringConstant.favorite:
        return PageTransition(
          child: const FavoritePage(),
          type: PageTransitionType.fade,
          settings: routeSettings,
          reverseDuration: const Duration(seconds: 0),
        );
      case StringConstant.notification:
        return PageTransition(
          child: const NotificationPage(),
          type: PageTransitionType.fade,
          settings: routeSettings,
          reverseDuration: const Duration(seconds: 0),
        );
    }
    return null;
  }
}

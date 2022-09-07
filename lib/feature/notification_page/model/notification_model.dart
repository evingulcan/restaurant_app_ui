import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/core/constants/image_const.dart';

class NotificationModel {
  final Widget imagePath;
  final String title;
  final String text;
  final String date;

  NotificationModel(
      {required this.date,
      required this.text,
      required this.imagePath,
      required this.title});
}

class NotificationItems {
  late final List<NotificationModel> items;

  NotificationItems() {
    items = [
      NotificationModel(
        imagePath: const PngImage(name: ImageItems.logo),
        date: 'Just now',
        title: 'Banjour Creperie has accept your order',
        text: '',
      ),
      NotificationModel(
        imagePath: const PngImage(name: ImageItems.logo1),
        date: 'Just now',
        title: 'Your Order is arriving soon',
        text: 'Delivery boy has almost reached your location with your order',
      ),
      NotificationModel(
        imagePath: const PngImage(name: ImageItems.logo2),
        date: '28 May, 2022',
        title: 'Your Order is on the way!',
        text: 'Tap here to track your order from Hello Bangla',
      ),
      NotificationModel(
        imagePath: const PngImage(name: ImageItems.logo3),
        date: '20 May, 2022',
        title: 'Message form the Cheesy',
        text: 'I am waiting at the door,please collect your',
      ),
      NotificationModel(
        imagePath: const PngImage(name: ImageItems.logo4),
        date: '16 May, 2020',
        title: 'Super Haji Biryani',
        text: 'Tap here to track your order form Super haji biryani',
      ),
      NotificationModel(
        imagePath: const PngImage(name: ImageItems.logo5),
        date: '12 May, 2020',
        title: 'Delivered to you in wrap speed!',
        text:
            'Your order was teleported to you in 18 minutesi Enjoy it while we beam our delivery captain back',
      ),
    ];
  }
}

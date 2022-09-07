import 'package:flutter/material.dart';
import 'package:restaurant_app/feature/notification_page/model/notification_model.dart';

class NotificationViewModel extends ChangeNotifier {
  late final List<NotificationModel> _items = NotificationItems().items;
  List<NotificationModel> get ntfModel => _items;

  ntfToList(NotificationModel ntfModel) {
    _items.contains(ntfModel);
    notifyListeners();
  }
}

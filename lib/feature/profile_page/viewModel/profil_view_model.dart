import 'package:flutter/material.dart';
import 'package:restaurant_app/feature/profile_page/model/image_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../login_register_page/model/users_model.dart';

class ProfileViewModel extends ChangeNotifier {
  late final List<ImageModel> _items = ImageModelItems().items;
  List<ImageModel> get imgModel => _items;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  profileToList(ImageModel imgModel) {
    _items.contains(imgModel);
    notifyListeners();
  }

  firebaseName() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      notifyListeners();
    });
  }
}

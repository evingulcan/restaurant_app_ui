import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant_app/core/constants/app_string.dart';
import 'package:restaurant_app/feature/home_page/view/home_view.dart';
import 'package:restaurant_app/feature/login_Register_Page/model/users_model.dart';
import 'package:restaurant_app/products/widgets/text_form_field.dart';

final fullNameEditingController = TextEditingController();
final emailEditingController = TextEditingController();
final passwordEditingController = TextEditingController();
final confirmPasswordEditingController = TextEditingController();

mixin Validation<T extends StatefulWidget> on State<T> {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  final fullNameField = AuthTextField(
    controller: fullNameEditingController,
    validator: (value) {
      RegExp regex = RegExp(r'^.{3,}$');
      if (value!.isEmpty) {
        return ("First Name cannot be Empty");
      }
      if (!regex.hasMatch(value)) {
        return ("Enter Valid name(Min. 3 Character)");
      }
      return null;
    },
    onSaved: (value) {
      fullNameEditingController.text = value!;
    },
    changeObscureCallBack: () {},
    hintText: StringConstant.fullName,
  );

  final emailField = AuthTextField(
    controller: emailEditingController,
    hintText: StringConstant.emailAdress,
    changeObscureCallBack: () {},
    validator: (value) {
      if (value!.isEmpty) {
        return ("Please Enter Your Email");
      }

      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
        return ("Please Enter a valid email");
      }
      return null;
    },
    onSaved: (value) {
      fullNameEditingController.text = value!;
    },
  );

  final passwordField = AuthTextField(
    controller: passwordEditingController,
    hintText: StringConstant.password,
    isObsecure: true,
    changeObscureCallBack: () {},
    validator: (value) {
      RegExp regex = RegExp(r'^.{6,}$');
      if (value!.isEmpty) {
        return ("Password is required for login");
      }
      if (!regex.hasMatch(value)) {
        return ("Enter Valid Password(Min. 6 Character)");
      }
      return null;
    },
    onSaved: (value) {
      fullNameEditingController.text = value!;
    },
  );

  void signUp(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  void signIn(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login successful..."),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage())),
                })
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login successful..."),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage())),
                })
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login successful..."),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests.";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.fullName = fullNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Created Successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }
}

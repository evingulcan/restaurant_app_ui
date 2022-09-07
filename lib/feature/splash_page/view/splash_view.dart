import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/duration_items.dart';
import 'package:restaurant_app/core/constants/image_const.dart';
import 'package:restaurant_app/feature/login_register_page/view/login_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(DurationItems.durationNormal(), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: const [
      Center(
        child: LottieImage(
          name: ImageItems.knife,
        ),
      ),
    ]));
  }
}

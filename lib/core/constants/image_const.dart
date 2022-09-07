import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class ImageItems {
  final loginlogoImage = "image";
  final gamil = 'gmail';
  final facebook = 'facebook';
  final admin = 'admin';
  final menu = 'menu';
  static const logo = 'logo';
  static const logo1 = 'logo1';
  static const logo2 = 'logo2';
  static const logo3 = 'logo3';
  static const logo4 = 'logo4';
  static const logo5 = 'logo5';
  static const logo6 = 'logo6';
  static const clock = 'clock';
  static const favorite1 = 'heart1';
  static const favorite2 = 'heart2';
  static const favorite3 = 'heart3';
  static const favorite4 = 'heart4';
  static const favorite5 = 'heart5';
  static const favorite6 = 'heart6';
  static const profileImage = 'profil';
  static const stackImage = 'stack';
  static const logImage = 'logo';
  static const mask1 = 'mask1';
  static const mask2 = 'mask2';
  static const mask3 = 'mask3';
  static const mask4 = 'mask4';
  static const mask5 = 'mask5';
  static const mask6 = 'mask6';
  static const resto1 = 'resto1';
  static const resto4 = 'resto4';
  static const chinese = 'chinese';
  static const seafood = 'seafood';
  static const salad = 'salad';
  static const foodmail = 'foodmail';
  static const chinesehub = 'chinesehub';
  static const lunch = 'lunch';
  static const resto = 'resto';
  static const arsalan = 'arsalan';
  static const knife = 'knife';
}

class PngImage extends StatelessWidget {
  const PngImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(_nameWithPath, fit: BoxFit.fitHeight);
  }

  String get _nameWithPath => 'assets/image/$name.png';
}

class SvgImage extends StatelessWidget {
  const SvgImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(_nameWithPath, fit: BoxFit.cover);
  }

  String get _nameWithPath => 'assets/svgs/$name.svg';
}

class LottieImage extends StatelessWidget {
  const LottieImage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(_nameWithPath, fit: BoxFit.cover);
  }

  String get _nameWithPath => 'assets/lotties/$name.json';
}

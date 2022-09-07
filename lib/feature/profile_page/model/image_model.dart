import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/core/constants/image_const.dart';

class ImageModel {
  final Widget imagePath;

  ImageModel({
    required this.imagePath,
  });
}

class ImageModelItems {
  late final List<ImageModel> items;

  ImageModelItems() {
    items = [
      ImageModel(imagePath: const PngImage(name: ImageItems.mask1)),
      ImageModel(
        imagePath: const PngImage(name: ImageItems.mask2),
      ),
      ImageModel(
        imagePath: const PngImage(name: ImageItems.mask3),
      ),
      ImageModel(
        imagePath: const PngImage(name: ImageItems.mask4),
      ),
      ImageModel(
        imagePath: const PngImage(name: ImageItems.mask5),
      ),
      ImageModel(
        imagePath: const PngImage(name: ImageItems.mask6),
      ),
    ];
  }
}

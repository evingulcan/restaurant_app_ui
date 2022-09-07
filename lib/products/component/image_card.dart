import 'package:flutter/material.dart';
import 'package:restaurant_app/core/extensions/extension.dart';
import 'package:restaurant_app/feature/profile_page/model/image_model.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required ImageModel model,
  })  : _model = model,
        super(key: key);
  final ImageModel _model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.cardPadding,
      child: _model.imagePath,
    );
  }
}

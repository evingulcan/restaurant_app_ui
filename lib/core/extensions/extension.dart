import 'package:flutter/material.dart';
import 'package:restaurant_app/core/constants/app_colors.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get pagePadding => const EdgeInsets.all(10.0);
  EdgeInsets get cardPadding => const EdgeInsets.all(8.0);
  EdgeInsets get personPadding => const EdgeInsets.all(6.0);

  EdgeInsets get largePadding => const EdgeInsets.all(30.0);
  EdgeInsets get pagePaddingTopLeft =>
      const EdgeInsets.only(top: 90.0, left: 30.0);
  EdgeInsets get pagePaddingLeftTop => const EdgeInsets.only(left: 9, top: 2);
  EdgeInsets get pagePaddingLeftTopRigth =>
      const EdgeInsets.only(left: 8, right: 8, top: 8);
  EdgeInsets get pagePaddingTopLef =>
      const EdgeInsets.only(left: 145, top: 105);
  EdgeInsets get appPaddingTopLeft =>
      const EdgeInsets.only(top: 20.0, left: 10.0);
  EdgeInsets get pagePaddingBottomTop =>
      const EdgeInsets.only(bottom: 16, top: 10);
  EdgeInsets get pagePaddingBottom => const EdgeInsets.only(bottom: 16);
  EdgeInsets get pagePaddingTop => const EdgeInsets.only(top: 170);
  EdgeInsets get pagePaddingLeft => const EdgeInsets.only(left: 8);
  EdgeInsets get middlePadding => const EdgeInsets.only(left: 20.0);
  EdgeInsets get dashPadding => const EdgeInsets.only(left: 20, top: 50);
  EdgeInsets get pagePaddingRigth => const EdgeInsets.only(right: 20);
  EdgeInsets get pagePaddingLetfTopRigth =>
      const EdgeInsets.only(left: 30, right: 150, top: 30);
  EdgeInsets get likePadding => const EdgeInsets.only(right: 140);
  EdgeInsets get pagePaddingAll =>
      const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10);
  EdgeInsets get topPadding => const EdgeInsets.only(top: 80);
  EdgeInsets get pageTopPadding => const EdgeInsets.only(top: 20);
}

extension BorderExtension on BuildContext {
  BorderRadius get radiusAll => const BorderRadius.all(Radius.circular(10));
}

extension DecorationExtension on BuildContext {
  BoxDecoration get boxDecoraiton => BoxDecoration(
      color: AppColors.white, borderRadius: BorderRadius.circular(5));
  BoxDecoration get smallDecoraiton => BoxDecoration(
      color: AppColors.flataluminum, borderRadius: BorderRadius.circular(5));
  BoxDecoration get cardDecoraiton => BoxDecoration(
      color: AppColors.california, borderRadius: BorderRadius.circular(3));
  BoxDecoration get middelDecoraiton => BoxDecoration(
      color: AppColors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(20));
  BoxDecoration get colormiddelDecoraiton => BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.darkGrey,
          width: 2.0,
        ),
      );
  BoxDecoration get slidermiddelDecoraiton => BoxDecoration(
      color: AppColors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20),
      border:
          Border.all(color: AppColors.darkGrey.withOpacity(0.03), width: 1.0));
  BoxDecoration get sliderDecoraiton => BoxDecoration(
      color: AppColors.poppypower, borderRadius: BorderRadius.circular(20));

  BoxDecoration get timeDecoraiton => BoxDecoration(
      color: AppColors.poppypower, borderRadius: BorderRadius.circular(5));
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingNormalLeft => EdgeInsets.only(left: normalValue);
  EdgeInsets get paddingNormalRigth => EdgeInsets.only(right: normalValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingLowHorizontalVertical =>
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10);
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
}

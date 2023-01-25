import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * .01;
  double get normalValue => height * .02;
  double get mediumValue => height * .04;
  double get highValue => height * .1;

  //BorderRadius All
  BorderRadius get borderRadiusLow => BorderRadius.circular(lowValue);
  BorderRadius get borderRadiusNormal => BorderRadius.circular(normalValue);
  BorderRadius get borderRadiusMedium => BorderRadius.circular(mediumValue);
  BorderRadius get borderRadiusHigh => BorderRadius.circular(highValue);
  //BorderRadius Left
  BorderRadius get borderRadiusLeftLow => BorderRadius.only(
      topLeft: Radius.circular(lowValue),
      bottomLeft: Radius.circular(lowValue));

  //PaddingAll
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  //PaddingSymectric
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);

  //Duration
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
  Duration get mediumDuration => const Duration(milliseconds: 1500);
  Duration get highDuration => const Duration(seconds: 3);

  //Elevation
  double get normalElevation => 4.0;
}

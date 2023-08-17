import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get themeData => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * .01;
  double get normalValue => height * .02;
  double get mediumValue => height * .04;
  double get highValue => height * .1;

  double get highWidthValue => width * .1;

  double dynamicHeight(double value) => mediaQuery.size.height * value;
  double dynamicWidth(double value) => mediaQuery.size.width * value;

  //BorderRadius All
  BorderRadius get borderRadiusLow => BorderRadius.circular(lowValue);
  BorderRadius get borderRadiusNormal => BorderRadius.circular(normalValue);
  BorderRadius get borderRadiusMedium => BorderRadius.circular(mediumValue);
  BorderRadius get borderRadiusHigh => BorderRadius.circular(highValue);

  //BorderRadius Left
  BorderRadius get borderRadiusLeftLow => BorderRadius.only(
        topLeft: Radius.circular(lowValue),
        bottomLeft: Radius.circular(lowValue),
      );

  //PaddingAll
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  //PaddingTop
  EdgeInsets get paddingTopLow => EdgeInsets.only(top: height * .01);
  EdgeInsets get paddingTopNormal => EdgeInsets.only(top: height * .02);
  EdgeInsets get paddingTopMedium => EdgeInsets.only(top: height * .04);
  EdgeInsets get paddingTopHigh => EdgeInsets.only(top: height * .1);

  //PaddingLeft
  EdgeInsets get paddingLeftLow => EdgeInsets.only(left: width * .01);
  EdgeInsets get paddingLeftNormal => EdgeInsets.only(left: width * .02);
  EdgeInsets get paddingLeftMedium => EdgeInsets.only(left: width * .04);
  EdgeInsets get paddingLeftHigh => EdgeInsets.only(left: width * .1);

  //PaddingSymectric
  EdgeInsets get paddingScaffold => const EdgeInsets.symmetric(horizontal: 4);
  EdgeInsets get paddingMediumScaffold =>
      EdgeInsets.symmetric(horizontal: normalValue);

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
  Duration get navigationDuration => const Duration(milliseconds: 200);
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
  Duration get mediumDuration => const Duration(milliseconds: 1500);
  Duration get highDuration => const Duration(seconds: 3);

  //Elevation
  double get normalElevation => 4;
  double get mediumElevation => 6;
  double get heighElevation => 8;
}

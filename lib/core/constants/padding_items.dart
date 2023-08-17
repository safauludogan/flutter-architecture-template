import 'package:flutter/cupertino.dart';

class PaddingItems {
  PaddingItems._();
  static EdgeInsets paddingScaffold =
      const EdgeInsets.symmetric(horizontal: 16);

  static EdgeInsets paddingVerticalMedium = const EdgeInsets.symmetric(vertical: 16);

  static EdgeInsets paddingHorizontalLow = const EdgeInsets.symmetric(horizontal: 8);
  static EdgeInsets paddingHorizontalSemiMedium =
      const EdgeInsets.symmetric(horizontal: 12);
  static EdgeInsets paddingHorizontalMedium =
      const EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets paddingHorizontalHigh =
      const EdgeInsets.symmetric(horizontal: 24);
  static EdgeInsets paddingHorizontalVeryHigh =
      const EdgeInsets.symmetric(horizontal: 36);

  static EdgeInsets paddingAllVeryMicroLow = const EdgeInsets.all(2);
  static EdgeInsets paddingAllVeryMuchLow = const EdgeInsets.all(3);
  static EdgeInsets paddingAllVeryLow = const EdgeInsets.all(4);
  static EdgeInsets paddingAllLow = const EdgeInsets.all(8);
  static EdgeInsets paddingAllSemiLow = const EdgeInsets.all(12);
  static EdgeInsets paddingAllMedium = const EdgeInsets.all(16);
  static EdgeInsets paddingAllSemiMedium = const EdgeInsets.all(20);
  static EdgeInsets paddingAllHigh = const EdgeInsets.all(24);

  static EdgeInsets paddingHighLeftLowBottomTop =
      const EdgeInsets.only(left: 16, top: 8, bottom: 8);

  static EdgeInsets paddingTopVeryLow = const EdgeInsets.only(top: 4);
  static EdgeInsets paddingTopLow = const EdgeInsets.only(top: 8);
  static EdgeInsets paddingTopMedium = const EdgeInsets.only(top: 12);
  static EdgeInsets paddingTopHigh = const EdgeInsets.only(top: 16);
  static EdgeInsets paddingTopVeryHigh = const EdgeInsets.only(top: 20);

  static EdgeInsets paddingTopBottomMedium =
      const EdgeInsets.only(top: 14, bottom: 14);
  static EdgeInsets paddingTopBottomHigh = const EdgeInsets.only(top: 16, bottom: 16);

  static EdgeInsets paddingLeftBottomLow = const EdgeInsets.only(left: 16, bottom: 16);

  static EdgeInsets paddingRightBottomLow = const EdgeInsets.only(right: 8, bottom: 8);

  static EdgeInsets paddingBottomLow = const EdgeInsets.only(bottom: 8);
  static EdgeInsets paddingBottomHigh = const EdgeInsets.only(bottom: 24);

  static EdgeInsets paddingRightLow = const EdgeInsets.only(right: 8);

  static EdgeInsets paddingLeftLow = const EdgeInsets.only(left: 8);
  static EdgeInsets paddingLeftMedium = const EdgeInsets.only(left: 16);
}

class MarginItems {
  MarginItems._();
  static EdgeInsets marginAllMedium = const EdgeInsets.all(8);
  static EdgeInsets marginLeftLow = const EdgeInsets.only(top: 8);

  static EdgeInsets marginBottomLow = const EdgeInsets.only(bottom: 8);
}

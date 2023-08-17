import 'package:flutter/material.dart';

class BorderRadiusItem extends BorderRadius {
  const BorderRadiusItem.leftLowCircular()
      : super.only(
            bottomLeft: const Radius.circular(8),
            topLeft: const Radius.circular(8),);
  const BorderRadiusItem.leftMediumCircular()
      : super.only(
            bottomLeft: const Radius.circular(16),
            topLeft: const Radius.circular(16),);

  const BorderRadiusItem.rightMediumCircular()
      : super.only(
            bottomRight: const Radius.circular(16),
            topRight: const Radius.circular(16),);

  BorderRadiusItem.veryLowCircular() : super.circular(4);
  BorderRadiusItem.lowCircular() : super.circular(8);
  BorderRadiusItem.semiLowCircular() : super.circular(12);
  BorderRadiusItem.mediumCircular() : super.circular(16);
  BorderRadiusItem.mediumHeightCircular() : super.circular(20);
  BorderRadiusItem.semiMediumCircular() : super.circular(24);
  BorderRadiusItem.highCircular() : super.circular(32);
  BorderRadiusItem.maxCircular() : super.circular(100);

  const BorderRadiusItem.mediumBottom()
      : super.only(
            bottomLeft: const Radius.circular(16),
            bottomRight: const Radius.circular(16),);

  const BorderRadiusItem.semiMediumBottom()
      : super.only(
            bottomLeft: const Radius.circular(20),
            bottomRight: const Radius.circular(20),);
  const BorderRadiusItem.semiHeightBottom()
      : super.only(
            bottomLeft: const Radius.circular(45),
            bottomRight: const Radius.circular(45),);

  const BorderRadiusItem.mediumTop()
      : super.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),);

  const BorderRadiusItem.heightTop()
      : super.only(
            topLeft: const Radius.circular(30),
            topRight: const Radius.circular(30),);
}

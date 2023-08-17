import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SvgPath {
  checked('svg_checked'),
  denied('svg_denied'),
  info('svg_info'),
  warning('svg_warning');

  const SvgPath(this.value);
  final String value;
}

extension SvgPathExtension on SvgPath {
  Widget toWidget({required BuildContext context, double? size, Color? color}) {
    return SvgPicture.asset(
      withPath(value),
      color: color,
      height: size ?? 30,
      width: size ?? 30,
    );
  }

  String withPath(String path) => 'assets/svg/$path.svg';
}

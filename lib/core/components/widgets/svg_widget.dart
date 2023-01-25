import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  SvgWidget({super.key, required this.svgPath, this.size, this.color});
  String svgPath;
  double? size;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        color: color,
        svgPath,
        height: size ?? context.highValue,
        width: size ?? context.highValue);
  }
}

class SvgPath {
  SvgPath._();
  static final String svgCheckPath = '${_svgPath}svg_check_accept.svg';
  static final String svgDeniedPath = '${_svgPath}svg_check_denied.svg';
  static final String svgInfoPath = '${_svgPath}svg_info.svg';
  static final String svgWarningPath = '${_svgPath}svg_warning.svg';
}

String get _svgPath => 'assets/svg/';

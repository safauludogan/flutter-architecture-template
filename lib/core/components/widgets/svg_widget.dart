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
        height: context.dynamicHeight(size ?? .1),
        width: context.dynamicWidth(size ?? .1));
  }
}

class SvgPath {
  SvgPath._();
  static final String svgCheckPath = '${_svgPath}svg_check_accept.svg';
  static final String svgDeniedPath = '${_svgPath}svg_check_denied.svg';
  static final String svgInfoPath = '${_svgPath}svg_info.svg';
  static final String svgWarningPath = '${_svgPath}svg_warning.svg';
  static final String svgLoginPath = '${_svgPath}svg_login.svg';
  static final String svgCalendarPath = '${_svgPath}svg_calendar.svg';
  static final String svgWatchPath = '${_svgPath}svg_watch.svg';
  static final String svgHomePath = '${_svgPath}svg_home.svg';
  static final String svgTaleplerPath = '${_svgPath}svg_talepler.svg';
  static final String svgGecmisTaleplerPath = '${_svgPath}svg_gecmis_talepler.svg';
  static final String svgEmptyPath = '${_svgPath}svg_empty_list.svg';
  static final String svgNoDataPath = '${_svgPath}svg_no_data.svg';
  static final String svgVekaletPath = '${_svgPath}svg_vekalet.svg';
}

String get _svgPath => 'assets/svg/';

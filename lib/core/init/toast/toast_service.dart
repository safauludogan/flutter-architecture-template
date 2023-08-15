import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/widgets/svg_widget.dart';
import 'package:flutter_architecture_template/core/constants/project_variables.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';
import '../../../product/navigator/app_router.dart';
import '../../constants/colors.dart';
import '../../constants/project_items.dart';
import '../main/main_init.dart';

enum ToastType { success, error, info, warning }

String? _svgPath;
String? _toastTitle;
Color? _color;
Color? _leftBorderColor;

mixin ToastService {
  void showToast({required String label, ToastType? toastType}) {
    _toastTypeControl(toastType);
    BotToast.showCustomNotification(
        align: kIsWeb ? Alignment.bottomRight : null,
        toastBuilder: (_) => Padding(
              padding: getIt<AppRouter>()
                  .root
                  .navigatorKey
                  .currentContext!
                  .paddingMediumHorizontal,
              child: SizedBox(
                width: kIsWeb ? 350 : null,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: getIt<AppRouter>()
                        .root
                        .navigatorKey
                        .currentContext!
                        .borderRadiusLow,
                  ),
                  color: _color,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _leftBorderContainer,
                        const SizedBox(width: 10),
                        _iconWidget,
                        const SizedBox(width: 5),
                        Expanded(
                          child: Padding(
                            padding: getIt<AppRouter>()
                                .root
                                .navigatorKey
                                .currentContext!
                                .paddingLow,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _headerText,
                                _subText(label),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        duration:
            getIt<AppRouter>().root.navigatorKey.currentContext!.highDuration);
  }

  void _toastTypeControl(ToastType? toastType) {
    switch (toastType ?? ToastType.success) {
      case ToastType.success:
        _svgPath = SvgPath.svgCheckPath;
        _toastTitle = ProjectItems.success;
        _color = ColorConstants.toastSuccessGreenColor;
        _leftBorderColor = ColorConstants.toastSuccessGreenLeftBorderColor;
        break;
      case ToastType.error:
        _svgPath = SvgPath.svgDeniedPath;
        _toastTitle = ProjectItems.error;
        _color = ColorConstants.toastErrorRedColor;
        _leftBorderColor = ColorConstants.toastErrorRedLeftBorderColor;
        break;
      case ToastType.info:
        _svgPath = SvgPath.svgInfoPath;
        _toastTitle = ProjectItems.info;
        _color = ColorConstants.toastInfoBlueColor;
        _leftBorderColor = ColorConstants.toastInfoBlueLeftBorderColor;
        break;
      case ToastType.warning:
        _svgPath = SvgPath.svgWarningPath;
        _toastTitle = ProjectItems.warning;
        _color = ColorConstants.toastWarningOrangeColor;
        _leftBorderColor = ColorConstants.toastWarningOrangeLeftBorderColor;
        break;
    }
  }

  Widget get _iconWidget => SizedBox(
        height: ProjectVaribles.normalValue,
        width: ProjectVaribles.normalValue,
        child: SvgWidget(
          svgPath: _svgPath ?? SvgPath.svgCheckPath,
          size: ProjectVaribles.normalValue,
        ),
      );

  Widget _subText(label) => Text(
        label,
        overflow: TextOverflow.clip,
        style: getIt<AppRouter>()
            .root
            .navigatorKey
            .currentContext!
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.w500),
      );

  Widget get _headerText => Text(
        '${_toastTitle!.toUpperCase()}!',
        style: getIt<AppRouter>()
            .root
            .navigatorKey
            .currentContext!
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.bold),
      );

  Widget get _leftBorderContainer => Container(
        decoration: BoxDecoration(
          borderRadius: getIt<AppRouter>()
              .root
              .navigatorKey
              .currentContext!
              .borderRadiusLeftLow,
          color: _leftBorderColor,
        ),
        height: double.infinity,
        width: 10,
      );

  waitForScreen(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callback.call();
    });
  }
}

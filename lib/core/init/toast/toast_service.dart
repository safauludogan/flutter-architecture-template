import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/widgets/svg_widget.dart';
import 'package:flutter_architecture_template/core/constants/border_radius.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:flutter_architecture_template/core/constants/duration_constant.dart';
import 'package:flutter_architecture_template/core/constants/padding_items.dart';
import 'package:flutter_architecture_template/core/constants/project_items.dart';
import 'package:flutter_architecture_template/core/constants/project_variables.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';
import 'package:flutter_architecture_template/main.dart';
import 'package:flutter_architecture_template/product/navigator/app_router.dart';
enum ToastService {
  success,
  error,
  info,
  warning;

  const ToastService();
}

final context = getIt<AppRouter>().root.navigatorKey.currentContext!;

extension ToastServiceExtension on ToastService {
  void show({
    required String text,
  }) {
    switch (this) {
      case ToastService.success:
        _showToast(
          SvgPath.checked
              .toWidget(context: context, size: ProjectVaribles.toastIconHW),
          text,
          ProjectItems.success,
          ColorConstants.toastSuccessGreenColor,
          ColorConstants.toastSuccessGreenLeftBorderColor,
        );
        break;
      case ToastService.error:
        _showToast(
          SvgPath.denied
              .toWidget(context: context, size: ProjectVaribles.toastIconHW),
          text,
          ProjectItems.error,
          ColorConstants.toastErrorRedColor,
          ColorConstants.toastErrorRedLeftBorderColor,
        );
        break;
      case ToastService.info:
        _showToast(
          SvgPath.info
              .toWidget(context: context, size: ProjectVaribles.toastIconHW),
          text,
          ProjectItems.info,
          ColorConstants.toastInfoBlueColor,
          ColorConstants.toastInfoBlueLeftBorderColor,
        );
        break;
      case ToastService.warning:
        _showToast(
          SvgPath.warning
              .toWidget(context: context, size: ProjectVaribles.toastIconHW),
          text,
          ProjectItems.warning,
          ColorConstants.toastWarningOrangeColor,
          ColorConstants.toastWarningOrangeLeftBorderColor,
        );
        break;
    }
  }
}

void _showToast(
  Widget icon,
  String text,
  String title,
  Color color,
  Color borderColor,
) {
  BotToast.showCustomNotification(
    toastBuilder: (_) => Padding(
      padding: PaddingItems.paddingHorizontalVeryHigh,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusItem.lowCircular(),
        ),
        color: color,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _leftBorderContainer(borderColor),
              const SizedBox(width: 10),
              icon,
              const SizedBox(width: 5),
              Expanded(
                child: Padding(
                  padding: PaddingItems.paddingAllLow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headerText(title),
                      _subText(text),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    duration: DurationConstant.toastDuration(),
  );
}

Widget _subText(String text) => Text(
      text,
      overflow: TextOverflow.clip,
      style: context.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
    );

Widget _headerText(String title) => Text(
      '${title.toUpperCase()}!',
      style: context.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
    );

Widget _leftBorderContainer(Color borderColor) => Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadiusItem.leftLowCircular(),
        color: borderColor,
      ),
      height: double.infinity,
      width: 10,
    );

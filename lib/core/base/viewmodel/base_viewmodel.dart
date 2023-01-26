import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/product/manager/vexana_manager.dart';

abstract class BaseViewModel {
  late BuildContext baseContext;
  VexanaManager? vexanaManager = VexanaManager.instance;
  VexanaManager get vexanaManagerComputed => VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;

  void setContext(BuildContext context);
  void init();
  void disp();
}

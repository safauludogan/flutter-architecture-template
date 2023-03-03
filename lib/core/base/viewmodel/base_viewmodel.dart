import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/product/manager/vexana_manager.dart';
import 'package:vexana/vexana.dart';

abstract class BaseViewModel {
  late BuildContext baseContext;
  INetworkManager vexanaManager = VexanaManager.instance.networkManager;
  INetworkManager get vexanaManagerComputed => vexanaManager;
  LocaleManager localeManager = LocaleManager.instance;
  TickerProvider? tickerProvider;

  void setContext(BuildContext context);
  void init();
  void disp() {}
}

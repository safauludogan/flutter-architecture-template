import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/product/manager/network/network_manager.dart';

mixin BaseViewModel {
  late BuildContext baseContext;
  IDioNexusManager networkManager = NetworkManager.instance.networkManager;
  IDioNexusManager get networkManagerComputed => networkManager;
  LocaleManager localeManager = LocaleManager.instance;
  TickerProvider? tickerProvider;

  void setContext(BuildContext context);
  void init();
  void disp();
}

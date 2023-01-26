import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/base/viewmodel/base_viewmodel.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:flutter_architecture_template/features/home/page1/page1_view.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../page2/page2_view.dart';
part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => baseContext = context;
  @override
  void init() {}
  @override
  void disp() {}

  List<Widget> screens = [
    const Page1View(),
    const Page2View(),
  ];
  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: 'Sayfa1',
      inactiveColorSecondary: ColorConstants.blackColor,
      inactiveColorPrimary: ColorConstants.primaryColor,
      activeColorSecondary: ColorConstants.whiteColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.pages),
      title: 'Sayfa2',
      inactiveColorSecondary: ColorConstants.blackColor,
      inactiveColorPrimary: ColorConstants.primaryColor,
      activeColorSecondary: ColorConstants.whiteColor,
    ),
  ];
}

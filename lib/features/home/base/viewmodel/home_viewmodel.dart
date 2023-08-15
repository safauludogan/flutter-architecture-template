import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/base/viewmodel/base_viewmodel.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';
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
  void init() {
    buildItems();
    controller = PersistentTabController(initialIndex: 0);
    controller.addListener(() {
      changePage(controller.index);
    });
  }

  @override
  void disp() {
    controller.dispose();
  }

  late PersistentTabController controller;

  void changePage(int value) {
    pageIndex = value;
  }

  @observable
  int pageIndex = 0;
  late final List<PersistentBottomNavBarItem> items;

  void buildItems() {
    items = [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: titles[0],
          textStyle: baseContext.textTheme.labelMedium,
          inactiveColorSecondary: Colors.grey,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white,
          activeColorPrimary: ColorConstants.primaryColor),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.pages),
          title: titles[1],
          textStyle: baseContext.textTheme.labelMedium,
          inactiveColorSecondary: Colors.grey,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white,
          activeColorPrimary: ColorConstants.primaryColor),
    ];
  }

  List<Widget> screens = [
    const Page1View(),
    const Page2View(),
  ];
  List<String> titles = [
    'Home',
    'Second Page',
  ];
}

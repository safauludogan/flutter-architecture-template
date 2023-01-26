import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PersistentTabBarView extends StatelessWidget {
  PersistentTabBarView({
    super.key,
    required this.screens,
    required this.items,
    this.controller,
    this.confineInSafeArea,
    this.backgroundColor = Colors.white,
    this.handleAndroidBackButtonPress,
    this.resizeToAvoidBottomInset,
    this.stateManagement,
    this.hideNavigationBarWhenKeyboardShows,
    this.popAllScreensOnTapOfSelectedTab,
    this.decoration,
    this.popActionScreens,
    this.itemAnimationProperties,
    this.screenTransitionAnimation,
    this.navBarStyle,
  });
  List<Widget> screens;
  List<PersistentBottomNavBarItem> items;
  PersistentTabController? controller;
  bool? confineInSafeArea;
  Color backgroundColor;
  bool? handleAndroidBackButtonPress;
  bool? resizeToAvoidBottomInset;
  bool? stateManagement;
  bool? hideNavigationBarWhenKeyboardShows;
  NavBarDecoration? decoration;
  bool? popAllScreensOnTapOfSelectedTab;
  PopActionScreensType? popActionScreens;
  ItemAnimationProperties? itemAnimationProperties;
  ScreenTransitionAnimation? screenTransitionAnimation;
  NavBarStyle? navBarStyle;
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: items,
      confineInSafeArea: confineInSafeArea ?? true,
      backgroundColor: backgroundColor,
      handleAndroidBackButtonPress: handleAndroidBackButtonPress ?? true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      stateManagement: stateManagement ?? true,
      hideNavigationBarWhenKeyboardShows:
          hideNavigationBarWhenKeyboardShows ?? true,
      decoration: decoration ?? navBarDecoration,
      popAllScreensOnTapOfSelectedTab: popAllScreensOnTapOfSelectedTab ?? true,
      popActionScreens: popActionScreens ?? PopActionScreensType.all,
      itemAnimationProperties:
          itemAnimationProperties ?? _itemAnimationProperties(context),
      screenTransitionAnimation:
          screenTransitionAnimation ?? _screenTransitionAnimation(context),
      navBarStyle: navBarStyle ?? NavBarStyle.style7,
    );
  }

  ScreenTransitionAnimation _screenTransitionAnimation(BuildContext context) =>
      ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.linear,
        duration: context.lowDuration,
      );
  ItemAnimationProperties _itemAnimationProperties(BuildContext context) =>
      ItemAnimationProperties(
        duration: context.lowDuration,
        curve: Curves.ease,
      );
}

NavBarDecoration get navBarDecoration => const NavBarDecoration(
      //borderRadius: BorderRadiusItem.mediumCircular(),
      //colorBehindNavBar: Colors.white,
      border: Border(top: BorderSide(color: Colors.grey, width: 1)),
    );

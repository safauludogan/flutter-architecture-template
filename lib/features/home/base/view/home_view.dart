import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/base/view/base_view.dart';
import 'package:flutter_architecture_template/core/constants/colors.dart';
import 'package:flutter_architecture_template/features/home/base/viewmodel/home_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: viewModel,
      onDispose: viewModel.disp,
      onModelReady: (model) {
        viewModel = model;
        model
          ..setContext(context)
          ..init();
      },
      onPageBuilder: (context, value) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Observer(
          builder: (context) =>
              Center(child: viewModel.screens[viewModel.pageIndex]),
        ),
        bottomNavigationBar: _bottomNavBar,
      ),
    );
  }

  Widget get _bottomNavBar => Observer(
        builder: (context) => BottomNavigationBar(
          //type:BottomNavigationBarType.fixed ,
          elevation: 10,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: viewModel.pageIndex,
          selectedItemColor: ColorConstants.bottomNavSelectedItemColor,
          unselectedItemColor: ColorConstants.bottomNavUnselectedItemColor,
          items: viewModel.items,
          onTap: (value) => viewModel.changePage = value,
        ),
      );
}

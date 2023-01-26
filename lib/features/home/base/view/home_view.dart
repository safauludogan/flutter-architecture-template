import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/base/view/base_view.dart';

import '../../../../core/components/widgets/persistent_tabbar_view.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: viewModel,
      onDispose: viewModel.disp,
      onModelReady: (model) {
        viewModel = model;
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, value) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: _bottomNavBar,
      ),
    );
  }

  Widget get _bottomNavBar => PersistentTabBarView(
        items: viewModel.items,
        screens:viewModel.screens,
      );
}

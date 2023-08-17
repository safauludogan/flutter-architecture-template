import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/view/no_network_widget.dart';
import 'package:flutter_architecture_template/core/init/utils/mixins/wait_for_screen.dart';
import 'package:flutter_architecture_template/core/init/utils/network/network_change_manager.dart';

abstract class NoNetworkViewModel extends State<NoNetworkWidget>
    with StateMixin {
  late final INetworkChangeManager networkChangeManager;
  NetworkResult? networkResult;
  @override
  void initState() {
    networkChangeManager = NetworkChangeManager();

    waitForScreen(() {
      networkChangeManager.handleNetworkChange(updateUI);
      checkConnectivityFirstTime();
    });

    super.initState();
  }

  @override
  void dispose() {
    networkChangeManager.dispose();
    super.dispose();
  }

  Future<void> checkConnectivityFirstTime() async {
    updateUI(await networkChangeManager.checkConnectivityFirstTime());
  }

  void updateUI(NetworkResult result) {
    setState(() {
      networkResult = result;
    });
  }
}

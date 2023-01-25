import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/utils/network/network_change_manager.dart';
import '../../../init/utils/mixins/wait_for_screen.dart';
import '../../view/no_network_widget.dart';

abstract class NoNetworkViewModel extends State<NoNetworkWidget>
    with StateMixin {
  late final INetworkChangeManager networkChangeManager;
  NetworkResult? networkResult;
  @override
  void initState() {
    networkChangeManager = NetworkChangeManager();

    waitForScreen(() {
      networkChangeManager.handleNetworkChange((result) {
        updateUI(result);
      });
      checkConnectivityFirstTime();
    });

    super.initState();
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

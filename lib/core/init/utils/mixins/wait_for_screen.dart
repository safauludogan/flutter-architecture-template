import 'package:flutter/material.dart';

//call metot when page ready

mixin StateMixin<T extends StatefulWidget> on State<T> {
  waitForScreen(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callback.call();
    });
  }
}

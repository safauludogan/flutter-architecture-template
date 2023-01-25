import 'package:flutter/material.dart';

mixin StateMixin<T extends StatefulWidget> on State<T> {
  waitForScreen(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      callback.call();
    });
  }
}

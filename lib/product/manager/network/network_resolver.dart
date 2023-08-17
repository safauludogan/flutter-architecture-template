import 'package:dio_nexus/dio_nexus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/init/toast/toast_service.dart';

class NetworkResponseResolver<T> {
  NetworkResponseResolver(this.response);
  IResponseModel<T?>? response;
  void resolve({
    ValueSetter<T?>? getModel,
    ValueSetter<NetworkExceptions?>? getException,
  }) {
    try {
      final error = response?.errorModel;
      final model = response?.model;

      if (model != null) {
        getModel?.call(model);
        return;
      }
      if (error?.errorMessage != null &&
          (error?.errorMessage?.isNotEmpty ?? false)) {
        ToastService.error.show(text: error!.errorMessage!);
      }
      if (error?.networkException != null) {
        getException?.call(error!.networkException);
        return;
      }
    } catch (_) {
      return;
    }
  }
}

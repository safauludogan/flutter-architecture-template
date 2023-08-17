import 'package:flutter/foundation.dart';

class GlobalException {
  static Future<T?> make<T>(AsyncValueGetter<T?> onOperation) async {
    try {
      final response = await onOperation.call();
      if (response == null) {
        throw Exception('$T data is null $response');
      }
      return response;
    } catch (e) {
      //loglama yap
      return null;
    }
  }
}

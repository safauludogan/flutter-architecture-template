import 'package:flutter_architecture_template/features/authentication/login/model/login_response_model.dart';
import 'package:hive_flutter/adapters.dart';

abstract class IHiveDatabaseManager {
  Future<void> initialize();
  void register();
  void clear();
}

class HiveDatabaseManager extends IHiveDatabaseManager  {
  @override
  Future<void> initialize() async {
    await Hive.initFlutter();
    register();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
  }

  @override
  void register() {
    Hive.registerAdapter(LoginResponseModelAdapter());
  }
}

import 'package:flutter_architecture_template/product/manager/database/hive_model_mixin.dart';
import 'package:hive_flutter/adapters.dart';

part 'hive_manager_mixin.dart';

class HiveDatabaseOperation<T extends HiveModelMixin> with HiveManagerMixin<T> {
  /// The function adds or updates an item in a box using a key-value pair.
  ///
  /// Args:
  ///   model (T): The `model` parameter is an object of type `T` that represents the item to be added
  /// or updated. It should have a property called `key` that uniquely identifies the item.
  Future<void> addOrUpdateItem(T model) => _box!.put(model.key, model);

  /// The function `getItem` retrieves an item from a box using a specified key and returns it, or
  /// returns null if the item does not exist.
  ///
  /// Args:
  ///   key (String): A string representing the key of the item to retrieve from the box.
  T? getItem(String key) => _box!.get(key);

  /// The function `deleteItem` deletes an item from a box using a given key.
  ///
  /// Args:
  ///   key (String): The key parameter is a string that represents the unique identifier of the item
  /// that you want to delete from the box.
  Future<void> deleteItem(String key) => _box!.delete(key);
}

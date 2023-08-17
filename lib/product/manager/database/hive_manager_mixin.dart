part of 'hive_operation.dart';

mixin HiveManagerMixin<T> {
  /// The line `late Box<T> _box;` is declaring a variable `_box` of type `Box<T>`. The `late` keyword
  /// is used to indicate that the variable will be initialized later, before it is accessed. In this
  /// case, `_box` will be initialized when the `open()` function is called and the box is opened using
  /// `Hive.openBox<T>(_key)`.
   Box<T>? _box;

  /// The line `final String _key = T.toString();` is assigning the value of `T.toString()` to the
  /// variable `_key`.
  final String _key = T.toString();

  /// The "open" function is a future that does not return any value and performs an asynchronous
  /// operation.
  Future<void> open() async {
    if (_box!=null &&_box!.isOpen && _box!.isNotEmpty) return;
    _box = await Hive.openBox<T>(_key);
  }

  /// The `clear()` function clears all data stored in the `_box` object.
  Future<void> clear() => _box!.clear();
}

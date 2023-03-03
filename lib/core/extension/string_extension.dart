import '../../core/init/utils/date_format.dart';

extension StringValidatorExtension on String? {
  bool get isNullOrEmpty => this?.isEmpty ?? false;
  bool get isNotNullOrNoEmpty => this?.isNotEmpty ?? false;

  String get toDate => this != ''
      ? this is String
          ? toDateFormat(DateTime.parse(this as String))
          : DateTime.now()
      : '';
  String get toDateDatebase => this != ''
      ? this is String
          ? toDateDatabaseFormat(DateTime.parse(this as String))
          : DateTime.now()
      : '';
}

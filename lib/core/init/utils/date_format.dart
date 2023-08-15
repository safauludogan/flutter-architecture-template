import 'package:intl/intl.dart';

toDateFormat(DateTime? dateTime) {
  String formatDate;

  // ignore: unnecessary_null_comparison
  if (dateTime != null) {
    formatDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return formatDate;
  }
}

toDateDatabaseFormat(DateTime? dateTime) {
  String formatDate;

  // ignore: unnecessary_null_comparison
  if (dateTime != null) {
    formatDate = DateFormat('yyy-MM-dd').format(dateTime);
    return formatDate;
  }
}

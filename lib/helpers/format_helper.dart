import 'package:intl/intl.dart';

class FormatHelper {
  static String formatMoney(num value, {String pattern = "#,###.##", String currency = "đ"}) {
    final formatter = NumberFormat(pattern);
    return "${formatter.format(value)}$currency";
  }

  static String formatPattern(num value, {String pattern = "#,###.##"}) {
    final formatter = NumberFormat(pattern);
    return formatter.format(value);
  }

  static String formatDateTime(DateTime dateTime, {String pattern = "HH:mm dd/MM/yyyy"}) {
    if (dateTime == null) {
      return "";
    }
    final dateFormatter = DateFormat(pattern);
    return dateFormatter.format(dateTime);
  }
}

import 'package:intl/intl.dart';
import 'package:akaunt_app/models/time_range.dart';

class DataFormatter {
  static String getTimeStringByRange(TimeRange timeRange) {
    final now = DateTime.now();
    switch (timeRange) {
      case TimeRange.oneDay:
        final date = now.subtract(Duration(days: now.hour > 20 ? 1 : 2));
        return getDateFormatted(date);

      case TimeRange.fiveDays:
        final date = now.subtract(const Duration(days: 5));
        return getDateFormatted(date);

      case TimeRange.oneMonth:
        final date = now.subtract(const Duration(days: 30));
        return getDateFormatted(date);

      case TimeRange.oneYear:
        final date = now.subtract(const Duration(days: 365));
        return getDateFormatted(date);

      case TimeRange.twoYears:
        final date = now.subtract(const Duration(days: 730));
        return getDateFormatted(date);
    }
  }

  static getDateFormatted(DateTime date) {
    return "${date.year}-${formatDateNumber(date.month)}-${formatDateNumber(date.day)}";
  }

  static String formatDateNumber(int number) {
    if (number.toString().length == 1) return "0$number";
    return number.toString();
  }

  static String valueCurrency(dynamic currency) {
    List<String> value = <String>[];
    String val = '';
    try {
      if (currency != null) {
        final NumberFormat f = NumberFormat("#,##0.00", "es_CO");
        val = f.format(currency).toString();
        value = val.split(',');
      }
      return '\$${value[0]}';
    } catch (e) {
      return ' \$0';
    }
  }
}

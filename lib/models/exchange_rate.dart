import 'package:akaunt_app/models/result.dart';
import 'package:akaunt_app/models/time_range.dart';

class ExchangeRate {
  final TimeRange? timeRange;
  final DateTime? timeEnd;
  final DateTime? timeStart;
  final List<Result> results;

  ExchangeRate({
    this.timeRange,
    required this.results,
    this.timeStart,
    this.timeEnd,
  }) : assert(timeRange != null || (timeStart != null && timeEnd != null));
}

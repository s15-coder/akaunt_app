import 'dart:developer';

import 'package:akaunt_app/models/exchange_rate.dart';
import 'package:akaunt_app/models/result.dart';
import 'package:akaunt_app/models/time_range.dart';

class ExchangeRateState {
  final List<ExchangeRate> exchangeRatesDefaultTime;
  final ExchangeRate? customExchangeRate;
  final bool fetchingNewData;
  final TimeRange? currentTimeRange;
  final Result? selectedResult;
  const ExchangeRateState({
    this.customExchangeRate,
    this.fetchingNewData = true,
    this.currentTimeRange = TimeRange.oneDay,
    this.exchangeRatesDefaultTime = const [],
    this.selectedResult,
  });
  ExchangeRateState copyWith({
    List<ExchangeRate>? exchangeRatesDefaultTime,
    ExchangeRate? customExchangeRate,
    bool? fetchingNewData,
    TimeRange? currentTimeRange,
    Result? selectedResult,
  }) =>
      ExchangeRateState(
        customExchangeRate: customExchangeRate ?? this.customExchangeRate,
        fetchingNewData: fetchingNewData ?? this.fetchingNewData,
        currentTimeRange: currentTimeRange ?? this.currentTimeRange,
        exchangeRatesDefaultTime:
            exchangeRatesDefaultTime ?? this.exchangeRatesDefaultTime,
        selectedResult: selectedResult ?? this.selectedResult,
      );
  ExchangeRate? getCurrentExchangeRate() {
    try {
      final cachedExchangeRate = exchangeRatesDefaultTime.firstWhere(
          (exchangeRate) => exchangeRate.timeRange == currentTimeRange);
      return cachedExchangeRate;
    } catch (e) {
      return null;
    }
  }

  ExchangeRate? getCachedExchangeRate(TimeRange timeRange) {
    try {
      final cachedExchangeRate = exchangeRatesDefaultTime
          .firstWhere((exchangeRate) => exchangeRate.timeRange == timeRange);
      log('Exchange rate cached');
      return cachedExchangeRate;
    } catch (e) {
      log('No cache exchange rate');
      return null;
    }
  }
}

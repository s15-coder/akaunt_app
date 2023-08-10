import 'dart:convert';
import 'dart:developer';

import 'package:akaunt_app/models/api/exchange_rates_response.dart';
import 'package:akaunt_app/models/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:akaunt_app/helpers/data_formatter.dart';
import 'package:akaunt_app/models/exchange_rate.dart';
import 'package:akaunt_app/models/time_range.dart';
import 'package:akaunt_app/services/polygon_api.dart';
import 'package:akaunt_app/state/exchange_rate/state.dart';

class ExchangeRateController extends StateNotifier<ExchangeRateState> {
  ExchangeRateController(super.state);

  Future getExchangeRatesByTimeRange({required TimeRange range}) async {
    final cachedExchangeRate = state.getCachedExchangeRate(range);
    if (cachedExchangeRate != null) {
      state = state.copyWith(currentTimeRange: range);
      state = state.copyWith(selectedResult: cachedExchangeRate.results.first);
      return;
    }
    try {
      final dateFormat = DataFormatter.getTimeStringByRange(range);
      final nowFormat = DataFormatter.getDateFormatted(DateTime.now());
      state = state.copyWith(fetchingNewData: true, currentTimeRange: range);

      final resp = await PolygonApi.httpGet(
          'C:USDCOP/range/1/day/$dateFormat/$nowFormat?adjusted=true&sort=asc&');
      final responseBody =
          ExchangeRatesResponse.fromJson(jsonDecode(resp.body));
      final newExchangeRate = ExchangeRate(
        results: responseBody.results,
        timeRange: range,
      );
      state = state.copyWith(selectedResult: newExchangeRate.results.first);
      final defaultExchangeRates = [
        ...state.exchangeRatesDefaultTime,
        newExchangeRate
      ];
      state = state.copyWith(
        fetchingNewData: false,
        exchangeRatesDefaultTime: defaultExchangeRates,
      );
    } catch (e) {
      log("Error fetching exchange rates: $e");
    }
  }

  void selectResult(Result result) {
    state = state.copyWith(selectedResult: result);
  }
}

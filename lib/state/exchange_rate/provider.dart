import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:akaunt_app/state/exchange_rate/controller.dart';
import 'package:akaunt_app/state/exchange_rate/state.dart';

StateNotifierProvider<ExchangeRateController, ExchangeRateState>
    exchangeRateProvider =
    StateNotifierProvider<ExchangeRateController, ExchangeRateState>(
  (ref) => ExchangeRateController(
    const ExchangeRateState(),
  ),
);

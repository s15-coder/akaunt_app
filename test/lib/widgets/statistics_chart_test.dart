import 'package:akaunt_app/models/exchange_rate.dart';
import 'package:akaunt_app/models/result.dart';
import 'package:akaunt_app/models/time_range.dart';
import 'package:akaunt_app/state/exchange_rate/state.dart';
import 'package:akaunt_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../test_wrappers/app_wrapper.dart';

void main() {
  final result = Result(
    v: 200,
    vw: 201,
    open: 203,
    closed: 204,
    h: 205,
    l: 206,
    time: DateTime.now(),
    n: 207,
  );
  const timeRange = TimeRange.oneDay;
  testWidgets(
    "CircularProgressIndicator is being shown at the beginning",
    (tester) async {
      final pumpWidget = AppWrapperTest(
          child: StatisticsChart(
        exchangeRateState: ExchangeRateState(selectedResult: result),
        onResultSelected: (_) {},
      ));
      await tester.pumpWidget(pumpWidget);
      final loadingFinder = find.byType(CircularProgressIndicator);
      expect(loadingFinder, findsOneWidget);
    },
  );
  testWidgets("Chart is shown after fetch the data", (tester) async {
    final exchangeRate = ExchangeRate(
      results: [result, result],
      timeRange: timeRange,
    );
    final pumpWidget = AppWrapperTest(
      child: StatisticsChart(
        exchangeRateState: ExchangeRateState(
          customExchangeRate: exchangeRate,
        ),
        onResultSelected: (_) {},
      ),
    );
    await tester.pumpWidget(pumpWidget);

    //Loading state
    final loadingFinder = find.byType(CircularProgressIndicator);
    expect(loadingFinder, findsOneWidget);

    //Data loaded
    final chartFinder = find.byType(SfCartesianChart);
    expect(loadingFinder, findsOneWidget);

    //Should not be loading anymore
    expect(chartFinder, findsNothing);
  });
}

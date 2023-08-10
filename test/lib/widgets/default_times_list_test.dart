import 'package:akaunt_app/models/time_range.dart';
import 'package:akaunt_app/state/exchange_rate/state.dart';
import 'package:akaunt_app/ui/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_wrappers/app_wrapper.dart';

void main() {
  testWidgets("The required labels are shown", (tester) async {
    final widget = AppWrapperTest(
        child: DefaultTimesList(
      exchangeRateState: ExchangeRateState(),
      onChangeTimeRange: (_) {},
    ));
    await tester.pumpWidget(widget);
    final oneDayFinder = find.text('1 Día');
    final fiveDaysFinder = find.text('5 Días');
    final oneMonthFinder = find.text('1 Mes');
    final oneYearFinder = find.text('1 Año');
    final twoYearsFinder = find.text('2 Años');
    expect(oneDayFinder, findsOneWidget);
    expect(fiveDaysFinder, findsOneWidget);
    expect(oneMonthFinder, findsOneWidget);
    expect(oneYearFinder, findsOneWidget);
    expect(twoYearsFinder, findsOneWidget);
  });
}

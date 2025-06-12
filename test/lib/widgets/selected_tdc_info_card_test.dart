import 'package:akaunt_app/helpers/data_formatter.dart';
import 'package:akaunt_app/models/result.dart';
import 'package:akaunt_app/state/exchange_rate/state.dart';
import 'package:akaunt_app/ui/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_wrappers/app_wrapper.dart';

void main() {
  testWidgets(
    "Default info is shown right",
    (WidgetTester tester) async {
      const pumpWidget = AppWrapperTest(
          child: SelectedTdcInfoCard(
        exchangeRateState: ExchangeRateState(),
      ));
      await tester.pumpWidget(pumpWidget);

      //Find default texts
      final copTextFinder = find.text('COP');
      final equalToText = find.text('= ------');
      final defaultDateText = find.text('--- / ---- / ------');

      expect(copTextFinder, findsOneWidget);
      expect(equalToText, findsOneWidget);
      expect(defaultDateText, findsOneWidget);
    },
  );
  testWidgets(
    "Data is shown right according to it's state",
    (WidgetTester tester) async {
      //Create the bloc and mock an state

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

      final pumpWidget = AppWrapperTest(
        child: SelectedTdcInfoCard(
          exchangeRateState: ExchangeRateState(selectedResult: result),
        ),
      );
      await tester.pumpWidget(pumpWidget);

      //Find default texts
      final copTextFinder = find.text('COP');
      final equalToText = find.text('= 1 USD');

      //Format date and get the text finder
      final formattedDate = DataFormatter.getDateFormatted(result.time);
      final dateFinder = find.text(formattedDate);

      //Format currency and get the text finder
      final formattedCurrency = DataFormatter.valueCurrency(result.closed);
      final finderCurrency = find.text(formattedCurrency);

      expect(copTextFinder, findsOneWidget);
      expect(equalToText, findsOneWidget);
      expect(dateFinder, findsOneWidget);
      expect(finderCurrency, findsOneWidget);
    },
  );
}

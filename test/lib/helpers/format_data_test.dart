import 'package:akaunt_app/helpers/data_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test valueCurrency method', () {
    const valueOne = 552325;
    const valueTwo = 5523.5625;
    const valueThree = "5632653";

    final currencyOneFormatted = DataFormatter.valueCurrency(valueOne);
    const currencyOne = "\$552.325";
    expect(currencyOneFormatted, currencyOne);

    final currencyTwoFormatted = DataFormatter.valueCurrency(valueTwo);
    const currencyTwo = "\$5.523";
    expect(currencyTwoFormatted, currencyTwo);

    final currencyThreeFormatted = DataFormatter.valueCurrency(valueThree);
    const currencyThree = " \$0";
    expect(currencyThreeFormatted, currencyThree);
  });

  test('Test formatDateNumber method', () {
    const singleNumber = 1;
    final formattedSingleNumber = DataFormatter.formatDateNumber(singleNumber);
    expect(formattedSingleNumber, "01");
    const dobleNumber = 25;
    final formattedDoubleNumber = DataFormatter.formatDateNumber(dobleNumber);
    expect(formattedDoubleNumber, "25");
  });
  test('Test getFormattedDate method', () {
    final firstDate = DateTime(2022, 08, 3);
    final formattedFirstDate = DataFormatter.getDateFormatted(firstDate);
    expect(formattedFirstDate, "2022-08-03");

    final secondDate = DateTime(2018, 7, 24);
    final formattedSecondDate = DataFormatter.getDateFormatted(secondDate);
    expect(formattedSecondDate, "2018-07-24");
  });
}

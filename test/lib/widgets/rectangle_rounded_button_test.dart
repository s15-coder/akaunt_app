import 'package:akaunt_app/ui/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_wrappers/app_wrapper.dart';

void main() {
  testWidgets('The label passed is shown right', (tester) async {
    const label = "COP";
    const pumpWidget = AppWrapperTest(
        child: RectangleRoundedButton(
      label: label,
    ));
    await tester.pumpWidget(pumpWidget);
    final finder = find.text('COP');
    expect(finder, findsOneWidget);
  });
}

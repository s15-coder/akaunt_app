import 'package:akaunt_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_wrappers/app_wrapper.dart';

void main() {
  testWidgets("The given widget is reflected as child", (tester) async {
    final widgetInstance = Container();
    final pumpWidget = AppWrapperTest(
      child: CustomCircleAvatar(
        child: widgetInstance,
      ),
    );
    await tester.pumpWidget(pumpWidget);
    final widgetFinder = find.byWidget(widgetInstance);
    expect(widgetFinder, findsOneWidget);
  });
}

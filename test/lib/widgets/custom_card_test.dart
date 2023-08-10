import 'package:akaunt_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("The given widget is reflected as child", (tester) async {
    final widgetInstance = Container();
    await tester.pumpWidget(CustomCard(child: widgetInstance));
    final widgetFinder = find.byWidget(widgetInstance);
    expect(widgetFinder, findsOneWidget);
  });
}

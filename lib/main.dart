import 'package:akaunt_app/state/theme/provider.dart';
import 'package:akaunt_app/theme/dark/dark_theme.dart';
import 'package:akaunt_app/theme/light/light_theme.dart';
import 'package:akaunt_app/ui/pages/pages.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:akaunt_app/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Akaunt App',
      routes: Router.routes,
      initialRoute: HomePage.routeName,
      themeMode: state,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}

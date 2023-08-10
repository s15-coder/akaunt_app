import 'package:flutter/material.dart';
import 'media_query_wrapper.dart';

class AppWrapperTest extends StatelessWidget {
  const AppWrapperTest({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MediaQueryWrapper(
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MediaQueryWrapper extends StatelessWidget {
  const MediaQueryWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(
        size: Size(500, 1200),
      ),
      child: child,
    );
  }
}

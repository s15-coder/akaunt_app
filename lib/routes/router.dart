import 'package:akaunt_app/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class Router {
  static Map<String, Widget Function(BuildContext)> get routes => {
        HomePage.routeName: (_) => const HomePage(),
        ProfilePage.routeName: (_) => const ProfilePage(),
      };
}

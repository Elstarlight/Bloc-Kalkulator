import 'package:flutter/material.dart';
import 'pages.dart';

class AppRoutes {
  static const initial = AppPages.kalkulator;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = AppPages.pages[settings.name];

    if (route != null) {
      return MaterialPageRoute(
        builder: route,
        settings: settings,
      );
    }

    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('Page not found')),
      ),
    );
  }
}

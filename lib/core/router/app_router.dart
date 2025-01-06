
import 'package:flutter/material.dart';

import '../../features/home_screen/presentation/pages/home_screen.dart';

class AppRouter {

  Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint("generateRoute(): ${settings.name}");

    switch (settings.name) {

      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
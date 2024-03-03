import 'package:flutter/material.dart';
import 'package:yes_no_generator/features/yes_no_generator/presentation/views/splash_view.dart';
import 'package:yes_no_generator/features/yes_no_generator/presentation/views/yes_no_view.dart';

class AppRoutes {
  static const String splashView = '/';
  static const String yesNoView = '/YesNoView';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case AppRoutes.yesNoView:
        return MaterialPageRoute(
          builder: (context) => const YesNoView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text('Undefined route'),
          ),
        );
    }
  }
}

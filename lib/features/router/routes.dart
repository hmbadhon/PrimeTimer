import 'package:flutter/material.dart';
import 'package:prime_timer/core/constants/app_strings.dart';
import 'package:prime_timer/features/screens/home/view/home_screen.dart';
import 'package:prime_timer/features/screens/home/view/notify_screen.dart';

import '../screens/splash/view/splash_screen.dart';

class Routes {
  static const String splash = "/";
  static const String home = "/home";
  static const String notify = "/notify";
}

class RouteGenerator {
  static final Map<String, WidgetBuilder> _routeBuilders = {
    Routes.splash: (_) => SplashScreen(),
    Routes.home: (_) => HomeScreen(),
    Routes.notify: (_) => NotifyScreen(),
  };

  static Route<dynamic> getRoute(RouteSettings settings) {
    WidgetBuilder? builder = _routeBuilders[settings.name];
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return unDefinedRoute();
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.noPageFound)),
        body: const Center(child: Text(AppStrings.noPageFound)),
      ),
    );
  }
}

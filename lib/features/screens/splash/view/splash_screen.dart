import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prime_timer/core/constants/app_size.dart';
import 'package:prime_timer/generated/assets.dart';

import '../../../router/routes.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _navigation);
  }

  void _navigation() =>
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: Image.asset(
            Assets.imagesAppIconDark,
            width: AppCommonSize.s100,
            height: AppCommonSize.s100,
          ),
        ),
      ),
    );
  }
}

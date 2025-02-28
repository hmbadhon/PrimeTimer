import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:prime_timer/core/constants/app_size.dart';
import 'package:prime_timer/features/router/routes.dart';
import 'package:prime_timer/features/screens/home/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initLocale();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _initLocale() async {
    await initializeDateFormatting('de_DE', null);
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      bool result = await context.read<HomeCubit>().getRandomNumber();
      if (result) {
        Navigator.pushReplacementNamed(context, Routes.notify);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 1)),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('HH:mm').format(DateTime.now()),
                    style: kHeadLine35,
                  ),
                  6.verticalSpace,
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: DateFormat("E d. MMM ", 'de_DE')
                                .format(DateTime.now()),
                            style: kRegularLine18),
                        TextSpan(
                            text:
                                "KW ${DateFormat('w', 'de_DE').format(DateTime.now())}",
                            style: kSmallLine12),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

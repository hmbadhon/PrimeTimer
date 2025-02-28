import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prime_timer/core/constants/app_colors.dart';
import 'package:prime_timer/core/constants/app_size.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Congrats!",
                  style: kHeadLine35,
                ),
                15.verticalSpace,
                Text("You obtained a prime number, it was: <X>",
                    style: kRegularLine18.copyWith(fontWeight: boldFont)),
                12.verticalSpace,
                Text(
                  "Time since last prime number <YY>",
                  style: kRegularLine15.copyWith(
                      color: AppColors.kDarkGrayColor3, fontWeight: boldFont),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

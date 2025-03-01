import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prime_timer/core/app/app_dependency.dart';
import 'package:prime_timer/core/app/app_preference.dart';
import 'package:prime_timer/core/constants/app_colors.dart';
import 'package:prime_timer/core/constants/app_size.dart';
import 'package:prime_timer/features/components/default_btn.dart';
import 'package:prime_timer/features/router/routes.dart';

class NotifyScreen extends StatelessWidget {
  final AppPreferences _appPreferences;
  NotifyScreen({super.key}) : _appPreferences = instance.get();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.kBlackColor3,
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 8.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                      color: AppColors.kSuccessColor2,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "Congrats!",
                  style: kHeadLine35,
                ),
                15.verticalSpace,
                Text(
                    "You obtained a prime number, it was: ${_appPreferences.getPrimeData().data?.last.primeNumber}",
                    style: kRegularLine18.copyWith(fontWeight: boldFont)),
                12.verticalSpace,
                if (_appPreferences.getPrimeData().data != null &&
                    _appPreferences.getPrimeData().data!.length > 1) ...[
                  Text(
                    "Time since last prime number: ${_appPreferences.getPrimeData().data!.last.dateTime?.difference(_appPreferences.getPrimeData().data![_appPreferences.getPrimeData().data!.length - 2].dateTime!).inSeconds} seconds",
                    style: kRegularLine15.copyWith(
                      color: AppColors.kDarkGrayColor3,
                      fontWeight: boldFont,
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: .25.sw,
                      child: DefaultBtn(
                        title: "Close",
                        btnColor: AppColors.kSuccessColor2,
                        textColor: AppColors.kBlackColor,
                        onPress: () => Navigator.pushNamedAndRemoveUntil(
                            context, Routes.home, ModalRoute.withName('/')),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

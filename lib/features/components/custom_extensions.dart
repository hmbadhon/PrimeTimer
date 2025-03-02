import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SizedBoxExtension on double {
  kWidthSizedBox() {
    return SizedBox(
      width: this,
    );
  }

  kHeightSizedBox() {
    return SizedBox(
      height: this,
    );
  }
}

extension DateTimeExtension on DateTime {
  int get isoWeekNumber {
    int dayOfYear = int.parse(DateFormat("D", "de_DE").format(this));
    int weekNumber = ((dayOfYear - weekday + 10) / 7).floor();
    return weekNumber;
  }

  String get timeFormat24hrs {
    return DateFormat('HH:mm').format(this);
  }

  String get dayDateWeekFormatDE {
    return DateFormat("E d. MMM ", 'de_DE').format(this);
  }
}

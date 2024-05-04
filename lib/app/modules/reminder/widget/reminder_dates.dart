import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:mahati_mobile/app/utils/resources.dart';

Widget reminderDates() {
  return EasyDateTimeLine(
    initialDate: DateTime.now(),
    onDateChange: (selectedDate) {
      print(selectedDate.toString());
    },
    activeColor: Resources.color.primaryColor,
    headerProps: const EasyHeaderProps(
      dateFormatter: DateFormatter.monthOnly(),
    ),
    dayProps: const EasyDayProps(
      height: 56.0,
      width: 56.0,
      dayStructure: DayStructure.dayNumDayStr,
      inactiveDayStyle: DayStyle(
        borderRadius: 48.0,
        dayNumStyle: TextStyle(
          fontSize: 18.0,
        ),
      ),
      activeDayStyle: DayStyle(
        dayNumStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

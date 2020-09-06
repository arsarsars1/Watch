import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'file:///C:/Users/arsar/FlutterProject/watch/lib/Calendar/calendarAdd.dart';
import 'package:watch/main.dart';

class TableCalendarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'en_US',
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.none,
      //disable swipe between days
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      calendarStyle: CalendarStyle(
        weekdayStyle: TextStyle(color: Colors.black),
        weekendStyle: TextStyle(color: Colors.black),
        outsideStyle: TextStyle(color: Colors.white),
        unavailableStyle: TextStyle(color: Colors.white),
        outsideWeekendStyle: TextStyle(color: Colors.white),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextBuilder: (date, locale) {
          return DateFormat.E(locale).format(date).substring(0, 2);
        },
        weekdayStyle: TextStyle(color: Colors.black),
        weekendStyle: TextStyle(color: Colors.black),
      ),
      headerVisible: false,
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CalendarAdd(delete: true,),
                ),
              );
            },
            child: Container(
              decoration: new BoxDecoration(
                color: HexColor('5DB131'),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    50.0,
                  ),
                ),
              ),
              margin: const EdgeInsets.all(
                4.0,
              ),
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

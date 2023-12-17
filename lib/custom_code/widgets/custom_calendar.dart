// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
    this.width,
    this.height,
    required this.occupiedDates,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<DateTime> occupiedDates;

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  List<DateTime> _getEventsForDay(DateTime day) {
    return widget.occupiedDates
        .where((element) => DateUtils.isSameDay(day, element))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'fr_FR',
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      focusedDay: DateTime.now(),
      firstDay: DateTime.now().subtract(const Duration(days: 365)),
      lastDay: DateTime.now().add(const Duration(days: 365)),
      eventLoader: _getEventsForDay,
      onDaySelected: _onDaySelected,
      calendarStyle: CalendarStyle(
          markerSize: 20,
          markerDecoration: BoxDecoration(
            color: Color.fromARGB(255, 221, 106, 106),
            shape: BoxShape.circle,
          )),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    FFAppState().update(() {
      FFAppState().selectedDate = selectedDay;
    });
  }
}

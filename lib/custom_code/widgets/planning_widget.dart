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

import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

DateTime kFirstDay = DateTime(1970, 1, 1);
DateTime kLastDay = DateTime(2100, 1, 1);

extension DateTimeExtension on DateTime {
  DateTime get startOfDay => DateTime(year, month, day);

  DateTime get endOfDay => DateTime(year, month, day, 23, 59);
}

class PlanningWidget extends StatefulWidget {
  const PlanningWidget(
      {Key? key,
      required this.color,
      this.weekFormat = false,
      this.weekStartsMonday = false,
      this.width,
      this.height,
      this.initialDate,
      this.twoRowHeader = false,
      this.iconColor,
      this.rowHeight,
      required this.occupiedDates})
      : super(key: key);

  final bool weekFormat;
  final bool weekStartsMonday;
  final Color color;
  final double? width;
  final double? height;
  final bool twoRowHeader;
  final DateTime? initialDate;
  final Color? iconColor;
  final double? rowHeight;
  final List<OccupancyStruct> occupiedDates;

  @override
  State<StatefulWidget> createState() => _PlanningWidgetState();
}

class _PlanningWidgetState extends State<PlanningWidget> {
  late DateTime focusedDay;
  late DateTime selectedDay;
  late DateTimeRange selectedRange;
  List<PlanningItemStruct> planningItems = [];

  @override
  void initState() {
    super.initState();
    focusedDay = widget.initialDate ?? DateTime.now();
    selectedDay = widget.initialDate ?? DateTime.now();
    selectedRange = DateTimeRange(
      start: selectedDay.startOfDay,
      end: selectedDay.endOfDay,
    );
    SchedulerBinding.instance
        .addPostFrameCallback((_) => setSelectedDay(selectedRange.start));
  }

  @override
  void didUpdateWidget(PlanningWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      planningItems = getPlanningItems(widget.occupiedDates);
    });
  }

  CalendarFormat get calendarFormat =>
      widget.weekFormat ? CalendarFormat.week : CalendarFormat.month;

  StartingDayOfWeek get startingDayOfWeek => widget.weekStartsMonday
      ? StartingDayOfWeek.monday
      : StartingDayOfWeek.sunday;

  Color get color => widget.color;

  Color get lightColor => widget.color.withOpacity(0.85);

  Color get lighterColor => widget.color.withOpacity(0.60);

  void setSelectedDay(
    DateTime? newSelectedDay, [
    DateTime? newSelectedEnd,
  ]) {
    final newRange = newSelectedDay == null
        ? null
        : DateTimeRange(
            start: newSelectedDay.startOfDay,
            end: newSelectedEnd ?? newSelectedDay.endOfDay,
          );
    setState(() {
      selectedDay = newSelectedDay ?? selectedDay;
      selectedRange = newRange ?? selectedRange;
    });

    FFAppState().update(() {
      FFAppState().selectedDate = newSelectedDay;
    });
  }

  List<PlanningItemStruct> getPlanningItems(
      List<OccupancyStruct> occupancyList) {
    List<PlanningItemStruct> occupiedDates = [];

    for (OccupancyStruct occupancy in occupancyList) {
      for (DateTime date = occupancy.startDate!;
          date.isBefore(occupancy.endDate!.add(Duration(days: 1)));
          date = date.add(Duration(days: 1))) {
        occupiedDates.add(PlanningItemStruct(date: date, occupancy: occupancy));
      }
    }

    return occupiedDates;
  }

  List<DateTime> _getEventsForDay(DateTime day) {
    return planningItems
        .where((element) => DateUtils.isSameDay(day, element.date))
        .map((e) => e.date!)
        .toList();
  }

  Color _getMarkerColor(DateTime date, int index) {
    List<Color> markerColors = planningItems
        .where((element) => DateUtils.isSameDay(element.date, date))
        .map((e) => e.occupancy.isFriend ? Colors.blue : Colors.red)
        .toList();

    return markerColors[index];
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CalendarHeader(
            focusedDay: focusedDay,
            onLeftChevronTap: () => setState(
              () => focusedDay = widget.weekFormat
                  ? _previousWeek(focusedDay)
                  : _previousMonth(focusedDay),
            ),
            onRightChevronTap: () => setState(
              () => focusedDay = widget.weekFormat
                  ? _nextWeek(focusedDay)
                  : _nextMonth(focusedDay),
            ),
            onTodayButtonTap: () => setState(() => focusedDay = DateTime.now()),
            //titleStyle: widget.titleStyle,
            iconColor: widget.iconColor,
            locale: 'fr_FR',
            twoRowHeader: widget.twoRowHeader,
          ),
          TableCalendar(
            calendarBuilders: CalendarBuilders(
              markerBuilder: (BuildContext context, date, events) {
                if (events.isEmpty) return SizedBox();

                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.all(1),
                        child: Container(
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _getMarkerColor(date, index)),
                        ),
                      );
                    });
              },
            ),
            eventLoader: _getEventsForDay,
            focusedDay: focusedDay,
            selectedDayPredicate: (date) => isSameDay(selectedDay, date),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            calendarFormat: calendarFormat,
            headerVisible: false,
            sixWeekMonthsEnforced: true,
            locale: 'fr_FR',
            rowHeight: widget.rowHeight ?? 64.0,
            calendarStyle: CalendarStyle(
              markerSize: 20,
              markerDecoration: BoxDecoration(
                color: Color.fromARGB(255, 106, 152, 221),
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: lighterColor,
                shape: BoxShape.circle,
              ),
              markersMaxCount: 3,
              canMarkersOverflow: true,
            ),
            availableGestures: AvailableGestures.horizontalSwipe,
            startingDayOfWeek: startingDayOfWeek,
            onPageChanged: (focused) {
              if (focusedDay.startOfDay != focused.startOfDay) {
                setState(() => focusedDay = focused);
              }
            },
            onDaySelected: (newSelectedDay, focused) {
              if (!isSameDay(selectedDay, newSelectedDay)) {
                setSelectedDay(newSelectedDay);
                if (focusedDay.startOfDay != focused.startOfDay) {
                  setState(() => focusedDay = focused);
                }
              }
            },
          ),
        ],
      );
}

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onTodayButtonTap,
    this.iconColor,
    this.titleStyle,
    this.locale,
    this.twoRowHeader = false,
  }) : super(key: key);

  final DateTime focusedDay;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onTodayButtonTap;
  final Color? iconColor;
  final TextStyle? titleStyle;
  final String? locale;
  final bool twoRowHeader;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(),
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: twoRowHeader ? _buildTwoRowHeader() : _buildOneRowHeader(),
      );

  Widget _buildTwoRowHeader() => Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(width: 16),
              _buildDateWidget(),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: _buildCustomIconButtons(),
          ),
        ],
      );

  Widget _buildOneRowHeader() => Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(width: 16),
          _buildDateWidget(),
          ..._buildCustomIconButtons(),
        ],
      );

  Widget _buildDateWidget() => Expanded(
        child: Text(
          DateFormat.yMMMM(locale).format(focusedDay),
          style: const TextStyle(fontSize: 17).merge(titleStyle),
        ),
      );

  List<Widget> _buildCustomIconButtons() => <Widget>[
        CustomIconButton(
          icon: Icon(Icons.chevron_left, color: iconColor),
          onTap: onLeftChevronTap,
        ),
        CustomIconButton(
          icon: Icon(Icons.chevron_right, color: iconColor),
          onTap: onRightChevronTap,
        ),
      ];
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    this.padding = const EdgeInsets.all(10),
  }) : super(key: key);

  final Icon icon;
  final VoidCallback onTap;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: padding,
            child: Icon(
              icon.icon,
              color: icon.color,
              size: icon.size,
            ),
          ),
        ),
      );
}

DateTime _previousWeek(DateTime week) {
  return week.subtract(const Duration(days: 7));
}

DateTime _nextWeek(DateTime week) {
  return week.add(const Duration(days: 7));
}

DateTime _previousMonth(DateTime month) {
  if (month.month == 1) {
    return DateTime(month.year - 1, 12);
  } else {
    return DateTime(month.year, month.month - 1);
  }
}

DateTime _nextMonth(DateTime month) {
  if (month.month == 12) {
    return DateTime(month.year + 1, 1);
  } else {
    return DateTime(month.year, month.month + 1);
  }
}

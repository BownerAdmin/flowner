import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<DateTime> addNewRangeToProperty(
  DateTimeRange newRange,
  List<DateTime> actualDateTimeList,
) {
  final List<DateTime> updatedDateTimeList = List.from(actualDateTimeList);

  DateTime currentDate = newRange.start;
  while (currentDate.isBefore(newRange.end)) {
    if (!updatedDateTimeList.contains(currentDate)) {
      updatedDateTimeList.add(currentDate);
    }
    currentDate = currentDate.add(Duration(days: 1));
  }
  updatedDateTimeList.add(newRange.end);

  updatedDateTimeList.sort();
  return updatedDateTimeList;
}

OccupancyStruct createNewOccupancy(DateTimeRange datesRange) {
  return OccupancyStruct(
      startDate: datesRange.start, endDate: datesRange.end, isFriend: false);
}

List<DateTime> getOccupiedDates(List<OccupancyStruct> occupancyList) {
  List<DateTime> occupiedDates = [];

  for (OccupancyStruct occupancy in occupancyList) {
    for (DateTime date = occupancy.startDate!.add(Duration(days: 1));
        date.isBefore(occupancy.endDate!);
        date = date.add(Duration(days: 1))) {
      occupiedDates.add(date);
    }
  }

  return occupiedDates;
}

List<OccupancyStruct> getOccupanciesFromDate(
  DateTime selectedDate,
  List<OccupancyStruct> occupancies,
) {
  List<OccupancyStruct> filteredOccupancies = [];

  for (OccupancyStruct occupancy in occupancies) {
    if ((selectedDate.isAfter(occupancy.startDate!) ||
            selectedDate.isAtSameMomentAs(occupancy.startDate!)) &&
        (selectedDate.isBefore(occupancy.endDate!.add(Duration(days: 1))) ||
            selectedDate
                .isAtSameMomentAs(occupancy.endDate!.add(Duration(days: 1))))) {
      filteredOccupancies.add(occupancy);
    }
  }

  return filteredOccupancies;
}

List<OccupancyStruct> modifyOccupancyList(
  List<OccupancyStruct> currentList,
  OccupancyStruct oldOccupancy,
  OccupancyStruct newOccupancy,
) {
  // In the currentList, I want to replace the oldOccupancy by the newOccupancy
  final index = currentList.indexOf(oldOccupancy);
  currentList[index] = newOccupancy;
  return currentList;
}

String? generateToken() {
  // generate a random string to use it as a token
  final random = math.Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final token =
      List.generate(32, (index) => chars[random.nextInt(chars.length)]).join();
  return token;
}

String hiddenPassword(String password) {
  int length = password.length;
  return '*' * length;
}

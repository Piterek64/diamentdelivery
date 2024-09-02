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
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

int? numerzamowienia() {
  int randomNum = math.Random().nextInt(1000000000);
  return randomNum;
}

DateTime? dodajMinutyDoDaty(
  DateTime? datadodania,
  int? minuty,
) {
  if (datadodania == null || minuty == null) {
    return null; // Return null if any of the parameters are null
  }
  return datadodania.add(Duration(minutes: minuty));
}

DateTime getFirstOfMonth() {
  // returns the first of the month
  return DateTime(DateTime.now().year, DateTime.now().month, 1);
}

int? roznicaminuty(
  DateTime? date1,
  DateTime? date2,
) {
  // variables: date1, date2. Subtract date2 date1 and give minutes as integer
  if (date1 == null || date2 == null) {
    return null; // Return null if any of the parameters are null
  }
  int differenceInMinutes = date2.difference(date1).inMinutes;
  return differenceInMinutes;
}

DateTime? add15secondtocurrenttime(DateTime? dateresult) {
  // Add 15 second to current time and return dateresult
  if (dateresult == null) {
    return null; // Return null if the parameter is null
  }
  return dateresult.add(Duration(seconds: 15));
}

bool? comparedates(
  DateTime? date1,
  DateTime? date2,
) {
  // Compare 2 dates. If date1 > date2 return true
  if (date1 == null || date2 == null) {
    return null; // Return null if any of the parameters are null
  }
  return date1.isAfter(date2);
}

DateTime? addoneday(DateTime? date) {
  // add one day to date
  if (date == null) return null;
  return date.add(Duration(days: 1));
}

String? imagetourl(String? photo) {
  // Convert image path to string URL
  if (photo == null) {
    return null;
  }
  final bytes = base64.decode(photo);
  final url = 'data:image/png;base64,$bytes';
  return url;
}

String? covertimagepathintostring(String? image) {
  // Convert image path into string

  return image;
}

double? divide(
  int? first,
  int? second,
) {
  // divide second argument by first argument and return double type number. Turn this number to percentage integer, then divide that number by 100
  if (first == null || second == null || second == 0) {
    return null;
  }
  double result = first / second;
  return result;
}

int? byonehundred(double? number) {
  // round the number to two decimal places, multiply by 100 and return integer
  if (number == null) return null;
  double rounded = double.parse(number.toStringAsFixed(2));
  int multiplied = (rounded * 100).toInt();
  return multiplied;
}

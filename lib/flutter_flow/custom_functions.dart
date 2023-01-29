import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String idGenerator(int randomNumber) {
  // Add your function code here!
  final now = DateTime.now();
  double result = now.microsecondsSinceEpoch / randomNumber;
  return result.round().toString();
}

double averageRating(List<double>? ratingAmount) {
  // Add your function code here!
  double roundDouble(double value, int places) {
    double mod = (10.0 * 10.0);
    return ((value * mod).round().toDouble() / mod);
  }

  if (ratingAmount == null || ratingAmount.isEmpty) {
    return 0;
  }
  double average = ratingAmount.reduce((x, y) => x + y) / ratingAmount.length;
  return roundDouble(average, 2);
}

double adminReviewPercent(
  int countOcenok,
  int allReview,
) {
  return (countOcenok / allReview) * 100;
}

String oborotForCarPrecent(List<BookingsRecord> bookingRecord) {
  double sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i].forCarPay!;
  }
  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return sum.toString().substring(0, sum.toString().length - 6);
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    return sum.toString().substring(0, sum.toString().length - 3);
  } else if (sum.toString().length > 9 && sum.toString().length < 13) {
    return sum.toString().substring(0, sum.toString().length - 9);
  } else {
    return "0";
  }
}

String averageChequeName(List<BookingsRecord> bookingRecord) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }
  sum = sum ~/ bookingRecord.length;

  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return " млн. ₸";
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    return " тыс. ₸";
  } else if (sum.toString().length > 9 && sum.toString().length < 13) {
    return " млрд. ₸";
  } else {
    return " ₸";
  }
}

String averageChequeForCompanyName(
  List<BookingsRecord> bookingRecord,
  int companyCount,
) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }

  sum = sum ~/ companyCount;
  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return " млн. ₸";
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    return " тыс. ₸";
  } else if (sum.toString().length > 9 && sum.toString().length < 13) {
    return " млрд. ₸";
  } else {
    return " ₸";
  }
}

String averageChequeForCompany(
  List<BookingsRecord> bookingRecord,
  int companyCount,
) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }

  sum = sum ~/ companyCount;

  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return sum.toString().substring(0, sum.toString().length - 6);
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    return sum.toString().substring(0, sum.toString().length - 3);
  } else if (sum.toString().length > 9 && sum.toString().length < 13) {
    return sum.toString().substring(0, sum.toString().length - 9);
  } else {
    return "0";
  }
}

double? returnDistanceBetweenTwoPoints(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // uncomment the line below if you want the result to be rounded
  // double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return result;
}

bool showSearchResult2(
  String textSearchFor,
  String textSearchIn,
) {
  // Add your function code here!
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

double price(List<DocumentReference> refs) {
  // Add your function code here!
  int length = refs.length;
  double sum = 0;
  for (int i = 0; i < length; i++) {
    var reference = refs.elementAt(i);
    //double pricee = reference<company_services>;
    //sum = sum + reference.price;
  }
  return sum;
}

int priceMinus(
  double? localPrice,
  double? docPrice,
) {
  if (localPrice == null || docPrice == null) {
    return 0;
  } else {
    return (localPrice - docPrice).toInt();
  }
}

int pricePlus(
  double? localPrice,
  double? docPrice,
) {
  if (localPrice == null || docPrice == null) {
    return 0;
  } else {
    return (localPrice + docPrice).toInt();
  }
}

String phoneNum(String pho) {
  List<String> phone = List<String>.generate(pho.length, (index) => pho[index]);
  int j = 0;
  String res = '';

  for (int i = 0; i < phone.length; i++) {
    if (i == 1) {
      res = res + phone[i];
      res = res + "(";
    } else if (i == 4) {
      res = res + phone[i];
      res = res + ")";
    } else if (i == 7) {
      res = res + phone[i];
      res = res + " ";
    } else if (i == 9) {
      res = res + phone[i];
      res = res + " ";
    } else {
      res = res + phone[i];
    }
  }
  return res;
}

int? returnDistanceBetweenTwoPointsCopy(
  LatLng? positionOne,
  LatLng? positionTwo,
) {
  // calculate the distance between two points on a spheroid and return distance as double
  var p = 0.017453292519943295;
  var a = 0.5 -
      math.cos((positionTwo!.latitude - positionOne!.latitude) * p) / 2 +
      math.cos(positionOne.latitude * p) *
          math.cos(positionTwo.latitude * p) *
          (1 - math.cos((positionTwo.longitude - positionOne.longitude) * p)) /
          2;
  double result = 12742 * math.asin(math.sqrt(a));
  // result.toInt().toString();
  // uncomment the line below if you want the result to be rounded
  // double finalResult = result.roundToDouble();
  // if you uncommented the line above, you have to replace result in the line below with finalResult
  return result.toInt();
}

int indexIncrement(int index) {
  // Add your function code here!
  int ans = index + 1;
  return ans;
}

DateTime notifyTime(
  DateTime bookingDate,
  int bookingTime,
  int minusTime,
) {
  String bookDateM = bookingDate.month.toString();
  String bookTime = (bookingTime - minusTime).toString();
  if (bookingTime < 10) {
    bookTime = "0$bookTime";
  }
  if (bookingDate.month < 10) {
    bookDateM = "0$bookDateM";
  }
  String bookDateD = bookingDate.day.toString();
  if (bookingDate.day < 10) {
    bookDateD = "0$bookDateD";
  }

  String date = "${bookingDate.year}-$bookDateM-$bookDateD $bookTime:00:00";

  DateTime res = DateTime.parse(date);

  return res;
  // Add your function code here!
}

bool comparisonTime(
  DateTime currentTime,
  int timeOrder,
  DateTime bookDate,
) {
  int currDate = currentTime.day.toInt();
  int bDate = bookDate.day.toInt();
  int time = currentTime.hour.toInt();

  if (bDate == currDate) {
    if (time >= timeOrder)
      return false;
    else
      return true;
  }

  return true;
  // Add your function code here!
}

String averageCheque(List<BookingsRecord> bookingRecord) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }
  if (bookingRecord.length == 0) {
    return "0";
  }
  sum = sum ~/ bookingRecord.length;
  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return sum.toString().substring(0, sum.toString().length - 6);
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    return sum.toString().substring(0, sum.toString().length - 3);
  } else if (sum.toString().length > 9 && sum.toString().length < 13) {
    return sum.toString().substring(0, sum.toString().length - 9);
  } else {
    return "0";
  }
}

String oborotName(List<BookingsRecord> bookingRecord) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }

  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return " млн. ₸";
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    return " тыс. ₸";
  } else if (sum.toString().length > 9 && sum.toString().length < 13) {
    return " млрд. ₸";
  } else {
    return " ₸";
  }
}

String oborotForCarPrecentName(List<BookingsRecord> bookingRecord) {
  double sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i].forCarPay!;
  }
  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return "млн. ₸";
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    return "тыс. ₸";
  } else if (sum.toString().length > 9 && sum.toString().length < 13) {
    return "млрд. ₸";
  } else {
    return "₸";
  }
}

bool closedOpened(
  DateTime currTime,
  int openTime,
  int closeTime,
) {
  int curr = currTime.hour.toInt();

  if (openTime <= curr && curr <= closeTime) {
    return true;
  } else {
    return false;
  }

  // Add your function code here!
}

int addTimeOrder(
  int? selectedTimeOrder,
  int? add,
) {
  if (selectedTimeOrder == null || add == null) {
    return 0;
  } else {
    return (selectedTimeOrder + add);
  }
}

int stringToInt(String name) {
  return int.parse(name.substring(0, name.indexOf(':')));
}

int durationToInt(String duration) {
  if (duration.length == 6 && duration.contains('мин')) {
    return int.parse(duration.substring(0, 1));
  } // для n мин

  if (duration.length == 5 && duration.contains('час')) {
    return 60;
  } // для n час

  if (duration.length == 6 && duration.contains('часа')) {
    return int.parse(duration.substring(0, 1)) * 60;
  } // для n часа

  if (duration.length == 9 && duration.contains('ч')) {
    return (int.parse(duration[0]) * 60) + int.parse(duration.substring(3, 5));
  } // для n час n мин
  else {
    return 0;
  }
}

List<int> listSelectedTimesOrder(
  int duration,
  int selectedTimeOrder,
) {
  List<int> test = [];
  if (duration <= 60) {
    test.add(selectedTimeOrder);
    return test;
  }
  if (duration > 60 && duration <= 120) {
    test.add(selectedTimeOrder);
    test.add(selectedTimeOrder + 1);
    return test;
  }
  if (duration > 120 && duration <= 180) {
    test.add(selectedTimeOrder);
    test.add(selectedTimeOrder + 1);
    return test;
  }
  if (duration > 180 && duration <= 240) {
    test.add(selectedTimeOrder);
    test.add(selectedTimeOrder + 1);
    return test;
  } else {
    test.add(selectedTimeOrder);
    return test;
  }
}

List<String> boxesName(int boxCount) {
  List<String> test = [];
  for (int i = 0; i < boxCount; i++) {
    test.add("Бокс №${i + 1}");
  }
  return test;
}

String listStringToString(
  List<String> listString,
  int countSymbol,
) {
  String answer = "";

  for (int i = 0; i < listString.length; i++) {
    if (answer.length >= countSymbol) {
      answer = answer.substring(0, countSymbol) + "...";
      break;
    } else if (i == listString.length - 1) {
      answer += listString[i];
    } else
      answer += listString[i] + ", ";
  }

  return answer;
}

int oborot(List<BookingsRecord> bookingRecord) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }

  int a = sum.toString().length - 1;

  int div = 1;
  for (int i = 0; i < a; i++) {
    div *= 10;
  }

  return sum ~/ div;

  // if (sum.toString().length > 6 && sum.toString().length < 10) {
  //   return sum.toString().substring(0, sum.toString().length - 6);
  // } else if (sum.toString().length > 3 && sum.toString().length < 7) {
  //   return sum.toString().substring(0, sum.toString().length - 3);
  // } else if (sum.toString().length > 9 && sum.toString().length < 13) {
  //   return sum.toString().substring(0, sum.toString().length - 9);
  // } else {
  //   return "0";
  // }
}

double adminReviewPercentCount(
  int countOcenok,
  int allReview,
) {
  return countOcenok / allReview;
}

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

String idGenerator(int randomNumber) {
  // Add your function code here!
  final now = DateTime.now();
  double result = now.microsecondsSinceEpoch / randomNumber;
  return result.round().toString();
  //
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
  int? countOcenok,
  int? allReview,
) {
  if (countOcenok == null || allReview == null) {
    return 0;
  } else {
    return (countOcenok / allReview) * 100;
  }
}

String oborotForCarPrecent(List<BookingsRecord> bookingRecord) {
  double sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i].forCarPay!;
  }

  int three = 0;
  int a = sum.toString().length - 1;
  int div = 1;
  if (a >= 3) {
    three = a ~/ 3;
  }
  if (three != 0) {
    for (int i = 0; i < three * 3; i++) {
      div *= 10;
    }

    return (sum / div).toStringAsFixed(1);
  }

  if (a >= 1 && a <= 2) {
    return sum.toStringAsFixed(1);
  }

  for (int i = 0; i < a; i++) {
    div *= 10;
  }

  double aa = sum / div;

  return aa.toStringAsFixed(1);
}

String averageChequeName(List<BookingsRecord> bookingRecord) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }
  sum = sum ~/ bookingRecord.length;
  String oborotString = sum.toString();

  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return " млн. ₸";
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    String firstOborot = oborotString.substring(0, oborotString.length - 3);

    /// 1 тыс т
    if (firstOborot.length == 1 || firstOborot.length == 2) {
      return " ₸";
    } else {
      return " тыс. ₸";
    }
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
  String oborotString = sum.toString();
  if (sum.toString().length > 6 && sum.toString().length < 10) {
    return " млн. ₸";
  } else if (sum.toString().length > 3 && sum.toString().length < 7) {
    String firstOborot = oborotString.substring(0, oborotString.length - 3);

    /// 1 тыс т
    if (firstOborot.length == 1) {
      return "";
    } else {
      return " тыс. ₸";
    }
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
  double sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }
  int three = 0;
  int a = sum.toString().length - 1;
  int div = 1;
  if (a >= 3) {
    three = a ~/ 3;
  }
  if (three != 0) {
    for (int i = 0; i < three * 3; i++) {
      div *= 10;
    }

    return (sum / div).toStringAsFixed(1);
  }

  if (a >= 1 && a <= 2) {
    return sum.toString();
  }

  for (int i = 0; i < a; i++) {
    div *= 10;
  }

  //FFAppState().excOborot = sum ~/ div;

  //FFAppState().excOborot = sum ~/ div;

  return (sum / div).toStringAsFixed(1);
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
  String oborotString = sum.toString();

  /// млн т

  if (oborotString.length > 6 && oborotString.length < 10) {
    String firstOborot = oborotString.substring(0, oborotString.length - 6);

    /// 1 млн т
    if (firstOborot.length == 1) {
      return oborotString.substring(0, 1) + "." + oborotString.substring(1, 2);

      /// 10 млн т
    } else if (firstOborot.length == 2) {
      return oborotString.substring(0, 2) + "." + oborotString.substring(2, 3);

      /// 100 млн т
    } else if (firstOborot.length == 3) {
      return oborotString.substring(0, 3) + "." + oborotString.substring(3, 4);
    } else {
      return "0";
    }

    /// тыс т
  }
  if (oborotString.length > 3 && oborotString.length < 7) {
    String firstOborot = oborotString.substring(0, oborotString.length - 3);

    /// 1 тыс т
    if (firstOborot.length == 1) {
      return oborotString;

      /// 10 тыс т
    } else if (firstOborot.length == 2) {
      return oborotString;

      /// 100 тыс т
    } else if (firstOborot.length == 3) {
      return oborotString.substring(0, 3) + "." + oborotString.substring(3, 4);
    } else {
      return "0";
    }

    /// млрд т
  }
  if (oborotString.length > 9 && oborotString.length < 13) {
    String firstOborot = oborotString.substring(0, oborotString.length - 9);

    /// 1 млрд т
    if (firstOborot.length == 1) {
      return oborotString.substring(0, 1) + "." + oborotString.substring(1, 2);

      /// 10 млн т
    } else if (firstOborot.length == 2) {
      return oborotString.substring(0, 2) + "." + oborotString.substring(2, 3);

      /// 100 млн т
    } else if (firstOborot.length == 3) {
      return oborotString.substring(0, 3) + "." + oborotString.substring(3, 4);
    } else {
      return "0";
    }
  } else {
    return "0";
  }
}

List<String> generateIntListString(int count) {
  List<String> result = [];
  for (int i = 1; i <= count; i++) {
    result
        .add(i.toString()); // Преобразовать число в строку и добавить в список
  }
  return result;
}

String oborotName(List<BookingsRecord> bookingRecord) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }

  if (sum.toString().length > 0 && sum.toString().length <= 3) {
    return " ₸";
  }
  if (sum.toString().length > 3 && sum.toString().length <= 6) {
    return " тыс. ₸";
  } else if (sum.toString().length > 6 && sum.toString().length < 10) {
    return " млн. ₸";
  } else if (sum.toString().length >= 10 && sum.toString().length <= 12) {
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
  String oborotString = sum.toString();
  if (oborotString.length <= 3) {
    return " ₸";
  } else if (sum.toString().length > 6 && sum.toString().length < 10) {
    return "млн. ₸";
  } else if (sum.toString().length > 3 && sum.toString().length <= 6) {
    return "тыс. ₸";
  } else if (sum.toString().length >= 10 && sum.toString().length < 13) {
    return "млрд. ₸";
  } else {
    return " ₸";
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
    return int.parse(duration.substring(0, 2));
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
  int three = 0;
  int a = sum.toString().length - 1;
  int div = 1;
  if (a >= 3) {
    three = a ~/ 3;
  }
  if (three != 0) {
    for (int i = 0; i < three * 3; i++) {
      div *= 10;
    }

    return sum ~/ div;
  }

  if (a >= 1 && a <= 2) {
    return sum;
  }

  for (int i = 0; i < a; i++) {
    div *= 10;
  }

  //FFAppState().excOborot = sum ~/ div;

  //FFAppState().excOborot = sum ~/ div;

  double aa = sum / div;

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
  int? countOcenok,
  int? allReview,
) {
  if (countOcenok == null || allReview == null) {
    return 0;
  } else {
    return countOcenok / allReview;
  }
}

DateTime? futureDate(
  DateTime? startDate,
  int? minutes,
  int? seconds,
  int? hours,
  int? days,
) {
  // create a new variable for the result
  DateTime result;

  // set initial value from startDate input parameter.
  //If startDate is null then use current Timestamp as StartDate
  result = startDate ?? (DateTime.now());

  // null saftey checks for all input parameters
  int addMinutes = 0 + (minutes ?? 0);
  int addSeconds = 0 + (seconds ?? 0);
  int addHours = 0 + (hours ?? 0);
  int addDays = 0 + (days ?? 0);

//calculate future date by adding all input durations to the StartDate stored in result variable

  result = result.add(Duration(
      seconds: addSeconds,
      minutes: addMinutes,
      hours: addHours,
      days: addDays));

//return final result with the future date

  return result;
}

double focarProcent(
  double procent,
  int price,
) {
  return price * (procent / 100.0);
}

int daySum(String day) {
  return int.parse(day.substring(0, day.indexOf('/')));
}

int price100(int price) {
  return (price / 100).toInt();
}

String test(String erksh) {
  /* 1  1
  2  10
  3  100
  4  1 000
  5  11 000  
  6  111 0000
  7  1 100 000
  8  11 100 000
  9  111 100 000
  10 1 100 000 000
  11 11 100 000 000
  12 111 100 000 000 */

  if (erksh.length >= 1 && erksh.length <= 3) {
    return erksh;
  }
  if (erksh.length > 3 && erksh.length < 7) {
    String erksh2 = erksh.substring(0, erksh.length - 3);
    if (erksh2.length == 2) {
      return erksh.substring(0, 2) + "," + erksh.substring(2, 3) + " тыс. ₸";
    } else if (erksh2.length == 3) {
      return erksh.substring(0, 3) + "," + erksh.substring(3, 4) + " тыс. ₸";
    } else {
      return erksh.substring(0, 1) + "," + erksh.substring(1, 2) + " тыс. ₸";
    }
  } else if (erksh.length > 6 && erksh.length < 10) {
    String erksh2 = erksh.substring(0, erksh.length - 6);
    if (erksh2.length == 2) {
      return erksh.substring(0, 2) + "," + erksh.substring(2, 3) + " млн. ₸";
    } else if (erksh2.length == 3) {
      return erksh.substring(0, 3) + "," + erksh.substring(3, 4) + " млн. ₸";
    } else {
      return erksh.substring(0, 1) + "," + erksh.substring(1, 2) + " млн. ₸";
    }
  } else {
    return "wawa";
  }
}

String oborotString(List<BookingsRecord> bookingRecord) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }
  int three = 0;
  int a = sum.toString().length - 1;
  int div = 1;
  if (a >= 3) {
    three = a ~/ 3;
  }
  if (three != 0) {
    for (int i = 0; i < three * 3; i++) {
      div *= 10;
    }

    return (sum / div).toStringAsFixed(1);
  }

  if (a >= 1 && a <= 2) {
    return sum.toStringAsFixed(1);
  }

  for (int i = 0; i < a; i++) {
    div *= 10;
  }

  //FFAppState().excOborot = sum ~/ div;

  //FFAppState().excOborot = sum ~/ div;

  double aa = sum / div;

  return aa.toStringAsFixed(1);
}

String dohodNaGost(List<BookingsRecord> bookingRecord) {
  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }
  int three = 0;
  int a = sum.toString().length - 1;
  int div = 1;
  if (a >= 3) {
    three = a ~/ 3;
  }
  if (three != 0) {
    for (int i = 0; i < three * 3; i++) {
      div *= 10;
    }

    return ((sum / div) / bookingRecord.length).toStringAsFixed(1);
  }

  if (a >= 1 && a <= 2) {
    return (sum / bookingRecord.length).toStringAsFixed(1);
  }

  for (int i = 0; i < a; i++) {
    div *= 10;
  }

  return ((sum / div) / bookingRecord.length).toStringAsFixed(1);
}

String dohodNaGostName(List<BookingsRecord> bookingRecord) {
  int a = 0;

  int sum = 0;
  for (int i = 0; i < bookingRecord.length; i++) {
    sum = sum + bookingRecord[i]!.totalPrice!;
  }
  sum = sum ~/ bookingRecord.length;

  if (sum.toString().length > 0 && sum.toString().length <= 3) {
    return " ₸";
  }
  if (sum.toString().length > 3 && sum.toString().length <= 6) {
    return " тыс. ₸";
  } else if (sum.toString().length > 6 && sum.toString().length < 10) {
    return " млн. ₸";
  } else if (sum.toString().length >= 10 && sum.toString().length <= 12) {
    return " млрд. ₸";
  } else {
    return " ₸";
  }
}

String popularService(List<BookingsRecord> bookingRecord) {
  List<String> moikaNames = [
    "Комплексная мойка",
    "Мойка кузова",
    "Мойка салона",
    "Обстрел кузова с пеной",
    "Мойка днища",
    "Нано мойка",
    "Полировка салона",
    "Полировка панели",
    "Мойка поликов",
    "Очернение шин",
    "Мойка колес (за ед.)",
    "Мойка дисков (за ед.)",
    "Гидро-полиер кузова",
    "Бесконтактная мойка",
    "Мойка двигателя",
    "Мойка багажника",
    "Полировка кузова",
    "Полная химчистка салона",
    "Химчистка салона (пол)",
    "Химчистка салона (потолок)",
    "Химчистка салона (дверь)",
    "Химчистка салона (сиденье)",
    "Химчистка салона (задние сиденья)",
    "Химчистка салона (багажник)",
    "Химчистка салона (пластик)",
    "Химчистка салона (разбор сидений)",
    "Дезинфекция салона паром",
    "Чистка детского кресла",
    "Нанесение воска"
  ];

  // for (int i = 0; i < bookingRecord.length; i++) {
  //   for (int j = 0; j < bookingRecord[i].selectedCompanyServicesName[j]; j++) {
  //     if (moikaNames[0] == bookingRecord[i].selectedCompanyServicesName[j]) {
  //       //a++;
  //     } else if (moikaNames[1] ==
  //         bookingRecord[i].selectedCompanyServicesName[j]) {
  //      // b++;
  //     } else if (moikaNames[2] ==
  //         bookingRecord[i].selectedCompanyServicesName[j]) {
  //      // c++;
  //     } else if (moikaNames[3] ==
  //         bookingRecord[i].selectedCompanyServicesName[j]) {
  //      // d++;
  //     } else if (moikaNames[4] ==
  //         bookingRecord[i].selectedCompanyServicesName[j]) {
  //      // e++;
  //     } else if (moikaNames[5] ==
  //         bookingRecord[i].selectedCompanyServicesName[j]) {
  //      // f++;
  //     } else if (moikaNames[6] ==
  //         bookingRecord[i].selectedCompanyServicesName[j]) {
  //       //g++;
  //     } else if (moikaNames[7] ==
  //         bookingRecord[i].selectedCompanyServicesName[j]) {
  //      // h++;
  //     }
  //   }
  // }

  Map<String, int> serviceCounts = {};

  // Loop through each booking record
  for (int i = 0; i < bookingRecord.length; i++) {
    List<String>? services = bookingRecord[i].selectedCompanyServicesName;

    // for (int j = 0;
    //     j < bookingRecord[i]!.selectedCompanyServicesName.length!;
    //     j++) {
    //   services.add(bookingRecord[i]!.selectedCompanyServicesName[j]!);
    // }

    // Loop through the services list for this booking record
    for (int j = 0; j < services!.length; j++) {
      String service = services[j]!;

      if (serviceCounts.containsKey(service)) {
        serviceCounts[service] = serviceCounts[service]! + 1;
      } else {
        serviceCounts[service] = 1;
      }
    }
  }

  // Find the service with the highest count
  String mostCommonService =
      serviceCounts.entries.reduce((a, b) => a.value > b.value ? a : b).key;

  return mostCommonService;
}

List<int> generateIntList(int count) {
  List<int> result = [];
  for (int i = 1; i <= count; i++) {
    result.add(i);
  }
  return result;
}

int stringToInt2(String input) {
  return int.parse(input);
}

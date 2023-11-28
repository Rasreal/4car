// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future oborotAction(List<BookingsRecord> bookingRecord) async {
  // Add your function code here!

  int b = oborot(bookingRecord);

  FFAppState().excOborot = b;
}

int oborot(List<BookingsRecord> bookingRecord) {
  /// MODIFY CODE ONLY BELOW THIS LINE

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
  /// MODIFY CODE ONLY ABOVE THIS LINE
}

import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_car/edit_car_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectCarModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  Completer<List<MyCarsRecord>>? firestoreRequestCompleter;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

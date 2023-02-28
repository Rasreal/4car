import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/components/admin_client_empty_client/admin_client_empty_client_widget.dart';
import '/components/admin_client_empty_review/admin_client_empty_review_widget.dart';
import '/components/admin_feedback_review/admin_feedback_review_widget.dart';
import '/components/super_admin_app_bar/super_admin_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SuperAdminCurrentCompanyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for super_admin_app_bar component.
  late SuperAdminAppBarModel superAdminAppBarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController6;
  final textFieldMask6 = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  Completer<List<CompanyServicesRecord>>? firestoreRequestCompleter;
  // State field(s) for TextField widget.
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    superAdminAppBarModel = createModel(context, () => SuperAdminAppBarModel());
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    superAdminAppBarModel.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    textController7?.dispose();
    textController8?.dispose();
    textController9?.dispose();
    adminAppBarInfoModel.dispose();
  }

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

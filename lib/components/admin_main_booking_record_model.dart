import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_current_booking_record/admin_current_booking_record_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminMainBookingRecordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown_admin1 widget.
  String? dropDownAdmin1Value;
  FormFieldController<String>? dropDownAdmin1Controller;
  // State field(s) for DropDown_admin2 widget.
  String? dropDownAdmin2Value;
  FormFieldController<String>? dropDownAdmin2Controller;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}

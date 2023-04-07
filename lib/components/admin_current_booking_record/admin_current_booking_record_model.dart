import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_booked_time_slot/empty_booked_time_slot_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminCurrentBookingRecordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown_admin widget.
  String? dropDownAdminValue;
  FormFieldController<String>? dropDownAdminController;
  // State field(s) for DropDown_user widget.
  String? dropDownUserValue;
  FormFieldController<String>? dropDownUserController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}

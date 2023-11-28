import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_booked_time_slot_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'admin_current_booking_record_widget.dart'
    show AdminCurrentBookingRecordWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminCurrentBookingRecordModel
    extends FlutterFlowModel<AdminCurrentBookingRecordWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for DropDown_admin widget.
  String? dropDownAdminValue;
  FormFieldController<String>? dropDownAdminValueController;
  // State field(s) for DropDown_user widget.
  String? dropDownUserValue;
  FormFieldController<String>? dropDownUserValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    expandableController1.dispose();
    expandableController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

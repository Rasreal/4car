import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admin_add_services_price_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddServicesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  Map<String?, String> dropDownValueMap = {};
  // State field(s) for new1 widget.
  TextEditingController? new1Controller;
  String? Function(BuildContext, String?)? new1ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    new1Controller?.dispose();
  }

  /// Additional helper methods are added here.

}

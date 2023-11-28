import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_add_services_price_widget.dart';
import '/components/duration_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_add_services_widget.dart' show AdminAddServicesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddServicesModel extends FlutterFlowModel<AdminAddServicesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for sedan widget.
  late ExpandableController sedanController;

  // State field(s) for new1 widget.
  FocusNode? new1FocusNode;
  TextEditingController? new1Controller;
  String? Function(BuildContext, String?)? new1ControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    sedanController.dispose();
    new1FocusNode?.dispose();
    new1Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

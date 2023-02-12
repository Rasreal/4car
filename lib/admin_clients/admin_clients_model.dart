import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admin_app_bar_widget.dart';
import '../components/admin_client_empty_client_widget.dart';
import '../components/admin_client_empty_review_widget.dart';
import '../components/admin_feedback_review_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminClientsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
  }

  void dispose() {
    textController?.dispose();
  }

  /// Additional helper methods are added here.

}

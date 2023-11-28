import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_app_bar_info_widget.dart';
import '/components/admin_app_bar_widget.dart';
import '/components/admin_client_empty_client_widget.dart';
import '/components/w_e_b_filter_date_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'admin_reports_widget.dart' show AdminReportsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminReportsModel extends FlutterFlowModel<AdminReportsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    unfocusNode.dispose();
    adminAppBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    adminAppBarInfoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

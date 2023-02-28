import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_app_bar/admin_app_bar_widget.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/components/admin_client_empty_client/admin_client_empty_client_widget.dart';
import '/components/w_e_b_filter_date/w_e_b_filter_date_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminReportsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for TextField widget.
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
    adminAppBarModel.dispose();
    textController?.dispose();
    adminAppBarInfoModel.dispose();
  }

  /// Additional helper methods are added here.

}

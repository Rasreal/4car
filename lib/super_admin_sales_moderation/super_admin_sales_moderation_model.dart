import '/backend/backend.dart';
import '/components/admin_app_bar_info_widget.dart';
import '/components/super_admin_app_bar_widget.dart';
import '/components/super_admin_sales_details_widget.dart';
import '/components/super_admin_select_city_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'super_admin_sales_moderation_widget.dart'
    show SuperAdminSalesModerationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SuperAdminSalesModerationModel
    extends FlutterFlowModel<SuperAdminSalesModerationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for super_admin_app_bar component.
  late SuperAdminAppBarModel superAdminAppBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    superAdminAppBarModel = createModel(context, () => SuperAdminAppBarModel());
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    unfocusNode.dispose();
    superAdminAppBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    adminAppBarInfoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

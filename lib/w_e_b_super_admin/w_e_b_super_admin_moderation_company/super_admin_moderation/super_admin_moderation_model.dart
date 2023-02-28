import '/backend/backend.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/components/super_admin_app_bar/super_admin_app_bar_widget.dart';
import '/components/super_admin_reject_moderation/super_admin_reject_moderation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SuperAdminModerationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for super_admin_app_bar component.
  late SuperAdminAppBarModel superAdminAppBarModel;
  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    superAdminAppBarModel = createModel(context, () => SuperAdminAppBarModel());
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    superAdminAppBarModel.dispose();
    adminAppBarInfoModel.dispose();
  }

  /// Additional helper methods are added here.

}

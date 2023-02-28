import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/components/super_admin_app_bar/super_admin_app_bar_widget.dart';
import '/components/w_e_b_filter_company_status/w_e_b_filter_company_status_widget.dart';
import '/components/w_e_b_filter_select_city/w_e_b_filter_select_city_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class SuperAdminMainModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for super_admin_app_bar component.
  late SuperAdminAppBarModel superAdminAppBarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, CompaniesRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    superAdminAppBarModel = createModel(context, () => SuperAdminAppBarModel());
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    superAdminAppBarModel.dispose();
    textController?.dispose();
    streamSubscriptions.forEach((s) => s?.cancel());
    adminAppBarInfoModel.dispose();
  }

  /// Additional helper methods are added here.

}

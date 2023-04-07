import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_app_bar/admin_app_bar_widget.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/components/admin_new_booking_record/admin_new_booking_record_widget.dart';
import '/components/admin_times/admin_times_widget.dart';
import '/components/w_e_b_filter_date/w_e_b_filter_date_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminMainModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for DropDown_user widget.
  String? dropDownUserValue;
  FormFieldController<String>? dropDownUserController;
  // Stores action output result for [Backend Call - Create Document] action in docNotExists widget.
  CompaniesRecord? addCompany;
  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    adminAppBarModel.dispose();
    adminAppBarInfoModel.dispose();
  }

  /// Additional helper methods are added here.

}

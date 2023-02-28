import '/backend/backend.dart';
import '/components/admin_add_services/admin_add_services_widget.dart';
import '/components/admin_app_bar/admin_app_bar_widget.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddCompany2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // Model for AdminAddServices component.
  late AdminAddServicesModel adminAddServicesModel1;
  // Model for AdminAddServices component.
  late AdminAddServicesModel adminAddServicesModel2;
  // Model for AdminAddServices component.
  late AdminAddServicesModel adminAddServicesModel3;
  // Model for AdminAddServices component.
  late AdminAddServicesModel adminAddServicesModel4;
  // Model for AdminAddServices component.
  late AdminAddServicesModel adminAddServicesModel5;
  // Model for AdminAddServices component.
  late AdminAddServicesModel adminAddServicesModel6;
  // Model for AdminAddServices component.
  late AdminAddServicesModel adminAddServicesModel7;
  // Model for AdminAddServices component.
  late AdminAddServicesModel adminAddServicesModel8;
  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
    adminAddServicesModel1 =
        createModel(context, () => AdminAddServicesModel());
    adminAddServicesModel2 =
        createModel(context, () => AdminAddServicesModel());
    adminAddServicesModel3 =
        createModel(context, () => AdminAddServicesModel());
    adminAddServicesModel4 =
        createModel(context, () => AdminAddServicesModel());
    adminAddServicesModel5 =
        createModel(context, () => AdminAddServicesModel());
    adminAddServicesModel6 =
        createModel(context, () => AdminAddServicesModel());
    adminAddServicesModel7 =
        createModel(context, () => AdminAddServicesModel());
    adminAddServicesModel8 =
        createModel(context, () => AdminAddServicesModel());
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    adminAppBarModel.dispose();
    adminAddServicesModel1.dispose();
    adminAddServicesModel2.dispose();
    adminAddServicesModel3.dispose();
    adminAddServicesModel4.dispose();
    adminAddServicesModel5.dispose();
    adminAddServicesModel6.dispose();
    adminAddServicesModel7.dispose();
    adminAddServicesModel8.dispose();
    adminAppBarInfoModel.dispose();
  }

  /// Additional helper methods are added here.

}

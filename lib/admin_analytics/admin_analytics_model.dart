import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admin_app_bar_widget.dart';
import '../flutter_flow/flutter_flow_charts.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class AdminAnalyticsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
  }

  void dispose() {}

  /// Additional helper methods are added here.

}

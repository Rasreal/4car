import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/car_wash_company/car_wash_company_widget.dart';
import '/components/company_card/company_card_widget.dart';
import '/components/company_top_stories_bottomsheet/company_top_stories_bottomsheet_widget.dart';
import '/components/sucsess_booking_review/sucsess_booking_review_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}

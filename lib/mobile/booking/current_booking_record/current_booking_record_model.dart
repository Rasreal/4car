import '/backend/backend.dart';
import '/components/booking_cancellation/booking_cancellation_widget.dart';
import '/components/company_card/company_card_widget.dart';
import '/components/sucsess_booking_review/sucsess_booking_review_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CurrentBookingRecordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for company_card component.
  late CompanyCardModel companyCardModel;
  // Stores action output result for [Bottom Sheet - Booking_cancellation] action in Button widget.
  bool? canceled;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    companyCardModel = createModel(context, () => CompanyCardModel());
  }

  void dispose() {
    companyCardModel.dispose();
  }

  /// Additional helper methods are added here.

}

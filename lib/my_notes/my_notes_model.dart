import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_booked_active_widget.dart';
import '/components/empty_booked_history_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'my_notes_widget.dart' show MyNotesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MyNotesModel extends FlutterFlowModel<MyNotesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for choice_history widget.

  PagingController<DocumentSnapshot?, BookingsRecord>?
      choiceHistoryPagingController;
  Query? choiceHistoryPagingQuery;
  List<StreamSubscription?> choiceHistoryStreamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    choiceHistoryStreamSubscriptions.forEach((s) => s?.cancel());
    choiceHistoryPagingController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, BookingsRecord>
      setChoiceHistoryController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    choiceHistoryPagingController ??=
        _createChoiceHistoryController(query, parent);
    if (choiceHistoryPagingQuery != query) {
      choiceHistoryPagingQuery = query;
      choiceHistoryPagingController?.refresh();
    }
    return choiceHistoryPagingController!;
  }

  PagingController<DocumentSnapshot?, BookingsRecord>
      _createChoiceHistoryController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, BookingsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryBookingsRecordPage(
          queryBuilder: (_) => choiceHistoryPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: choiceHistoryStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}

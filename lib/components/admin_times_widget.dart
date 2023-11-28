import '/backend/backend.dart';
import '/components/admin_main_booking_record_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_times_model.dart';
export 'admin_times_model.dart';

class AdminTimesWidget extends StatefulWidget {
  const AdminTimesWidget({
    Key? key,
    this.companyDoc,
    this.timeOrder,
  }) : super(key: key);

  final CompaniesRecord? companyDoc;
  final int? timeOrder;

  @override
  _AdminTimesWidgetState createState() => _AdminTimesWidgetState();
}

class _AdminTimesWidgetState extends State<AdminTimesWidget> {
  late AdminTimesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminTimesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<BookingsRecord>>(
      stream: queryBookingsRecord(
        queryBuilder: (bookingsRecord) => bookingsRecord
            .where(
              'booked_company',
              isEqualTo: widget.companyDoc?.reference,
            )
            .where(
              'selected_times_order',
              arrayContains: widget.timeOrder,
            )
            .where(
              'booked_date',
              isGreaterThanOrEqualTo: FFAppState().WEBFilterStartDate,
            )
            .where(
              'cancelled',
              isEqualTo: false,
            )
            .where(
              'booked_date',
              isLessThanOrEqualTo: FFAppState().WEBFilterEndDate,
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<BookingsRecord> containerBookingsRecordList = snapshot.data!;
        return Container(
          decoration: BoxDecoration(),
          child: Visibility(
            visible: containerBookingsRecordList.length > 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 86.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Text(
                            '${widget.timeOrder?.toString()}:00',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1.0,
                      height: 267.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).drawer,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 1134.0,
                            height: 267.0,
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<BookingsRecord>>(
                              stream: queryBookingsRecord(
                                queryBuilder: (bookingsRecord) => bookingsRecord
                                    .where(
                                      'booked_company',
                                      isEqualTo: widget.companyDoc?.reference,
                                    )
                                    .where(
                                      'selected_times_order',
                                      arrayContains: widget.timeOrder,
                                    )
                                    .where(
                                      'booked_date',
                                      isGreaterThanOrEqualTo:
                                          FFAppState().WEBFilterStartDate,
                                    )
                                    .where(
                                      'cancelled',
                                      isEqualTo: false,
                                    )
                                    .where(
                                      'booked_date',
                                      isLessThanOrEqualTo:
                                          FFAppState().WEBFilterEndDate,
                                    ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<BookingsRecord>
                                    listViewBookingsRecordList = snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listViewBookingsRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewBookingsRecord =
                                        listViewBookingsRecordList[
                                            listViewIndex];
                                    return AdminMainBookingRecordWidget(
                                      key: Key(
                                          'Keye8w_${listViewIndex}_of_${listViewBookingsRecordList.length}'),
                                      timeOrder: widget.timeOrder,
                                      bookings: listViewBookingsRecord,
                                      company: widget.companyDoc,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.00, 0.00),
                            child: Container(
                              width: 52.0,
                              height: 267.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, Color(0x00FFFFFF)],
                                  stops: [0.2, 1.0],
                                  begin: AlignmentDirectional(1.0, 0.0),
                                  end: AlignmentDirectional(-1.0, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 1.0,
                  thickness: 1.0,
                  color: Color(0xFFEDEDED),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

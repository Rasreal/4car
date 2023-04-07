import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_booked_time_slot/empty_booked_time_slot_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_current_booking_record_model.dart';
export 'admin_current_booking_record_model.dart';

class AdminCurrentBookingRecordWidget extends StatefulWidget {
  const AdminCurrentBookingRecordWidget({
    Key? key,
    this.bookingRecord,
    this.company,
  }) : super(key: key);

  final DocumentReference? bookingRecord;
  final CompaniesRecord? company;

  @override
  _AdminCurrentBookingRecordWidgetState createState() =>
      _AdminCurrentBookingRecordWidgetState();
}

class _AdminCurrentBookingRecordWidgetState
    extends State<AdminCurrentBookingRecordWidget> {
  late AdminCurrentBookingRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminCurrentBookingRecordModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 600.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
          child: StreamBuilder<BookingsRecord>(
            stream: BookingsRecord.getDocument(widget.bookingRecord!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                );
              }
              final main1BookingsRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Детали записи',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 20.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            FFIcons.kicClose,
                            color: Colors.black,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (main1BookingsRecord.createdByUser ?? true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 32.0),
                            child: FutureBuilder<UserRecord>(
                              future: UserRecord.getDocumentOnce(
                                  main1BookingsRecord.bookedUser!),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                final rowUserRecord = snapshot.data!;
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            rowUserRecord.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                          ),
                                          width: 40.0,
                                          height: 40.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            rowUserRecord.displayName!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              rowUserRecord.phoneNumber!,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray2,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        if (main1BookingsRecord.createdByAdmin ?? true)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 32.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.network(
                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        main1BookingsRecord
                                            .createdAdminUserName!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  '№Записи',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    '№${valueOrDefault<String>(
                                      main1BookingsRecord.id,
                                      'null',
                                    )}',
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).gray4,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Время',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      main1BookingsRecord.timeName,
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Container(
                                    width: 276.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Text(
                                            'Редактировать',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmallFamily),
                                                ),
                                          ),
                                          collapsed: Container(
                                            width: 1.0,
                                            height: 1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          expanded: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: FutureBuilder<
                                                List<ForcarTimesRecord>>(
                                              future:
                                                  queryForcarTimesRecordOnce(
                                                queryBuilder:
                                                    (forcarTimesRecord) =>
                                                        forcarTimesRecord
                                                            .orderBy(
                                                                'time_order'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ForcarTimesRecord>
                                                    wrapForcarTimesRecordList =
                                                    snapshot.data!;
                                                if (wrapForcarTimesRecordList
                                                    .isEmpty) {
                                                  return Center(
                                                    child:
                                                        EmptyBookedTimeSlotWidget(),
                                                  );
                                                }
                                                return Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 0.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      wrapForcarTimesRecordList
                                                          .length, (wrapIndex) {
                                                    final wrapForcarTimesRecord =
                                                        wrapForcarTimesRecordList[
                                                            wrapIndex];
                                                    return Visibility(
                                                      visible: (functions.comparisonTime(
                                                                  getCurrentTimestamp,
                                                                  wrapForcarTimesRecord
                                                                      .timeOrder!,
                                                                  FFAppState()
                                                                      .adminSelectBookingDate!) ==
                                                              true) &&
                                                          (wrapForcarTimesRecord
                                                                  .timeOrder! >=
                                                              widget.company!
                                                                  .openTimeOrder!) &&
                                                          (wrapForcarTimesRecord
                                                                  .timeOrder! <=
                                                              widget.company!
                                                                  .closedTimeOrder!),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                BookingsRecord>>(
                                                          stream:
                                                              queryBookingsRecord(
                                                            queryBuilder: (bookingsRecord) => bookingsRecord
                                                                .where(
                                                                    'time_name',
                                                                    isEqualTo: wrapForcarTimesRecord.timeName != ''
                                                                        ? wrapForcarTimesRecord
                                                                            .timeName
                                                                        : null)
                                                                .where(
                                                                    'time_order',
                                                                    isEqualTo:
                                                                        wrapForcarTimesRecord
                                                                            .timeOrder)
                                                                .where(
                                                                    'booked_date_string',
                                                                    isEqualTo: main1BookingsRecord.bookedDateString != ''
                                                                        ? main1BookingsRecord
                                                                            .bookedDateString
                                                                        : null)
                                                                .where(
                                                                    'booked_company',
                                                                    isEqualTo: widget
                                                                        .company!
                                                                        .reference)
                                                                .where(
                                                                    'cancelled',
                                                                    isEqualTo:
                                                                        false),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<BookingsRecord>
                                                                containerBookingsRecordList =
                                                                snapshot.data!;
                                                            return InkWell(
                                                              onTap: () async {
                                                                if (containerBookingsRecordList
                                                                        .length <
                                                                    widget
                                                                        .company!
                                                                        .countBox!) {
                                                                  if (FFAppState()
                                                                          .selectedTimeSlot !=
                                                                      wrapForcarTimesRecord
                                                                          .reference) {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .selectedTimeSlot =
                                                                          wrapForcarTimesRecord
                                                                              .reference;
                                                                      FFAppState()
                                                                          .selectedServices = [];
                                                                      FFAppState()
                                                                          .price = 0;
                                                                      FFAppState()
                                                                          .selectedServicesDuration = 0;
                                                                      FFAppState()
                                                                          .bookedTimes = [];
                                                                    });
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .addToBookedTimes(
                                                                              wrapForcarTimesRecord.timeOrder!);
                                                                    });

                                                                    final bookingsUpdateData =
                                                                        {
                                                                      ...createBookingsRecordData(
                                                                        timeName:
                                                                            wrapForcarTimesRecord.timeName,
                                                                        timeOrder:
                                                                            wrapForcarTimesRecord.timeOrder,
                                                                      ),
                                                                      'selected_times_order':
                                                                          FFAppState()
                                                                              .bookedTimes,
                                                                    };
                                                                    await widget
                                                                        .bookingRecord!
                                                                        .update(
                                                                            bookingsUpdateData);
                                                                  }
                                                                }
                                                              },
                                                              child: Container(
                                                                width: 67.0,
                                                                height: 32.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: () {
                                                                    if (containerBookingsRecordList
                                                                            .length >=
                                                                        widget
                                                                            .company!
                                                                            .countBox!) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground;
                                                                    } else if (FFAppState()
                                                                            .selectedTimeSlot ==
                                                                        wrapForcarTimesRecord
                                                                            .reference) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground;
                                                                    }
                                                                  }(),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: () {
                                                                      if (containerBookingsRecordList
                                                                              .length >=
                                                                          widget
                                                                              .company!
                                                                              .countBox!) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .gray3;
                                                                      } else if (FFAppState()
                                                                              .selectedTimeSlot ==
                                                                          wrapForcarTimesRecord
                                                                              .reference) {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primary;
                                                                      }
                                                                    }(),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      wrapForcarTimesRecord
                                                                          .timeName,
                                                                      '---',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              () {
                                                                            if (containerBookingsRecordList.length >=
                                                                                widget.company!.countBox!) {
                                                                              return FlutterFlowTheme.of(context).gray3;
                                                                            } else if (FFAppState().selectedTimeSlot ==
                                                                                wrapForcarTimesRecord.reference) {
                                                                              return FlutterFlowTheme.of(context).primaryBackground;
                                                                            } else {
                                                                              return FlutterFlowTheme.of(context).primary;
                                                                            }
                                                                          }(),
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).gray4,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  '№Бокса',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    main1BookingsRecord.boxName,
                                    'null',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).gray4,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Автомобиль ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      main1BookingsRecord.carBody,
                                      'null',
                                    )}, ${valueOrDefault<String>(
                                      main1BookingsRecord.carName,
                                      'null',
                                    )}',
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).gray4,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Услуги',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.listStringToString(
                                          main1BookingsRecord
                                              .selectedCompanyServicesName!
                                              .toList(),
                                          40),
                                      'Null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Container(
                                    width: 276.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: ExpandableNotifier(
                                        initialExpanded: false,
                                        child: ExpandablePanel(
                                          header: Text(
                                            'Редактировать',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmallFamily),
                                                ),
                                          ),
                                          collapsed: Container(
                                            width: 1.0,
                                            height: 1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          expanded: StreamBuilder<
                                              List<CompanyServicesRecord>>(
                                            stream: queryCompanyServicesRecord(
                                              parent: widget.company!.reference,
                                              queryBuilder:
                                                  (companyServicesRecord) =>
                                                      companyServicesRecord.where(
                                                          'car_body',
                                                          isEqualTo:
                                                              main1BookingsRecord
                                                                  .carBody),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CompanyServicesRecord>
                                                  listViewCompanyServicesRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewCompanyServicesRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewCompanyServicesRecord =
                                                      listViewCompanyServicesRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      10.0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              if (main1BookingsRecord
                                                                  .selectedCompanyServices!
                                                                  .toList()
                                                                  .contains(
                                                                      listViewCompanyServicesRecord
                                                                          .reference)) {
                                                                final bookingsUpdateData1 =
                                                                    {
                                                                  ...createBookingsRecordData(
                                                                    totalPrice: functions.priceMinus(
                                                                        main1BookingsRecord
                                                                            .totalPrice
                                                                            ?.toDouble(),
                                                                        listViewCompanyServicesRecord
                                                                            .price),
                                                                  ),
                                                                  'selected_company_services':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    listViewCompanyServicesRecord
                                                                        .reference
                                                                  ]),
                                                                  'selected_company_services_name':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    listViewCompanyServicesRecord
                                                                        .name
                                                                  ]),
                                                                };
                                                                await main1BookingsRecord
                                                                    .reference
                                                                    .update(
                                                                        bookingsUpdateData1);
                                                              } else {
                                                                final bookingsUpdateData2 =
                                                                    {
                                                                  ...createBookingsRecordData(
                                                                    totalPrice: functions.pricePlus(
                                                                        main1BookingsRecord
                                                                            .totalPrice
                                                                            ?.toDouble(),
                                                                        listViewCompanyServicesRecord
                                                                            .price),
                                                                  ),
                                                                  'selected_company_services':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    listViewCompanyServicesRecord
                                                                        .reference
                                                                  ]),
                                                                  'selected_company_services_name':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    listViewCompanyServicesRecord
                                                                        .name
                                                                  ]),
                                                                };
                                                                await main1BookingsRecord
                                                                    .reference
                                                                    .update(
                                                                        bookingsUpdateData2);
                                                              }
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (main1BookingsRecord
                                                                    .selectedCompanyServices!
                                                                    .toList()
                                                                    .contains(
                                                                        listViewCompanyServicesRecord
                                                                            .reference))
                                                                  Container(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            12.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (!main1BookingsRecord
                                                                    .selectedCompanyServices!
                                                                    .toList()
                                                                    .contains(
                                                                        listViewCompanyServicesRecord
                                                                            .reference))
                                                                  Container(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .gray1,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewCompanyServicesRecord
                                                                            .name,
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).gray4,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Стоимость',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    '${valueOrDefault<String>(
                                      main1BookingsRecord.totalPrice
                                          ?.toString(),
                                      '0',
                                    )} тг',
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (main1BookingsRecord.createdByAdmin ?? true)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (main1BookingsRecord.boxName == null ||
                                  main1BookingsRecord.boxName == '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownAdminController ??=
                                            FormFieldController<String>(null),
                                    options: widget.company!.countBoxString!
                                        .toList()
                                        .toList(),
                                    onChanged: (val) => setState(
                                        () => _model.dropDownAdminValue = val),
                                    width: 264.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    hintText: 'Бокс №1',
                                    fillColor: Colors.white,
                                    elevation: 1.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).gray2,
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                  ),
                                ),
                              if (main1BookingsRecord.boxName != null &&
                                  main1BookingsRecord.boxName != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width: 264.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color:
                                            FlutterFlowTheme.of(context).gray2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              main1BookingsRecord.boxName,
                                              'null',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              if (main1BookingsRecord.status != 'Завершено')
                                FFButtonWidget(
                                  onPressed: () async {
                                    if ((main1BookingsRecord.status ==
                                            'Забронировано') &&
                                        (_model.dropDownAdminValue != null &&
                                            _model.dropDownAdminValue != '')) {
                                      final bookingsUpdateData1 =
                                          createBookingsRecordData(
                                        status: 'Начат',
                                        boxName: _model.dropDownAdminValue,
                                      );
                                      await widget.bookingRecord!
                                          .update(bookingsUpdateData1);
                                    } else {
                                      if (main1BookingsRecord.status ==
                                          'Начат') {
                                        final bookingsUpdateData2 =
                                            createBookingsRecordData(
                                          status: 'Закончено',
                                          forCarPay: main1BookingsRecord
                                                  .totalPrice! *
                                              widget.company!.forCarPercent!,
                                        );
                                        await widget.bookingRecord!
                                            .update(bookingsUpdateData2);
                                      }
                                    }
                                  },
                                  text: valueOrDefault<String>(
                                    () {
                                      if (main1BookingsRecord.status ==
                                          'Забронировано') {
                                        return 'Начать';
                                      } else if (main1BookingsRecord.status ==
                                          'Начат') {
                                        return 'Закончить';
                                      } else if (main1BookingsRecord.status ==
                                          'Закончено') {
                                        return 'Завершено';
                                      } else {
                                        return 'null';
                                      }
                                    }(),
                                    '0',
                                  ),
                                  options: FFButtonOptions(
                                    width: 106.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: () {
                                      if (_model.dropDownAdminValue != null &&
                                          _model.dropDownAdminValue != '') {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else if (main1BookingsRecord.status ==
                                          'Начат') {
                                        return FlutterFlowTheme.of(context)
                                            .green;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .starblue;
                                      }
                                    }(),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                            ],
                          ),
                        if (main1BookingsRecord.createdByUser ?? true)
                          StreamBuilder<UserRecord>(
                            stream: UserRecord.getDocument(
                                main1BookingsRecord.bookedUser!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              final rowUserRecord = snapshot.data!;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (main1BookingsRecord.boxName == null ||
                                      main1BookingsRecord.boxName == '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownUserController ??=
                                            FormFieldController<String>(null),
                                        options: widget.company!.countBoxString!
                                            .toList()
                                            .toList(),
                                        onChanged: (val) => setState(() =>
                                            _model.dropDownUserValue = val),
                                        width: 264.0,
                                        height: 40.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        hintText: 'Бокс №1',
                                        fillColor: Colors.white,
                                        elevation: 1.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context).gray2,
                                        borderWidth: 1.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                      ),
                                    ),
                                  if (main1BookingsRecord.boxName != null &&
                                      main1BookingsRecord.boxName != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Container(
                                        width: 264.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .gray2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                valueOrDefault<String>(
                                                  main1BookingsRecord.boxName,
                                                  'null',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if ((main1BookingsRecord.status ==
                                              'Забронировано') &&
                                          (_model.dropDownUserValue != null &&
                                              _model.dropDownUserValue != '')) {
                                        final bookingsUpdateData1 =
                                            createBookingsRecordData(
                                          status: 'Начат',
                                          boxName: _model.dropDownUserValue,
                                        );
                                        await widget.bookingRecord!
                                            .update(bookingsUpdateData1);
                                      } else {
                                        if (main1BookingsRecord.status ==
                                            'Начат') {
                                          final bookingsUpdateData2 =
                                              createBookingsRecordData(
                                            status: 'Закончено',
                                            forCarPay: main1BookingsRecord
                                                    .totalPrice! *
                                                widget.company!.forCarPercent!,
                                          );
                                          await widget.bookingRecord!
                                              .update(bookingsUpdateData2);
                                          if (main1BookingsRecord
                                              .createdByUser!) {
                                            if (rowUserRecord.bookingCompanies!
                                                .toList()
                                                .contains(widget
                                                    .company!.reference)) {
                                              final userUpdateData1 =
                                                  createUserRecordData(
                                                lastBookingBoolean: true,
                                                linkLastBooking:
                                                    widget.bookingRecord,
                                              );
                                              await main1BookingsRecord
                                                  .bookedUser!
                                                  .update(userUpdateData1);
                                            } else {
                                              final userUpdateData2 = {
                                                ...createUserRecordData(
                                                  lastBookingBoolean: true,
                                                  linkLastBooking:
                                                      widget.bookingRecord,
                                                ),
                                                'bookingCompanies':
                                                    FieldValue.arrayUnion([
                                                  widget.company!.reference
                                                ]),
                                              };
                                              await main1BookingsRecord
                                                  .bookedUser!
                                                  .update(userUpdateData2);
                                            }
                                          }
                                        }
                                      }
                                    },
                                    text: () {
                                      if (main1BookingsRecord.status ==
                                          'Забронировано') {
                                        return 'Начать';
                                      } else if (main1BookingsRecord.status ==
                                          'Начат') {
                                        return 'Закончить';
                                      } else if (main1BookingsRecord.status ==
                                          'Закончено') {
                                        return 'Завершено';
                                      } else {
                                        return 'null';
                                      }
                                    }(),
                                    options: FFButtonOptions(
                                      width: 106.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: () {
                                        if (_model.dropDownUserValue != null &&
                                            _model.dropDownUserValue != '') {
                                          return FlutterFlowTheme.of(context)
                                              .primary;
                                        } else if (main1BookingsRecord.status ==
                                            'Начат') {
                                          return FlutterFlowTheme.of(context)
                                              .green;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .starblue;
                                        }
                                      }(),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

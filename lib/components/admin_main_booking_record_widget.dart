import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_current_booking_record_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_main_booking_record_model.dart';
export 'admin_main_booking_record_model.dart';

class AdminMainBookingRecordWidget extends StatefulWidget {
  const AdminMainBookingRecordWidget({
    Key? key,
    this.bookings,
    this.company,
    this.timeOrder,
  }) : super(key: key);

  final BookingsRecord? bookings;
  final CompaniesRecord? company;
  final int? timeOrder;

  @override
  _AdminMainBookingRecordWidgetState createState() =>
      _AdminMainBookingRecordWidgetState();
}

class _AdminMainBookingRecordWidgetState
    extends State<AdminMainBookingRecordWidget> {
  late AdminMainBookingRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminMainBookingRecordModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.bookings?.createdByAdmin ?? true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Color(0x00000000),
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: AdminCurrentBookingRecordWidget(
                        bookingRecord: widget.bookings?.reference,
                        company: widget.company,
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Container(
                width: 315.0,
                height: 219.0,
                decoration: BoxDecoration(
                  color: widget.bookings?.selectedTimesOrder?.first ==
                          widget.timeOrder
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).gray2,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).gray2,
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 19.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Text(
                                    'Авто',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .gray2,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Text(
                                    'Услуги',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .gray2,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Text(
                                  'Сумма',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color:
                                            FlutterFlowTheme.of(context).gray2,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Text(
                                    'Продолж.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .gray2,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Text(
                                      widget.bookings!.createdAdminUserName,
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Text(
                                      functions
                                          .listStringToString(
                                              widget.bookings!
                                                  .selectedCompanyServicesName
                                                  .toList(),
                                              20)
                                          .maybeHandleOverflow(
                                            maxChars: 20,
                                            replacement: '…',
                                          ),
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                  Text(
                                    '${widget.bookings?.totalPrice?.toString()} тг',
                                    style: FlutterFlowTheme.of(context)
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      '${widget.bookings?.timeName} - ${widget.bookings?.selectedTimesOrder?.last?.toString()}:00',
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (widget.bookings?.boxName == null ||
                              widget.bookings?.boxName == '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dropDownAdmin1ValueController ??=
                                        FormFieldController<String>(null),
                                options: widget.company!.countBoxString,
                                onChanged: (val) => setState(
                                    () => _model.dropDownAdmin1Value = val),
                                width: 128.0,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
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
                                borderColor: FlutterFlowTheme.of(context).gray2,
                                borderWidth: 1.0,
                                borderRadius: 8.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          if (widget.bookings?.boxName != null &&
                              widget.bookings?.boxName != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: 128.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).gray2,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        widget.bookings!.boxName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
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
                          if ((widget.bookings?.selectedTimesOrder?.first ==
                                  widget.timeOrder) &&
                              (widget.bookings?.status != 'Завершено'))
                            StreamBuilder<List<AnalyticsRecord>>(
                              stream: queryAnalyticsRecord(
                                parent: widget.company?.reference,
                                queryBuilder: (analyticsRecord) =>
                                    analyticsRecord.where(
                                  'dateStringDMY',
                                  isEqualTo: widget.bookings?.bookedDateString,
                                ),
                                singleRecord: true,
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
                                List<AnalyticsRecord>
                                    containerAnalyticsRecordList =
                                    snapshot.data!;
                                final containerAnalyticsRecord =
                                    containerAnalyticsRecordList.isNotEmpty
                                        ? containerAnalyticsRecordList.first
                                        : null;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (containerAnalyticsRecord != null)
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if ((widget.bookings?.status ==
                                                    'Забронировано') &&
                                                (_model.dropDownAdmin1Value !=
                                                        null &&
                                                    _model.dropDownAdmin1Value !=
                                                        '')) {
                                              await widget.bookings!.reference
                                                  .update(
                                                      createBookingsRecordData(
                                                status: 'Начат',
                                                boxName:
                                                    _model.dropDownAdmin1Value,
                                              ));
                                            } else {
                                              if (widget.bookings?.status ==
                                                  'Начат') {
                                                await widget.bookings!.reference
                                                    .update(
                                                        createBookingsRecordData(
                                                  status: 'Закончено',
                                                  forCarPay:
                                                      functions.focarProcent(
                                                          widget.company!
                                                              .forCarPercent,
                                                          widget.bookings!
                                                              .totalPrice),
                                                ));

                                                await containerAnalyticsRecord!
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'price': FieldValue
                                                          .increment(functions
                                                              .price100(widget
                                                                  .bookings!
                                                                  .totalPrice)
                                                              .toDouble()),
                                                    },
                                                  ),
                                                });
                                              }
                                            }
                                          },
                                          text: () {
                                            if (widget.bookings?.status ==
                                                'Забронировано') {
                                              return 'Начать';
                                            } else if (widget
                                                    .bookings?.status ==
                                                'Начат') {
                                              return 'Закончить';
                                            } else if (widget
                                                    .bookings?.status ==
                                                'Закончено') {
                                              return 'Завершено';
                                            } else {
                                              return 'null';
                                            }
                                          }(),
                                          options: FFButtonOptions(
                                            width: 106.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (_model.dropDownAdmin1Value !=
                                                      null &&
                                                  _model.dropDownAdmin1Value !=
                                                      '') {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if (widget
                                                      .bookings?.status ==
                                                  'Начат') {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .green;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .starblue;
                                              }
                                            }(),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                      if (!(containerAnalyticsRecord != null))
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if ((widget.bookings?.status ==
                                                    'Забронировано') &&
                                                (_model.dropDownAdmin1Value !=
                                                        null &&
                                                    _model.dropDownAdmin1Value !=
                                                        '')) {
                                              await widget.bookings!.reference
                                                  .update(
                                                      createBookingsRecordData(
                                                status: 'Начат',
                                                boxName:
                                                    _model.dropDownAdmin1Value,
                                              ));
                                            } else {
                                              if (widget.bookings?.status ==
                                                  'Начат') {
                                                await widget.bookings!.reference
                                                    .update(
                                                        createBookingsRecordData(
                                                  status: 'Закончено',
                                                  forCarPay:
                                                      functions.focarProcent(
                                                          widget.company!
                                                              .forCarPercent,
                                                          widget.bookings!
                                                              .totalPrice),
                                                ));

                                                await AnalyticsRecord.createDoc(
                                                        widget
                                                            .company!.reference)
                                                    .set(
                                                        createAnalyticsRecordData(
                                                  price: functions
                                                      .price100(widget
                                                          .bookings!.totalPrice)
                                                      .toDouble(),
                                                  dateSum: functions
                                                      .daySum(dateTimeFormat(
                                                    'd/M',
                                                    widget
                                                        .bookings!.bookedDate!,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  )),
                                                  dateStringDMY: widget.bookings
                                                      ?.bookedDateString,
                                                  date: widget
                                                      .bookings?.bookedDate,
                                                ));
                                              }
                                            }
                                          },
                                          text: () {
                                            if (widget.bookings?.status ==
                                                'Забронировано') {
                                              return 'Начать';
                                            } else if (widget
                                                    .bookings?.status ==
                                                'Начат') {
                                              return 'Закончить';
                                            } else if (widget
                                                    .bookings?.status ==
                                                'Закончено') {
                                              return 'Завершено';
                                            } else {
                                              return 'null';
                                            }
                                          }(),
                                          options: FFButtonOptions(
                                            width: 106.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: () {
                                              if (_model.dropDownAdmin1Value !=
                                                      null &&
                                                  _model.dropDownAdmin1Value !=
                                                      '') {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if (widget
                                                      .bookings?.status ==
                                                  'Начат') {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .green;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .starblue;
                                              }
                                            }(),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          showLoadingIndicator: false,
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (widget.bookings?.createdByUser ?? true)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
            child: FutureBuilder<UserRecord>(
              future: UserRecord.getDocumentOnce(widget.bookings!.bookedUser!),
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
                final containerUserRecord = snapshot.data!;
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Color(0x00000000),
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: AdminCurrentBookingRecordWidget(
                            bookingRecord: widget.bookings?.reference,
                            company: widget.company,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Container(
                    width: 315.0,
                    height: 219.0,
                    decoration: BoxDecoration(
                      color: widget.bookings?.selectedTimesOrder?.first ==
                              widget.timeOrder
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : FlutterFlowTheme.of(context).gray2,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).gray2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 24.0, 24.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 19.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Text(
                                        'Авто',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray2,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: Text(
                                        'Услуги',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray2,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Сумма',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .gray2,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 0.0),
                                      child: Text(
                                        'Продолж.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray2,
                                              fontWeight: FontWeight.normal,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          '${widget.bookings?.carBody} ${widget.bookings?.carName}',
                                          style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          functions
                                              .listStringToString(
                                                  widget.bookings!
                                                      .selectedCompanyServicesName
                                                      .toList(),
                                                  20)
                                              .maybeHandleOverflow(
                                                maxChars: 20,
                                                replacement: '…',
                                              ),
                                          style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                      Text(
                                        '${widget.bookings?.totalPrice?.toString()} тг',
                                        style: FlutterFlowTheme.of(context)
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
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: Text(
                                          '${widget.bookings?.timeName} - ${widget.bookings?.selectedTimesOrder?.last?.toString()}:00',
                                          style: FlutterFlowTheme.of(context)
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.bookings?.boxName == null ||
                                  widget.bookings?.boxName == '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownAdmin2ValueController ??=
                                            FormFieldController<String>(null),
                                    options: widget.company!.countBoxString,
                                    onChanged: (val) => setState(
                                        () => _model.dropDownAdmin2Value = val),
                                    width: 128.0,
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
                                    isMultiSelect: false,
                                  ),
                                ),
                              if (widget.bookings?.boxName != null &&
                                  widget.bookings?.boxName != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width: 128.0,
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
                                            widget.bookings!.boxName,
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
                              if ((widget.bookings?.selectedTimesOrder?.first ==
                                      widget.timeOrder) &&
                                  (widget.bookings?.status != 'Завершено'))
                                StreamBuilder<List<AnalyticsRecord>>(
                                  stream: queryAnalyticsRecord(
                                    parent: widget.company?.reference,
                                    queryBuilder: (analyticsRecord) =>
                                        analyticsRecord.where(
                                      'dateStringDMY',
                                      isEqualTo:
                                          widget.bookings?.bookedDateString,
                                    ),
                                    singleRecord: true,
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<AnalyticsRecord>
                                        containerAnalyticsRecordList =
                                        snapshot.data!;
                                    final containerAnalyticsRecord =
                                        containerAnalyticsRecordList.isNotEmpty
                                            ? containerAnalyticsRecordList.first
                                            : null;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (containerAnalyticsRecord != null)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                if ((widget.bookings?.status ==
                                                        'Забронировано') &&
                                                    (_model.dropDownAdmin2Value !=
                                                            null &&
                                                        _model.dropDownAdmin2Value !=
                                                            '')) {
                                                  await widget
                                                      .bookings!.reference
                                                      .update(
                                                          createBookingsRecordData(
                                                    status: 'Начат',
                                                    boxName: _model
                                                        .dropDownAdmin2Value,
                                                  ));
                                                } else {
                                                  if (widget.bookings?.status ==
                                                      'Начат') {
                                                    await widget
                                                        .bookings!.reference
                                                        .update(
                                                            createBookingsRecordData(
                                                      status: 'Закончено',
                                                      forCarPay: functions
                                                          .focarProcent(
                                                              widget.company!
                                                                  .forCarPercent,
                                                              widget.bookings!
                                                                  .totalPrice),
                                                    ));

                                                    await containerAnalyticsRecord!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'price': FieldValue
                                                              .increment(functions
                                                                  .price100(widget
                                                                      .bookings!
                                                                      .totalPrice)
                                                                  .toDouble()),
                                                        },
                                                      ),
                                                    });
                                                    if (widget.bookings!
                                                        .createdByUser) {
                                                      if (containerUserRecord
                                                          .bookingCompanies
                                                          .contains(widget
                                                              .company
                                                              ?.reference)) {
                                                        await widget.bookings!
                                                            .bookedUser!
                                                            .update(
                                                                createUserRecordData(
                                                          lastBookingBoolean:
                                                              true,
                                                          linkLastBooking:
                                                              widget.bookings
                                                                  ?.reference,
                                                        ));
                                                      } else {
                                                        await widget.bookings!
                                                            .bookedUser!
                                                            .update({
                                                          ...createUserRecordData(
                                                            lastBookingBoolean:
                                                                true,
                                                            linkLastBooking:
                                                                widget.bookings
                                                                    ?.reference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'bookingCompanies':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                widget.company
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    }
                                                  }
                                                }
                                              },
                                              text: () {
                                                if (widget.bookings?.status ==
                                                    'Забронировано') {
                                                  return 'Начать';
                                                } else if (widget
                                                        .bookings?.status ==
                                                    'Начат') {
                                                  return 'Закончить';
                                                } else if (widget
                                                        .bookings?.status ==
                                                    'Закончено') {
                                                  return 'Завершено';
                                                } else {
                                                  return 'null';
                                                }
                                              }(),
                                              options: FFButtonOptions(
                                                width: 106.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: () {
                                                  if (_model.dropDownAdmin2Value !=
                                                          null &&
                                                      _model.dropDownAdmin2Value !=
                                                          '') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else if (widget
                                                          .bookings?.status ==
                                                      'Начат') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .green;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .starblue;
                                                  }
                                                }(),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          if (!(containerAnalyticsRecord !=
                                              null))
                                            FFButtonWidget(
                                              onPressed: () async {
                                                if ((widget.bookings?.status ==
                                                        'Забронировано') &&
                                                    (_model.dropDownAdmin2Value !=
                                                            null &&
                                                        _model.dropDownAdmin2Value !=
                                                            '')) {
                                                  await widget
                                                      .bookings!.reference
                                                      .update(
                                                          createBookingsRecordData(
                                                    status: 'Начат',
                                                    boxName: _model
                                                        .dropDownAdmin2Value,
                                                  ));
                                                } else {
                                                  if (widget.bookings?.status ==
                                                      'Начат') {
                                                    await widget
                                                        .bookings!.reference
                                                        .update(
                                                            createBookingsRecordData(
                                                      status: 'Закончено',
                                                      forCarPay: functions
                                                          .focarProcent(
                                                              widget.company!
                                                                  .forCarPercent,
                                                              widget.bookings!
                                                                  .totalPrice),
                                                    ));

                                                    await AnalyticsRecord
                                                            .createDoc(widget
                                                                .company!
                                                                .reference)
                                                        .set(
                                                            createAnalyticsRecordData(
                                                      price: functions
                                                          .price100(widget
                                                              .bookings!
                                                              .totalPrice)
                                                          .toDouble(),
                                                      dateSum: functions.daySum(
                                                          dateTimeFormat(
                                                        'd/M',
                                                        widget.bookings!
                                                            .bookedDate!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )),
                                                      dateStringDMY: widget
                                                          .bookings
                                                          ?.bookedDateString,
                                                      date: widget
                                                          .bookings?.bookedDate,
                                                    ));
                                                    if (widget.bookings!
                                                        .createdByUser) {
                                                      if (containerUserRecord
                                                          .bookingCompanies
                                                          .contains(widget
                                                              .company
                                                              ?.reference)) {
                                                        await widget.bookings!
                                                            .bookedUser!
                                                            .update(
                                                                createUserRecordData(
                                                          lastBookingBoolean:
                                                              true,
                                                          linkLastBooking:
                                                              widget.bookings
                                                                  ?.reference,
                                                        ));
                                                      } else {
                                                        await widget.bookings!
                                                            .bookedUser!
                                                            .update({
                                                          ...createUserRecordData(
                                                            lastBookingBoolean:
                                                                true,
                                                            linkLastBooking:
                                                                widget.bookings
                                                                    ?.reference,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'bookingCompanies':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                widget.company
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }
                                                    }
                                                  }
                                                }
                                              },
                                              text: () {
                                                if (widget.bookings?.status ==
                                                    'Забронировано') {
                                                  return 'Начать';
                                                } else if (widget
                                                        .bookings?.status ==
                                                    'Начат') {
                                                  return 'Закончить';
                                                } else if (widget
                                                        .bookings?.status ==
                                                    'Закончено') {
                                                  return 'Завершено';
                                                } else {
                                                  return 'null';
                                                }
                                              }(),
                                              options: FFButtonOptions(
                                                width: 106.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: () {
                                                  if (_model.dropDownAdmin2Value !=
                                                          null &&
                                                      _model.dropDownAdmin2Value !=
                                                          '') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else if (widget
                                                          .bookings?.status ==
                                                      'Начат') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .green;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .starblue;
                                                  }
                                                }(),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

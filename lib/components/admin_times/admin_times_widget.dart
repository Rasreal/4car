import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_current_booking_record/admin_current_booking_record_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
            .where('booked_company', isEqualTo: widget.companyDoc!.reference)
            .where('selected_times_order', arrayContains: widget.timeOrder)
            .where('booked_date',
                isGreaterThanOrEqualTo: FFAppState().WEBFilterStartDate)
            .where('cancelled', isEqualTo: false)
            .where('booked_date',
                isLessThanOrEqualTo: FFAppState().WEBFilterEndDate),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
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
                      width: 86,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: Text(
                            '${widget.timeOrder?.toString()}:00',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 267,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).drawer,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            width: 1134,
                            height: 267,
                            decoration: BoxDecoration(),
                            child: StreamBuilder<List<BookingsRecord>>(
                              stream: queryBookingsRecord(
                                queryBuilder: (bookingsRecord) => bookingsRecord
                                    .where('booked_company',
                                        isEqualTo: widget.companyDoc!.reference)
                                    .where('selected_times_order',
                                        arrayContains: widget.timeOrder)
                                    .where('booked_date',
                                        isGreaterThanOrEqualTo:
                                            FFAppState().WEBFilterStartDate)
                                    .where('cancelled', isEqualTo: false)
                                    .where('booked_date',
                                        isLessThanOrEqualTo:
                                            FFAppState().WEBFilterEndDate),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
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
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (listViewBookingsRecord
                                                .createdByAdmin ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child:
                                                          AdminCurrentBookingRecordWidget(
                                                        bookingRecord:
                                                            listViewBookingsRecord
                                                                .reference,
                                                        company:
                                                            widget.companyDoc,
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              },
                                              child: Container(
                                                width: 315,
                                                height: 219,
                                                decoration: BoxDecoration(
                                                  color: listViewBookingsRecord
                                                              .selectedTimesOrder!
                                                              .toList()
                                                              .first ==
                                                          widget.timeOrder
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .gray2,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .gray2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(24, 24, 24, 24),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 19),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          16),
                                                                  child: Text(
                                                                    'Авто',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).gray2,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          16),
                                                                  child: Text(
                                                                    'Услуги',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).gray2,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Сумма',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .gray2,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          16,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    'Продолж.',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).gray2,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            16),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        listViewBookingsRecord
                                                                            .createdAdminUserName,
                                                                        'null',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            16),
                                                                    child: Text(
                                                                      functions
                                                                          .listStringToString(
                                                                              listViewBookingsRecord.selectedCompanyServicesName!.toList(),
                                                                              20)
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                20,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${valueOrDefault<String>(
                                                                      listViewBookingsRecord
                                                                          .totalPrice
                                                                          ?.toString(),
                                                                      '0',
                                                                    )} тг',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            16,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      '${listViewBookingsRecord.timeName} - ${listViewBookingsRecord.selectedTimesOrder!.toList().last.toString()}:00',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (listViewBookingsRecord
                                                                      .boxName ==
                                                                  null ||
                                                              listViewBookingsRecord
                                                                      .boxName ==
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                options: widget
                                                                    .companyDoc!
                                                                    .countBoxString!
                                                                    .toList()
                                                                    .toList(),
                                                                onChanged: (val) =>
                                                                    setState(() =>
                                                                        _model.dropDownAdminValueMap[listViewBookingsRecord] =
                                                                            val!),
                                                                width: 128,
                                                                height: 40,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
                                                                    ),
                                                                hintText:
                                                                    'Бокс №1',
                                                                fillColor:
                                                                    Colors
                                                                        .white,
                                                                elevation: 1,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .gray2,
                                                                borderWidth: 1,
                                                                borderRadius: 8,
                                                                margin:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            4,
                                                                            12,
                                                                            4),
                                                                hidesUnderline:
                                                                    true,
                                                              ),
                                                            ),
                                                          if (listViewBookingsRecord
                                                                      .boxName !=
                                                                  null &&
                                                              listViewBookingsRecord
                                                                      .boxName !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
                                                              child: Container(
                                                                width: 128,
                                                                height: 40,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .gray2,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        listViewBookingsRecord
                                                                            .boxName!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if ((listViewBookingsRecord
                                                                      .selectedTimesOrder!
                                                                      .toList()
                                                                      .first ==
                                                                  widget
                                                                      .timeOrder) &&
                                                              (listViewBookingsRecord
                                                                      .status !=
                                                                  'Завершено'))
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if ((listViewBookingsRecord
                                                                            .status ==
                                                                        'Забронировано') &&
                                                                    (_model.dropDownAdminValueMap[listViewBookingsRecord] !=
                                                                            null &&
                                                                        _model.dropDownAdminValueMap[listViewBookingsRecord] !=
                                                                            '')) {
                                                                  final bookingsUpdateData1 =
                                                                      createBookingsRecordData(
                                                                    status:
                                                                        'Начат',
                                                                    boxName: _model
                                                                            .dropDownAdminValueMap[
                                                                        listViewBookingsRecord],
                                                                  );
                                                                  await listViewBookingsRecord
                                                                      .reference
                                                                      .update(
                                                                          bookingsUpdateData1);
                                                                } else {
                                                                  if (listViewBookingsRecord
                                                                          .status ==
                                                                      'Начат') {
                                                                    final bookingsUpdateData2 =
                                                                        createBookingsRecordData(
                                                                      status:
                                                                          'Закончено',
                                                                      forCarPay: listViewBookingsRecord
                                                                              .totalPrice! *
                                                                          (widget.companyDoc!.forCarPercent! /
                                                                              100),
                                                                    );
                                                                    await listViewBookingsRecord
                                                                        .reference
                                                                        .update(
                                                                            bookingsUpdateData2);
                                                                  }
                                                                }
                                                              },
                                                              text: () {
                                                                if (listViewBookingsRecord
                                                                        .status ==
                                                                    'Забронировано') {
                                                                  return 'Начать';
                                                                } else if (listViewBookingsRecord
                                                                        .status ==
                                                                    'Начат') {
                                                                  return 'Закончить';
                                                                } else if (listViewBookingsRecord
                                                                        .status ==
                                                                    'Закончено') {
                                                                  return 'Завершено';
                                                                } else {
                                                                  return 'null';
                                                                }
                                                              }(),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 106,
                                                                height: 40,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                color: () {
                                                                  if (_model.dropDownAdminValueMap[
                                                                              listViewBookingsRecord] !=
                                                                          null &&
                                                                      _model.dropDownAdminValueMap[
                                                                              listViewBookingsRecord] !=
                                                                          '') {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor;
                                                                  } else if (listViewBookingsRecord
                                                                          .status ==
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
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).subtitle2Family),
                                                                    ),
                                                                elevation: 0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (listViewBookingsRecord
                                                .createdByUser ??
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 0, 0, 0),
                                            child: FutureBuilder<UserRecord>(
                                              future:
                                                  UserRecord.getDocumentOnce(
                                                      listViewBookingsRecord
                                                          .bookedUser!),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final containerUserRecord =
                                                    snapshot.data!;
                                                return InkWell(
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .viewInsets,
                                                          child:
                                                              AdminCurrentBookingRecordWidget(
                                                            bookingRecord:
                                                                listViewBookingsRecord
                                                                    .reference,
                                                            company: widget
                                                                .companyDoc,
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                  child: Container(
                                                    width: 315,
                                                    height: 219,
                                                    decoration: BoxDecoration(
                                                      color: listViewBookingsRecord
                                                                  .selectedTimesOrder!
                                                                  .toList()
                                                                  .first ==
                                                              widget.timeOrder
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .gray2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .gray2,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(24, 24,
                                                                  24, 24),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        19),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              16),
                                                                      child:
                                                                          Text(
                                                                        'Авто',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: FlutterFlowTheme.of(context).gray2,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              16),
                                                                      child:
                                                                          Text(
                                                                        'Услуги',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: FlutterFlowTheme.of(context).gray2,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Сумма',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyText1Family,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).gray2,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              16,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Продолж.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: FlutterFlowTheme.of(context).gray2,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            16),
                                                                        child:
                                                                            Text(
                                                                          '${listViewBookingsRecord.carBody} ${listViewBookingsRecord.carName}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            16),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .listStringToString(listViewBookingsRecord.selectedCompanyServicesName!.toList(), 20)
                                                                              .maybeHandleOverflow(
                                                                                maxChars: 20,
                                                                                replacement: '…',
                                                                              ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${valueOrDefault<String>(
                                                                          listViewBookingsRecord
                                                                              .totalPrice
                                                                              ?.toString(),
                                                                          '0',
                                                                        )} тг',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            16,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          '${listViewBookingsRecord.timeName} - ${listViewBookingsRecord.selectedTimesOrder!.toList().last.toString()}:00',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (listViewBookingsRecord
                                                                          .boxName ==
                                                                      null ||
                                                                  listViewBookingsRecord
                                                                          .boxName ==
                                                                      '')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
                                                                  child:
                                                                      FlutterFlowDropDown<
                                                                          String>(
                                                                    options: widget
                                                                        .companyDoc!
                                                                        .countBoxString!
                                                                        .toList()
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        setState(() =>
                                                                            _model.dropDownUserValueMap[listViewBookingsRecord] =
                                                                                val!),
                                                                    width: 128,
                                                                    height: 40,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                    hintText:
                                                                        'Бокс №1',
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    elevation:
                                                                        1,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .gray2,
                                                                    borderWidth:
                                                                        1,
                                                                    borderRadius:
                                                                        8,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            4,
                                                                            12,
                                                                            4),
                                                                    hidesUnderline:
                                                                        true,
                                                                  ),
                                                                ),
                                                              if (listViewBookingsRecord
                                                                          .boxName !=
                                                                      null &&
                                                                  listViewBookingsRecord
                                                                          .boxName !=
                                                                      '')
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: 128,
                                                                    height: 40,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .gray2,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              16,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            listViewBookingsRecord.boxName!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if ((listViewBookingsRecord
                                                                          .selectedTimesOrder!
                                                                          .toList()
                                                                          .first ==
                                                                      widget
                                                                          .timeOrder) &&
                                                                  (listViewBookingsRecord
                                                                          .status !=
                                                                      'Завершено'))
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    if ((listViewBookingsRecord.status ==
                                                                            'Забронировано') &&
                                                                        (_model.dropDownUserValueMap[listViewBookingsRecord] !=
                                                                                null &&
                                                                            _model.dropDownUserValueMap[listViewBookingsRecord] !=
                                                                                '')) {
                                                                      final bookingsUpdateData1 =
                                                                          createBookingsRecordData(
                                                                        status:
                                                                            'Начат',
                                                                        boxName:
                                                                            _model.dropDownUserValueMap[listViewBookingsRecord],
                                                                      );
                                                                      await listViewBookingsRecord
                                                                          .reference
                                                                          .update(
                                                                              bookingsUpdateData1);
                                                                    } else {
                                                                      if (listViewBookingsRecord
                                                                              .status ==
                                                                          'Начат') {
                                                                        final bookingsUpdateData2 =
                                                                            createBookingsRecordData(
                                                                          status:
                                                                              'Закончено',
                                                                          forCarPay:
                                                                              listViewBookingsRecord.totalPrice! * (widget.companyDoc!.forCarPercent! / 100),
                                                                        );
                                                                        await listViewBookingsRecord
                                                                            .reference
                                                                            .update(bookingsUpdateData2);
                                                                        if (listViewBookingsRecord
                                                                            .createdByUser!) {
                                                                          if (containerUserRecord
                                                                              .bookingCompanies!
                                                                              .toList()
                                                                              .contains(widget.companyDoc!.reference)) {
                                                                            final userUpdateData1 =
                                                                                createUserRecordData(
                                                                              lastBookingBoolean: true,
                                                                              linkLastBooking: listViewBookingsRecord.reference,
                                                                            );
                                                                            await listViewBookingsRecord.bookedUser!.update(userUpdateData1);
                                                                          } else {
                                                                            final userUpdateData2 =
                                                                                {
                                                                              ...createUserRecordData(
                                                                                lastBookingBoolean: true,
                                                                                linkLastBooking: listViewBookingsRecord.reference,
                                                                              ),
                                                                              'bookingCompanies': FieldValue.arrayUnion([
                                                                                listViewBookingsRecord.bookedCompany
                                                                              ]),
                                                                            };
                                                                            await listViewBookingsRecord.bookedUser!.update(userUpdateData2);
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  },
                                                                  text: () {
                                                                    if (listViewBookingsRecord
                                                                            .status ==
                                                                        'Забронировано') {
                                                                      return 'Начать';
                                                                    } else if (listViewBookingsRecord
                                                                            .status ==
                                                                        'Начат') {
                                                                      return 'Закончить';
                                                                    } else if (listViewBookingsRecord
                                                                            .status ==
                                                                        'Закончено') {
                                                                      return 'Завершено';
                                                                    } else {
                                                                      return 'null';
                                                                    }
                                                                  }(),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: 106,
                                                                    height: 40,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    color: () {
                                                                      if (_model.dropDownUserValueMap[listViewBookingsRecord] !=
                                                                              null &&
                                                                          _model.dropDownUserValueMap[listViewBookingsRecord] !=
                                                                              '') {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .primaryColor;
                                                                      } else if (listViewBookingsRecord
                                                                              .status ==
                                                                          'Начат') {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .green;
                                                                      } else {
                                                                        return FlutterFlowTheme.of(context)
                                                                            .starblue;
                                                                      }
                                                                    }(),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                        ),
                                                                    elevation:
                                                                        0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width: 1,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
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
                                  },
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Container(
                              width: 52,
                              height: 267,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, Color(0x00FFFFFF)],
                                  stops: [0.2, 1],
                                  begin: AlignmentDirectional(1, 0),
                                  end: AlignmentDirectional(-1, 0),
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
                  height: 1,
                  thickness: 1,
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

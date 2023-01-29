import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_booked_active_widget.dart';
import '../components/empty_booked_history_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyNotesWidget extends StatefulWidget {
  const MyNotesWidget({Key? key}) : super(key: key);

  @override
  _MyNotesWidgetState createState() => _MyNotesWidgetState();
}

class _MyNotesWidgetState extends State<MyNotesWidget> {
  Completer<CompaniesRecord>? _documentRequestCompleter;
  Completer<List<BookingsRecord>>? _firestoreRequestCompleter;
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? choiceChipsValue;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MY_NOTES_PAGE_My_notes_ON_PAGE_LOAD');
      logFirebaseEvent('My_notes_refresh_database_request');
      setState(() => _firestoreRequestCompleter = null);
      logFirebaseEvent('My_notes_refresh_database_request');
      setState(() => _documentRequestCompleter = null);
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'My_notes'});
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                      child: FlutterFlowChoiceChips(
                        initiallySelected: ['Мои записи'],
                        options: [ChipData('Мои записи'), ChipData('История')],
                        onChanged: (val) =>
                            setState(() => choiceChipsValue = val?.first),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                          iconColor: Color(0x00000000),
                          iconSize: 0,
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
                          elevation: 0,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFFF0F0F0),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText2Family,
                                color: Color(0xFF323B45),
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText2Family),
                              ),
                          iconColor: Color(0x00000000),
                          iconSize: 0,
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(44, 0, 44, 0),
                          elevation: 0,
                        ),
                        chipSpacing: 0,
                        multiselect: false,
                        initialized: choiceChipsValue != null,
                        alignment: WrapAlignment.spaceEvenly,
                      ),
                    ),
                  ),
                ),
                if (choiceChipsValue == 'Мои записи')
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: StreamBuilder<List<BookingsRecord>>(
                            stream: queryBookingsRecord(
                              queryBuilder: (bookingsRecord) => bookingsRecord
                                  .where('booked_user',
                                      isEqualTo: currentUserReference)
                                  .where('status', isEqualTo: 'Забронировано'),
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
                              List<BookingsRecord> listViewBookingsRecordList =
                                  snapshot.data!;
                              if (listViewBookingsRecordList.isEmpty) {
                                return Container(
                                  width: double.infinity,
                                  child: EmptyBookedActiveWidget(),
                                );
                              }
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewBookingsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewBookingsRecord =
                                      listViewBookingsRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: StreamBuilder<CompaniesRecord>(
                                      stream: CompaniesRecord.getDocument(
                                          listViewBookingsRecord
                                              .bookedCompany!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final containerCompaniesRecord =
                                            snapshot.data!;
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'MY_NOTES_PAGE_Container_oftm1eyq_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.goNamed(
                                              'current_booking_record',
                                              queryParams: {
                                                'booking': serializeParam(
                                                  listViewBookingsRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: Color(0xFFD6D6D6),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  image: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      containerCompaniesRecord
                                                                          .logo,
                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/mq76tomaqbk1/4car.png',
                                                                    ),
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            14,
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
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                                                                    child: Text(
                                                                                      containerCompaniesRecord.name!,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            fontSize: 16,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: 6,
                                                                                    height: 6,
                                                                                    decoration: BoxDecoration(
                                                                                      color: valueOrDefault<Color>(
                                                                                        functions.closedOpened(getCurrentTimestamp, containerCompaniesRecord.openTimeOrder!, containerCompaniesRecord.closedTimeOrder!) == true ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).red1,
                                                                                        Colors.white,
                                                                                      ),
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                                                              child: RatingBarIndicator(
                                                                                itemBuilder: (context, index) => Icon(
                                                                                  Icons.star_rounded,
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                ),
                                                                                direction: Axis.horizontal,
                                                                                rating: valueOrDefault<double>(
                                                                                  functions.averageRating(containerCompaniesRecord.rating!.toList()),
                                                                                  0.0,
                                                                                ),
                                                                                unratedColor: FlutterFlowTheme.of(context).starblue,
                                                                                itemCount: 5,
                                                                                itemSize: 14,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        StreamBuilder<
                                                                            UserRecord>(
                                                                          stream:
                                                                              UserRecord.getDocument(currentUserReference!),
                                                                          builder:
                                                                              (context, snapshot) {
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
                                                                            final toggleIconUserRecord =
                                                                                snapshot.data!;
                                                                            return ToggleIcon(
                                                                              onPressed: () async {
                                                                                final favCompanyElement = containerCompaniesRecord.reference;
                                                                                final favCompanyUpdate = toggleIconUserRecord.favCompany!.toList().contains(favCompanyElement)
                                                                                    ? FieldValue.arrayRemove([
                                                                                        favCompanyElement
                                                                                      ])
                                                                                    : FieldValue.arrayUnion([
                                                                                        favCompanyElement
                                                                                      ]);
                                                                                final userUpdateData = {
                                                                                  'favCompany': favCompanyUpdate,
                                                                                };
                                                                                await toggleIconUserRecord.reference.update(userUpdateData);
                                                                              },
                                                                              value: toggleIconUserRecord.favCompany!.toList().contains(containerCompaniesRecord.reference),
                                                                              onIcon: Icon(
                                                                                FFIcons.kicSaveee,
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 24,
                                                                              ),
                                                                              offIcon: Icon(
                                                                                FFIcons.kproperty1unsaved,
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 24,
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
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 12),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              containerCompaniesRecord
                                                                  .street!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                '${formatNumber(
                                                                  functions.returnDistanceBetweenTwoPoints(
                                                                      currentUserLocationValue,
                                                                      containerCompaniesRecord
                                                                          .location),
                                                                  formatType:
                                                                      FormatType
                                                                          .custom,
                                                                  format: '',
                                                                  locale: '',
                                                                )}км',
                                                                '----',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    color: Color(
                                                                        0xFF9CA3AF),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: Color(0xFFF2F2F2),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final services =
                                                          listViewBookingsRecord
                                                              .selectedCompanyServices!
                                                              .toList()
                                                              .take(2)
                                                              .toList();
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            services.length,
                                                            (servicesIndex) {
                                                          final servicesItem =
                                                              services[
                                                                  servicesIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        12,
                                                                        4,
                                                                        16),
                                                            child: StreamBuilder<
                                                                CompanyServicesRecord>(
                                                              stream: CompanyServicesRecord
                                                                  .getDocument(
                                                                      servicesItem),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width: 50,
                                                                      height:
                                                                          50,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final textCompanyServicesRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return Text(
                                                                  '${textCompanyServicesRecord.name},',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 16),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Время:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: Color(
                                                                          0xFF9CA3AF),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewBookingsRecord
                                                                        .timeName,
                                                                    '-',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Стоимость:',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family,
                                                                      color: Color(
                                                                          0xFF9CA3AF),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyText1Family),
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${listViewBookingsRecord.totalPrice?.toString()} тг',
                                                                    '0 тг',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'Проложить путь',
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 40,
                                                      color: Colors.white,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family),
                                                              ),
                                                      elevation: 0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                if (choiceChipsValue == 'История')
                  Expanded(
                    child: FutureBuilder<List<BookingsRecord>>(
                      future: (_firestoreRequestCompleter ??=
                              Completer<List<BookingsRecord>>()
                                ..complete(queryBookingsRecordOnce(
                                  queryBuilder: (bookingsRecord) =>
                                      bookingsRecord
                                          .where('booked_user',
                                              isEqualTo: currentUserReference)
                                          .where('status', isEqualTo: 'Архив'),
                                )))
                          .future,
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<BookingsRecord> choiceHistoryBookingsRecordList =
                            snapshot.data!;
                        if (choiceHistoryBookingsRecordList.isEmpty) {
                          return EmptyBookedHistoryWidget();
                        }
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                choiceHistoryBookingsRecordList.length,
                                (choiceHistoryIndex) {
                              final choiceHistoryBookingsRecord =
                                  choiceHistoryBookingsRecordList[
                                      choiceHistoryIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MY_NOTES_PAGE_Container_bk1aukw0_ON_TAP');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.goNamed(
                                      'current_booking_record',
                                      queryParams: {
                                        'booking': serializeParam(
                                          choiceHistoryBookingsRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Color(0xFFD6D6D6),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 12),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          StreamBuilder<CompaniesRecord>(
                                            stream: CompaniesRecord.getDocument(
                                                choiceHistoryBookingsRecord
                                                    .bookedCompany!),
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
                                              final columnCompaniesRecord =
                                                  snapshot.data!;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit
                                                                  .contain,
                                                              image:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  columnCompaniesRecord
                                                                      .logo,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/mq76tomaqbk1/4car.png',
                                                                ),
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        14,
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
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              6),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                4,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              columnCompaniesRecord.name!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                    fontSize: 16,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                6,
                                                                            height:
                                                                                6,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: valueOrDefault<Color>(
                                                                                functions.closedOpened(getCurrentTimestamp, columnCompaniesRecord.openTimeOrder!, columnCompaniesRecord.closedTimeOrder!) == true ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).red1,
                                                                                Colors.white,
                                                                              ),
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    StreamBuilder<
                                                                        UserRecord>(
                                                                      stream: UserRecord
                                                                          .getDocument(
                                                                              currentUserReference!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final toggleIconUserRecord =
                                                                            snapshot.data!;
                                                                        return ToggleIcon(
                                                                          onPressed:
                                                                              () async {
                                                                            final favCompanyElement =
                                                                                columnCompaniesRecord.reference;
                                                                            final favCompanyUpdate = toggleIconUserRecord.favCompany!.toList().contains(favCompanyElement)
                                                                                ? FieldValue.arrayRemove([
                                                                                    favCompanyElement
                                                                                  ])
                                                                                : FieldValue.arrayUnion([
                                                                                    favCompanyElement
                                                                                  ]);
                                                                            final userUpdateData =
                                                                                {
                                                                              'favCompany': favCompanyUpdate,
                                                                            };
                                                                            await toggleIconUserRecord.reference.update(userUpdateData);
                                                                          },
                                                                          value: toggleIconUserRecord
                                                                              .favCompany!
                                                                              .toList()
                                                                              .contains(columnCompaniesRecord.reference),
                                                                          onIcon:
                                                                              Icon(
                                                                            FFIcons.kicSaveee,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                          offIcon:
                                                                              Icon(
                                                                            FFIcons.kproperty1unsaved,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          4),
                                                                  child:
                                                                      RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating: valueOrDefault<
                                                                        double>(
                                                                      functions.averageRating(columnCompaniesRecord
                                                                          .rating!
                                                                          .toList()),
                                                                      0.0,
                                                                    ),
                                                                    unratedColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .starblue,
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 12),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          columnCompaniesRecord
                                                              .street!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${formatNumber(
                                                              functions.returnDistanceBetweenTwoPoints(
                                                                  currentUserLocationValue,
                                                                  columnCompaniesRecord
                                                                      .location),
                                                              formatType:
                                                                  FormatType
                                                                      .custom,
                                                              format: '',
                                                              locale: '',
                                                            )}км',
                                                            '----',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: Color(
                                                                    0xFF9CA3AF),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: Color(0xFFF2F2F2),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final services =
                                                  choiceHistoryBookingsRecord
                                                      .selectedCompanyServices!
                                                      .toList()
                                                      .take(2)
                                                      .toList();
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    services.length,
                                                    (servicesIndex) {
                                                  final servicesItem =
                                                      services[servicesIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 12, 4, 16),
                                                    child: StreamBuilder<
                                                        CompanyServicesRecord>(
                                                      stream:
                                                          CompanyServicesRecord
                                                              .getDocument(
                                                                  servicesItem),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50,
                                                              height: 50,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textCompanyServicesRecord =
                                                            snapshot.data!;
                                                        return Text(
                                                          '${textCompanyServicesRecord.name},',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Время:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: Color(
                                                                      0xFF9CA3AF),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${choiceHistoryBookingsRecord.duration?.toString()} мин',
                                                            '0 мин',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Стоимость:',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: Color(
                                                                      0xFF9CA3AF),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4, 0, 0, 0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${choiceHistoryBookingsRecord.totalPrice?.toString()} тг',
                                                            '0  тг',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          FutureBuilder<CompaniesRecord>(
                                            future: (_documentRequestCompleter ??=
                                                    Completer<CompaniesRecord>()
                                                      ..complete(CompaniesRecord
                                                          .getDocumentOnce(
                                                              choiceHistoryBookingsRecord
                                                                  .bookedCompany!)))
                                                .future,
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
                                              final buttonCompaniesRecord =
                                                  snapshot.data!;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'MY_NOTES_ЗАПИСАТЬСЯ_СНОВА_BTN_ON_TAP');
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.carscount,
                                                          0) <
                                                      1) {
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                      'edit_profile',
                                                      queryParams: {
                                                        'page': serializeParam(
                                                          'carNull',
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_update_local_state');
                                                    FFAppState().update(() {
                                                      FFAppState().selectedCar =
                                                          currentUserDocument!
                                                              .firstCar;
                                                      FFAppState()
                                                          .selectedServices = [];
                                                      FFAppState()
                                                          .bookingSelectedServicesName = [];
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_update_local_state');
                                                    FFAppState().update(() {
                                                      FFAppState()
                                                              .selectedTimeSlot =
                                                          null;
                                                      FFAppState().price = 0;
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_update_local_state');
                                                    FFAppState().update(() {
                                                      FFAppState().selectPush =
                                                          1000;
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                      'booking_page',
                                                      queryParams: {
                                                        'company':
                                                            serializeParam(
                                                          buttonCompaniesRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'company':
                                                            buttonCompaniesRecord,
                                                      },
                                                    );
                                                  }
                                                },
                                                text: 'Записаться снова',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                                  elevation: 0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future waitForDocumentRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _documentRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

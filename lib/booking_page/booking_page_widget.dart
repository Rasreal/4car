import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_booked_time_slot_widget.dart';
import '../components/select_car_widget.dart';
import '../components/select_notification_widget.dart';
import '../components/select_services_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_page_model.dart';
export 'booking_page_model.dart';

class BookingPageWidget extends StatefulWidget {
  const BookingPageWidget({
    Key? key,
    this.company,
  }) : super(key: key);

  final CompaniesRecord? company;

  @override
  _BookingPageWidgetState createState() => _BookingPageWidgetState();
}

class _BookingPageWidgetState extends State<BookingPageWidget>
    with TickerProviderStateMixin {
  late BookingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 90.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 90.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 600.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().selectPush = 60;
      });
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 48,
                            icon: Icon(
                              FFIcons.kicBack,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 24,
                            ),
                            onPressed: () async {
                              context.goNamed(
                                'HomePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.leftToRight,
                                  ),
                                },
                              );
                            },
                          ),
                          Text(
                            'Новая запись',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 48,
                            icon: Icon(
                              FFIcons.kicBack,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: StreamBuilder<MyCarsRecord>(
                        stream:
                            MyCarsRecord.getDocument(FFAppState().selectedCar!),
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
                          final columnMyCarsRecord = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              widget.company!.logo,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/mq76tomaqbk1/4car.png',
                                            ),
                                          ).image,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 6),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        4,
                                                                        0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget.company!
                                                                    .name,
                                                                'null',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 6,
                                                            height: 6,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                functions.closedOpened(
                                                                            getCurrentTimestamp,
                                                                            valueOrDefault<int>(
                                                                              widget.company!.openTimeOrder,
                                                                              0,
                                                                            ),
                                                                            valueOrDefault<int>(
                                                                              widget.company!.closedTimeOrder,
                                                                              0,
                                                                            )) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(context).primaryColor
                                                                    : FlutterFlowTheme.of(context).red1,
                                                                Colors.white,
                                                              ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 4),
                                                      child: RatingBarIndicator(
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                          Icons.star_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                        direction:
                                                            Axis.horizontal,
                                                        rating: valueOrDefault<
                                                            double>(
                                                          functions
                                                              .averageRating(
                                                                  widget
                                                                      .company!
                                                                      .rating!
                                                                      .toList()),
                                                          0.0,
                                                        ),
                                                        unratedColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .starblue,
                                                        itemCount: 5,
                                                        itemSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                StreamBuilder<UserRecord>(
                                                  stream: UserRecord.getDocument(
                                                      currentUserReference!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final toggleIconUserRecord =
                                                        snapshot.data!;
                                                    return ToggleIcon(
                                                      onPressed: () async {
                                                        final favCompanyElement =
                                                            widget.company!
                                                                .reference;
                                                        final favCompanyUpdate =
                                                            toggleIconUserRecord
                                                                    .favCompany!
                                                                    .toList()
                                                                    .contains(
                                                                        favCompanyElement)
                                                                ? FieldValue
                                                                    .arrayRemove([
                                                                    favCompanyElement
                                                                  ])
                                                                : FieldValue
                                                                    .arrayUnion([
                                                                    favCompanyElement
                                                                  ]);
                                                        final userUpdateData = {
                                                          'favCompany':
                                                              favCompanyUpdate,
                                                        };
                                                        await toggleIconUserRecord
                                                            .reference
                                                            .update(
                                                                userUpdateData);
                                                      },
                                                      value:
                                                          toggleIconUserRecord
                                                              .favCompany!
                                                              .toList()
                                                              .contains(widget
                                                                  .company!
                                                                  .reference),
                                                      onIcon: Icon(
                                                        FFIcons.kicSaveee,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 24,
                                                      ),
                                                      offIcon: Icon(
                                                        FFIcons
                                                            .kproperty1unsaved,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 24,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    widget.company!.street,
                                                    'null',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    '${formatNumber(
                                                      functions
                                                          .returnDistanceBetweenTwoPoints(
                                                              currentUserLocationValue,
                                                              widget.company!
                                                                  .location),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '',
                                                      locale: '',
                                                    )}км',
                                                    '----',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            Color(0xFF9CA3AF),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 12),
                                child: FlutterFlowCalendar(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  weekFormat: true,
                                  weekStartsMonday: true,
                                  initialDate: getCurrentTimestamp,
                                  onChange: (DateTimeRange? newSelectedDate) {
                                    setState(() => _model.calendarSelectedDay =
                                        newSelectedDate);
                                  },
                                  titleStyle: TextStyle(),
                                  dayOfWeekStyle: TextStyle(),
                                  dateStyle: TextStyle(),
                                  selectedDateStyle: TextStyle(),
                                  inactiveDateStyle: TextStyle(),
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: FlutterFlowTheme.of(context).gray3,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Text(
                                  'Выбрать время',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: FutureBuilder<List<ForcarTimesRecord>>(
                                  future: queryForcarTimesRecordOnce(
                                    queryBuilder: (forcarTimesRecord) =>
                                        forcarTimesRecord.orderBy('time_order'),
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
                                    List<ForcarTimesRecord>
                                        wrapForcarTimesRecordList =
                                        snapshot.data!;
                                    if (wrapForcarTimesRecordList.isEmpty) {
                                      return Center(
                                        child: EmptyBookedTimeSlotWidget(),
                                      );
                                    }
                                    return Wrap(
                                      spacing: 0,
                                      runSpacing: 0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(
                                          wrapForcarTimesRecordList.length,
                                          (wrapIndex) {
                                        final wrapForcarTimesRecord =
                                            wrapForcarTimesRecordList[
                                                wrapIndex];
                                        return Visibility(
                                          visible: (functions.comparisonTime(
                                                      getCurrentTimestamp,
                                                      wrapForcarTimesRecord
                                                          .timeOrder!,
                                                      _model
                                                          .calendarSelectedDay!
                                                          .end) ==
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 16, 16),
                                            child: StreamBuilder<
                                                List<BookingsRecord>>(
                                              stream: queryBookingsRecord(
                                                queryBuilder: (bookingsRecord) => bookingsRecord
                                                    .where('time_name',
                                                        isEqualTo: wrapForcarTimesRecord
                                                                    .timeName !=
                                                                ''
                                                            ? wrapForcarTimesRecord
                                                                .timeName
                                                            : null)
                                                    .where('time_order',
                                                        isEqualTo:
                                                            wrapForcarTimesRecord
                                                                .timeOrder)
                                                    .where('booked_date',
                                                        isEqualTo: _model
                                                            .calendarSelectedDay
                                                            ?.start)
                                                    .where('booked_company',
                                                        isEqualTo: widget
                                                            .company!.reference)
                                                    .where('cancelled',
                                                        isEqualTo: false),
                                              ),
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
                                                List<BookingsRecord>
                                                    containerBookingsRecordList =
                                                    snapshot.data!;
                                                return InkWell(
                                                  onTap: () async {
                                                    if (containerBookingsRecordList
                                                            .length <
                                                        widget.company!
                                                            .countBox!) {
                                                      if (FFAppState()
                                                              .selectedTimeSlot ==
                                                          wrapForcarTimesRecord
                                                              .reference) {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .selectedTimeSlot =
                                                              null;
                                                          FFAppState().price =
                                                              0;
                                                          FFAppState()
                                                              .selectedServices = [];
                                                        });
                                                      } else {
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .selectedTimeSlot =
                                                              wrapForcarTimesRecord
                                                                  .reference;
                                                          FFAppState()
                                                              .selectedServices = [];
                                                          FFAppState().price =
                                                              0;
                                                          FFAppState()
                                                              .selectedServicesDuration = 0;
                                                          FFAppState()
                                                              .bookedTimes = [];
                                                        });
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                              .addToBookedTimes(
                                                                  wrapForcarTimesRecord
                                                                      .timeOrder!);
                                                        });
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 67,
                                                    height: 32,
                                                    decoration: BoxDecoration(
                                                      color: () {
                                                        if (containerBookingsRecordList
                                                                .length >=
                                                            widget.company!
                                                                .countBox!) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground;
                                                        } else if (FFAppState()
                                                                .selectedTimeSlot ==
                                                            wrapForcarTimesRecord
                                                                .reference) {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor;
                                                        } else {
                                                          return FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground;
                                                        }
                                                      }(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color: () {
                                                          if (containerBookingsRecordList
                                                                  .length >=
                                                              widget.company!
                                                                  .countBox!) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .gray3;
                                                          } else if (FFAppState()
                                                                  .selectedTimeSlot ==
                                                              wrapForcarTimesRecord
                                                                  .reference) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor;
                                                          } else {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor;
                                                          }
                                                        }(),
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          wrapForcarTimesRecord
                                                              .timeName,
                                                          '---',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: () {
                                                                    if (containerBookingsRecordList
                                                                            .length >=
                                                                        widget
                                                                            .company!
                                                                            .countBox!) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .gray3;
                                                                    } else if (FFAppState()
                                                                            .selectedTimeSlot ==
                                                                        wrapForcarTimesRecord
                                                                            .reference) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground;
                                                                    } else {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor;
                                                                    }
                                                                  }(),
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
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
                              Divider(
                                thickness: 1,
                                color: FlutterFlowTheme.of(context).gray3,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Выбрать авто',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2Family),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: SelectCarWidget(),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .gray2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (FFAppState().selectedCar ==
                                                  null)
                                                Text(
                                                  'Выберите авто',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              if (FFAppState().selectedCar !=
                                                  null)
                                                Expanded(
                                                  child: Text(
                                                    '${columnMyCarsRecord.carBody}, ${columnMyCarsRecord.carNum}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              Icon(
                                                FFIcons.kicArrowsButtonDown,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray2,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Выбрать услугу',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2Family),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        if (FFAppState().selectedTimeSlot !=
                                            null) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: SelectServicesWidget(
                                                  company:
                                                      widget.company!.reference,
                                                  carBody: columnMyCarsRecord
                                                      .carBody,
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Выберите время для записи',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  Color(0x00000000),
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .gray2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (FFAppState()
                                                      .selectedServices
                                                      .length ==
                                                  0)
                                                Text(
                                                  'Выбрать',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              if (FFAppState()
                                                      .selectedServices
                                                      .length !=
                                                  null)
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (FFAppState()
                                                              .selectedServices
                                                              .length !=
                                                          0)
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            functions.listStringToString(
                                                                FFAppState()
                                                                    .bookingSelectedServicesName
                                                                    .toList(),
                                                                30),
                                                            '0',
                                                          ).maybeHandleOverflow(
                                                              maxChars: 80),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              Icon(
                                                FFIcons.kicArrowsButtonDown,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray2,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Text(
                                      'Напомнить',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2Family),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: SelectNotificationWidget(),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .gray2,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (FFAppState().selectPush ==
                                                  1000)
                                                Text(
                                                  'Не напоминать',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .red1,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                ),
                                              if (FFAppState().selectPush == 30)
                                                Text(
                                                  'За пол часа до записи',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                ),
                                              if (FFAppState().selectPush == 60)
                                                Text(
                                                  'За 1 час до записи',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                ),
                                              if (FFAppState().selectPush ==
                                                  120)
                                                Text(
                                                  'За 2 часа до записи ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                ),
                                              Icon(
                                                FFIcons.kicArrowsButtonDown,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray2,
                                                size: 24,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (FFAppState().selectedTimeSlot != null)
                                StreamBuilder<ForcarTimesRecord>(
                                  stream: ForcarTimesRecord.getDocument(
                                      FFAppState().selectedTimeSlot!),
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
                                    final columnForcarTimesRecord =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 0, 0),
                                              child: Text(
                                                'Продолжительность',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText2Family,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2Family),
                                                        ),
                                              ),
                                            ),
                                            if (FFAppState()
                                                    .selectedServicesDuration <=
                                                60)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  '${columnForcarTimesRecord.timeName} - ${functions.addTimeOrder(columnForcarTimesRecord.timeOrder, 1).toString()}:00',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2Family,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2Family),
                                                      ),
                                                ),
                                              ),
                                            if ((FFAppState()
                                                        .selectedServicesDuration >
                                                    60) &&
                                                (FFAppState()
                                                        .selectedServicesDuration <=
                                                    120))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  '${columnForcarTimesRecord.timeName} - ${functions.addTimeOrder(columnForcarTimesRecord.timeOrder, 2).toString()}:00',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2Family,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2Family),
                                                      ),
                                                ),
                                              ),
                                            if ((FFAppState()
                                                        .selectedServicesDuration >
                                                    120) &&
                                                (FFAppState()
                                                        .selectedServicesDuration <=
                                                    180))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  '${columnForcarTimesRecord.timeName} - ${functions.addTimeOrder(columnForcarTimesRecord.timeOrder, 3).toString()}:00',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2Family,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2Family),
                                                      ),
                                                ),
                                              ),
                                            if ((FFAppState()
                                                        .selectedServicesDuration >
                                                    180) &&
                                                (FFAppState()
                                                        .selectedServicesDuration <=
                                                    240))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Text(
                                                  '${columnForcarTimesRecord.timeName} - ${functions.addTimeOrder(columnForcarTimesRecord.timeOrder, 4).toString()}:00',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2Family,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2Family),
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 32, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 32,
                                                height: 32,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFD0E1F0),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Icon(
                                                  FFIcons.kicMoney,
                                                  color: Colors.white,
                                                  size: 24,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'К оплате: ${valueOrDefault<String>(
                                                        FFAppState()
                                                            .price
                                                            .toString(),
                                                        '0',
                                                      )}тг',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                fontSize: 16,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Text(
                                                        'Оплата нужно произвести после мойки авто',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family,
                                                                  color: Color(
                                                                      0xFFCBCACA),
                                                                  fontSize: 12,
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
                                        if ((FFAppState().selectedCar !=
                                                null) &&
                                            (FFAppState().selectedTimeSlot !=
                                                null) &&
                                            (FFAppState()
                                                    .selectedServices
                                                    .length !=
                                                0))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 16, 0, 20),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((FFAppState()
                                                            .selectedCar !=
                                                        null) &&
                                                    (FFAppState()
                                                            .selectedTimeSlot !=
                                                        null) &&
                                                    (FFAppState()
                                                            .selectedServices
                                                            .length !=
                                                        0))
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      FFAppState().update(() {
                                                        FFAppState().bookedTimes = functions
                                                            .listSelectedTimesOrder(
                                                                FFAppState()
                                                                    .selectedServicesDuration,
                                                                columnForcarTimesRecord
                                                                    .timeOrder!)
                                                            .toList();
                                                      });

                                                      final bookingsCreateData =
                                                          {
                                                        ...createBookingsRecordData(
                                                          bookedUser:
                                                              currentUserReference,
                                                          bookedCompany: widget
                                                              .company!
                                                              .reference,
                                                          timeName:
                                                              columnForcarTimesRecord
                                                                  .timeName,
                                                          timeOrder:
                                                              columnForcarTimesRecord
                                                                  .timeOrder,
                                                          status:
                                                              'Забронировано',
                                                          bookedDate: _model
                                                              .calendarSelectedDay
                                                              ?.end,
                                                          totalPrice:
                                                              FFAppState()
                                                                  .price,
                                                          id: valueOrDefault<
                                                              String>(
                                                            functions.idGenerator(
                                                                valueOrDefault<
                                                                    int>(
                                                              random_data
                                                                  .randomInteger(
                                                                      100000,
                                                                      999000000),
                                                              0,
                                                            )),
                                                            '0',
                                                          ),
                                                          carBody:
                                                              columnMyCarsRecord
                                                                  .carBody,
                                                          carName:
                                                              columnMyCarsRecord
                                                                  .carNum,
                                                          carOrder:
                                                              columnMyCarsRecord
                                                                  .carOrder,
                                                          bookedCompanyDocument:
                                                              widget.company!
                                                                  .companyDocument,
                                                          bookedDateString:
                                                              dateTimeFormat(
                                                            'd/M/y',
                                                            _model
                                                                .calendarSelectedDay
                                                                ?.start,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          createdByUser: true,
                                                          cancelled: false,
                                                        ),
                                                        'selected_company_services':
                                                            FFAppState()
                                                                .selectedServices,
                                                        'selected_times_order':
                                                            FFAppState()
                                                                .bookedTimes,
                                                        'selected_company_services_name':
                                                            FFAppState()
                                                                .bookingSelectedServicesName,
                                                      };
                                                      var bookingsRecordReference =
                                                          BookingsRecord
                                                              .collection
                                                              .doc();
                                                      await bookingsRecordReference
                                                          .set(
                                                              bookingsCreateData);
                                                      _model.booking = BookingsRecord
                                                          .getDocumentFromData(
                                                              bookingsCreateData,
                                                              bookingsRecordReference);
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'containerOnActionTriggerAnimation']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }

                                                      final companyNotificationsCreateData =
                                                          createCompanyNotificationsRecordData(
                                                        message:
                                                            'Новая запись: ${_model.booking!.carBody}, ${_model.booking!.carName}, ${_model.booking!.timeName}',
                                                        date:
                                                            getCurrentTimestamp,
                                                        opened: false,
                                                        bookingRef: _model
                                                            .booking!.reference,
                                                        type: 'new_booking',
                                                      );
                                                      await CompanyNotificationsRecord
                                                              .createDoc(widget
                                                                  .company!
                                                                  .reference)
                                                          .set(
                                                              companyNotificationsCreateData);
                                                      FFAppState().update(() {
                                                        FFAppState()
                                                            .selectPush = 1000;
                                                      });

                                                      context
                                                          .goNamed('My_notes');

                                                      setState(() {});
                                                    },
                                                    text: 'Записаться',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 48,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .subtitle2Family),
                                                              ),
                                                      elevation: 0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
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
                                      ],
                                    );
                                  },
                                ),
                              if ((FFAppState().selectedCar == null) ||
                                  (FFAppState().selectedTimeSlot == null) ||
                                  (FFAppState().selectedServices.length == 0))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 16, 0, 20),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Записаться',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48,
                                      color:
                                          FlutterFlowTheme.of(context).starblue,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family,
                                            color: Colors.white,
                                            fontSize: 16,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2Family),
                                          ),
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x64000000),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    width: 192,
                    height: 176,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              FFIcons.kcheeek,
                              color: Colors.white,
                              size: 44,
                            ),
                          ),
                        ),
                        Text(
                          'Вы успешно\nзаписались!',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation']!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

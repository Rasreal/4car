import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_booked_time_slot_widget.dart';
import '/components/select_car_widget.dart';
import '/components/select_notification_widget.dart';
import '/components/select_services_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
          begin: 0.0,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 90.ms,
          duration: 600.ms,
          begin: 1.0,
          end: 0.0,
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 48.0,
                            icon: Icon(
                              FFIcons.kicBack,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
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
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 48.0,
                            icon: Icon(
                              FFIcons.kicBack,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 30.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: StreamBuilder<MyCarsRecord>(
                        stream:
                            MyCarsRecord.getDocument(FFAppState().selectedCar!),
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
                          final columnMyCarsRecord = snapshot.data!;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 64.0,
                                      height: 64.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              widget.company?.logo,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/mq76tomaqbk1/4car.png',
                                            ),
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 0.0, 0.0, 0.0),
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
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  6.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                widget.company
                                                                    ?.name,
                                                                'null',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 6.0,
                                                            height: 6.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                functions.closedOpened(
                                                                            getCurrentTimestamp,
                                                                            valueOrDefault<int>(
                                                                              widget.company?.openTimeOrder,
                                                                              0,
                                                                            ),
                                                                            valueOrDefault<int>(
                                                                              widget.company?.closedTimeOrder,
                                                                              0,
                                                                            )) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(context).primary
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
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  4.0),
                                                      child: RatingBarIndicator(
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                          Icons.star_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                        direction:
                                                            Axis.horizontal,
                                                        rating: valueOrDefault<
                                                            double>(
                                                          functions.averageRating(
                                                              widget.company
                                                                  ?.rating
                                                                  ?.toList()),
                                                          0.0,
                                                        ),
                                                        unratedColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .starblue,
                                                        itemCount: 5,
                                                        itemSize: 14.0,
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
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final toggleIconUserRecord =
                                                        snapshot.data!;
                                                    return ToggleIcon(
                                                      onPressed: () async {
                                                        final favCompanyElement =
                                                            widget.company
                                                                ?.reference;
                                                        final favCompanyUpdate =
                                                            toggleIconUserRecord
                                                                    .favCompany
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
                                                        await toggleIconUserRecord
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'favCompany':
                                                                  favCompanyUpdate,
                                                            },
                                                          ),
                                                        });
                                                      },
                                                      value:
                                                          toggleIconUserRecord
                                                              .favCompany
                                                              .contains(widget
                                                                  .company
                                                                  ?.reference),
                                                      onIcon: Icon(
                                                        FFIcons.kicSaveee,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                      offIcon: Icon(
                                                        FFIcons
                                                            .kproperty1unsaved,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
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
                                                    widget.company?.street,
                                                    'null',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Text(
                                                  valueOrDefault<String>(
                                                    '${formatNumber(
                                                      functions
                                                          .returnDistanceBetweenTwoPoints(
                                                              currentUserLocationValue,
                                                              widget.company
                                                                  ?.location),
                                                      formatType:
                                                          FormatType.custom,
                                                      format: '',
                                                      locale: '',
                                                    )}км',
                                                    '----',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            Color(0xFF9CA3AF),
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 12.0),
                                child: FlutterFlowCalendar(
                                  color: FlutterFlowTheme.of(context).primary,
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
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).gray3,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Text(
                                  'Выбрать время',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: StreamBuilder<List<ForcarTimesRecord>>(
                                  stream: queryForcarTimesRecord(
                                    queryBuilder: (forcarTimesRecord) =>
                                        forcarTimesRecord.orderBy('time_order'),
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
                                    List<ForcarTimesRecord>
                                        wrapForcarTimesRecordList =
                                        snapshot.data!;
                                    if (wrapForcarTimesRecordList.isEmpty) {
                                      return Center(
                                        child: EmptyBookedTimeSlotWidget(),
                                      );
                                    }
                                    return Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
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
                                        return StreamBuilder<
                                            List<WorkedDayBoxRecord>>(
                                          stream: queryWorkedDayBoxRecord(
                                            parent: widget.company?.reference,
                                            queryBuilder:
                                                (workedDayBoxRecord) =>
                                                    workedDayBoxRecord.where(
                                              'date_DMY',
                                              isEqualTo: dateTimeFormat(
                                                'd/M/y',
                                                _model
                                                    .calendarSelectedDay?.start,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
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
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<WorkedDayBoxRecord>
                                                containerWorkedDayBoxRecordList =
                                                snapshot.data!;
                                            final containerWorkedDayBoxRecord =
                                                containerWorkedDayBoxRecordList
                                                        .isNotEmpty
                                                    ? containerWorkedDayBoxRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if ((functions.comparisonTime(
                                                              getCurrentTimestamp,
                                                              wrapForcarTimesRecord
                                                                  .timeOrder,
                                                              _model
                                                                  .calendarSelectedDay!
                                                                  .end) ==
                                                          true) &&
                                                      (wrapForcarTimesRecord
                                                              .timeOrder >=
                                                          widget.company!
                                                              .openTimeOrder) &&
                                                      (wrapForcarTimesRecord
                                                              .timeOrder <=
                                                          widget.company!
                                                              .closedTimeOrder) &&
                                                      !valueOrDefault<bool>(
                                                        containerWorkedDayBoxRecord !=
                                                            null,
                                                        false,
                                                      ))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  16.0),
                                                      child: StreamBuilder<
                                                          List<BookingsRecord>>(
                                                        stream:
                                                            queryBookingsRecord(
                                                          queryBuilder:
                                                              (bookingsRecord) =>
                                                                  bookingsRecord
                                                                      .where(
                                                                        'time_name',
                                                                        isEqualTo:
                                                                            wrapForcarTimesRecord.timeName,
                                                                      )
                                                                      .where(
                                                                        'time_order',
                                                                        isEqualTo:
                                                                            wrapForcarTimesRecord.timeOrder,
                                                                      )
                                                                      .where(
                                                                        'booked_date_string',
                                                                        isEqualTo:
                                                                            dateTimeFormat(
                                                                          'd/M/y',
                                                                          _model
                                                                              .calendarSelectedDay
                                                                              ?.start,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                      )
                                                                      .where(
                                                                        'booked_company',
                                                                        isEqualTo: widget
                                                                            .company
                                                                            ?.reference,
                                                                      )
                                                                      .where(
                                                                        'cancelled',
                                                                        isEqualTo:
                                                                            false,
                                                                      ),
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
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<BookingsRecord>
                                                              notBookingsRecordList =
                                                              snapshot.data!;
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (notBookingsRecordList
                                                                      .length <
                                                                  widget
                                                                      .company!
                                                                      .countBox) {
                                                                if (FFAppState()
                                                                        .selectedTimeSlot ==
                                                                    wrapForcarTimesRecord
                                                                        .reference) {
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .selectedTimeSlot =
                                                                        null;
                                                                    FFAppState()
                                                                        .price = 0;
                                                                    FFAppState()
                                                                        .selectedServices = [];
                                                                    FFAppState()
                                                                            .selectPush =
                                                                        1000;
                                                                  });
                                                                } else {
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
                                                                            wrapForcarTimesRecord.timeOrder);
                                                                  });
                                                                }
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 67.0,
                                                              height: 32.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: () {
                                                                  if (notBookingsRecordList
                                                                          .length >=
                                                                      widget
                                                                          .company!
                                                                          .countBox) {
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
                                                                border:
                                                                    Border.all(
                                                                  color: () {
                                                                    if (notBookingsRecordList
                                                                            .length >=
                                                                        widget
                                                                            .company!
                                                                            .countBox) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .gray3;
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
                                                                          .primary;
                                                                    }
                                                                  }(),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
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
                                                                          if (notBookingsRecordList.length >=
                                                                              widget
                                                                                  .company!.countBox) {
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
                                                  if ((functions.comparisonTime(
                                                              getCurrentTimestamp,
                                                              wrapForcarTimesRecord
                                                                  .timeOrder,
                                                              _model
                                                                  .calendarSelectedDay!
                                                                  .end) ==
                                                          true) &&
                                                      (wrapForcarTimesRecord
                                                              .timeOrder >=
                                                          widget.company!
                                                              .openTimeOrder) &&
                                                      (wrapForcarTimesRecord
                                                              .timeOrder <=
                                                          widget.company!
                                                              .closedTimeOrder) &&
                                                      valueOrDefault<bool>(
                                                        containerWorkedDayBoxRecord !=
                                                            null,
                                                        false,
                                                      ))
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  16.0),
                                                      child: StreamBuilder<
                                                          List<BookingsRecord>>(
                                                        stream:
                                                            queryBookingsRecord(
                                                          queryBuilder:
                                                              (bookingsRecord) =>
                                                                  bookingsRecord
                                                                      .where(
                                                                        'time_name',
                                                                        isEqualTo:
                                                                            wrapForcarTimesRecord.timeName,
                                                                      )
                                                                      .where(
                                                                        'time_order',
                                                                        isEqualTo:
                                                                            wrapForcarTimesRecord.timeOrder,
                                                                      )
                                                                      .where(
                                                                        'booked_date_string',
                                                                        isEqualTo:
                                                                            dateTimeFormat(
                                                                          'd/M/y',
                                                                          _model
                                                                              .calendarSelectedDay
                                                                              ?.start,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                      )
                                                                      .where(
                                                                        'booked_company',
                                                                        isEqualTo: widget
                                                                            .company
                                                                            ?.reference,
                                                                      )
                                                                      .where(
                                                                        'cancelled',
                                                                        isEqualTo:
                                                                            false,
                                                                      ),
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
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<BookingsRecord>
                                                              existBookingsRecordList =
                                                              snapshot.data!;
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              if (existBookingsRecordList
                                                                      .length <
                                                                  containerWorkedDayBoxRecord!
                                                                      .count) {
                                                                if (FFAppState()
                                                                        .selectedTimeSlot ==
                                                                    wrapForcarTimesRecord
                                                                        .reference) {
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .selectedTimeSlot =
                                                                        null;
                                                                    FFAppState()
                                                                        .price = 0;
                                                                    FFAppState()
                                                                        .selectedServices = [];
                                                                    FFAppState()
                                                                            .selectPush =
                                                                        1000;
                                                                  });
                                                                } else {
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
                                                                            wrapForcarTimesRecord.timeOrder);
                                                                  });
                                                                }
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 67.0,
                                                              height: 32.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: () {
                                                                  if (existBookingsRecordList
                                                                          .length >=
                                                                      containerWorkedDayBoxRecord!
                                                                          .count) {
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
                                                                border:
                                                                    Border.all(
                                                                  color: () {
                                                                    if (existBookingsRecordList
                                                                            .length >=
                                                                        containerWorkedDayBoxRecord!
                                                                            .count) {
                                                                      return FlutterFlowTheme.of(
                                                                              context)
                                                                          .gray3;
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
                                                                          .primary;
                                                                    }
                                                                  }(),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.00,
                                                                        0.00),
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
                                                                          if (existBookingsRecordList.length >=
                                                                              containerWorkedDayBoxRecord!
                                                                                  .count) {
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
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).gray3,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Выбрать авто',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
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
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: SelectCarWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                                  10.0, 0.0, 10.0, 0.0),
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
                                                      .bodyMedium,
                                                ),
                                              if (FFAppState().selectedCar !=
                                                  null)
                                                Expanded(
                                                  child: Text(
                                                    '${columnMyCarsRecord.carBody}, ${columnMyCarsRecord.carNum}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ),
                                              Icon(
                                                FFIcons.kicArrowsButtonDown,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray2,
                                                size: 24.0,
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
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Выбрать услугу',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (FFAppState().selectedTimeSlot !=
                                            null) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0x00000000),
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.8,
                                                    child: SelectServicesWidget(
                                                      company: widget
                                                          .company?.reference,
                                                      carBody:
                                                          columnMyCarsRecord
                                                              .carBody,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Выберите время для записи',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                                  10.0, 0.0, 10.0, 0.0),
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
                                                      .bodyMedium,
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
                                                              .bodyMedium,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              Icon(
                                                FFIcons.kicArrowsButtonDown,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray2,
                                                size: 24.0,
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
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Text(
                                      'Напомнить',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
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
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    SelectNotificationWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 48.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
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
                                                  10.0, 0.0, 10.0, 0.0),
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
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .red1,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              if (FFAppState().selectPush == 30)
                                                Text(
                                                  'За пол часа до записи',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              if (FFAppState().selectPush == 60)
                                                Text(
                                                  'За 1 час до записи',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              if (FFAppState().selectPush ==
                                                  120)
                                                Text(
                                                  'За 2 часа до записи ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              Icon(
                                                FFIcons.kicArrowsButtonDown,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray2,
                                                size: 24.0,
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
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Text(
                                                'Продолжительность',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                            ),
                                            if (FFAppState()
                                                    .selectedServicesDuration <=
                                                60)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  '${columnForcarTimesRecord.timeName} - ${functions.addTimeOrder(columnForcarTimesRecord.timeOrder, 1).toString()}:00',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
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
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  '${columnForcarTimesRecord.timeName} - ${functions.addTimeOrder(columnForcarTimesRecord.timeOrder, 2).toString()}:00',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
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
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  '${columnForcarTimesRecord.timeName} - ${functions.addTimeOrder(columnForcarTimesRecord.timeOrder, 3).toString()}:00',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
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
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  '${columnForcarTimesRecord.timeName} - ${functions.addTimeOrder(columnForcarTimesRecord.timeOrder, 4).toString()}:00',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 32.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFD0E1F0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Icon(
                                                  FFIcons.kicMoney,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
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
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Оплата нужно произвести после мойки авто',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Color(
                                                                      0xFFCBCACA),
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
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
                                                    0.0, 16.0, 0.0, 20.0),
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
                                                                    .timeOrder)
                                                            .toList()
                                                            .cast<int>();
                                                      });

                                                      var bookingsRecordReference =
                                                          BookingsRecord
                                                              .collection
                                                              .doc();
                                                      await bookingsRecordReference
                                                          .set({
                                                        ...createBookingsRecordData(
                                                          bookedUser:
                                                              currentUserReference,
                                                          bookedCompany: widget
                                                              .company
                                                              ?.reference,
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
                                                              widget.company
                                                                  ?.companyDocument,
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
                                                          notifyTimeName: functions
                                                              .notifyTime(
                                                                  _model
                                                                      .calendarSelectedDay!
                                                                      .end,
                                                                  columnForcarTimesRecord
                                                                      .timeOrder,
                                                                  valueOrDefault<
                                                                      int>(
                                                                    FFAppState()
                                                                        .selectPush,
                                                                    1000,
                                                                  )),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'selected_company_services':
                                                                FFAppState()
                                                                    .selectedServices,
                                                            'selected_times_order':
                                                                FFAppState()
                                                                    .bookedTimes,
                                                            'selected_company_services_name':
                                                                FFAppState()
                                                                    .bookingSelectedServicesName,
                                                          },
                                                        ),
                                                      });
                                                      _model.booking =
                                                          BookingsRecord
                                                              .getDocumentFromData({
                                                        ...createBookingsRecordData(
                                                          bookedUser:
                                                              currentUserReference,
                                                          bookedCompany: widget
                                                              .company
                                                              ?.reference,
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
                                                              widget.company
                                                                  ?.companyDocument,
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
                                                          notifyTimeName: functions
                                                              .notifyTime(
                                                                  _model
                                                                      .calendarSelectedDay!
                                                                      .end,
                                                                  columnForcarTimesRecord
                                                                      .timeOrder,
                                                                  valueOrDefault<
                                                                      int>(
                                                                    FFAppState()
                                                                        .selectPush,
                                                                    1000,
                                                                  )),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'selected_company_services':
                                                                FFAppState()
                                                                    .selectedServices,
                                                            'selected_times_order':
                                                                FFAppState()
                                                                    .bookedTimes,
                                                            'selected_company_services_name':
                                                                FFAppState()
                                                                    .bookingSelectedServicesName,
                                                          },
                                                        ),
                                                      }, bookingsRecordReference);
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'containerOnActionTriggerAnimation']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }

                                                      await CompanyNotificationsRecord
                                                              .createDoc(widget
                                                                  .company!
                                                                  .reference)
                                                          .set(
                                                              createCompanyNotificationsRecordData(
                                                        message:
                                                            'Новая запись: ${_model.booking?.carBody}, ${_model.booking?.carName}, ${_model.booking?.timeName}',
                                                        date:
                                                            getCurrentTimestamp,
                                                        opened: false,
                                                        bookingRef: _model
                                                            .booking?.reference,
                                                        type: 'new_booking',
                                                      ));
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
                                                      height: 48.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
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
                                      0.0, 16.0, 0.0, 20.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: 'Записаться',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).starblue,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            fontSize: 16.0,
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
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x64000000),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: Container(
                      width: 192.0,
                      height: 176.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Icon(
                                FFIcons.kcheeek,
                                color: Colors.white,
                                size: 44.0,
                              ),
                            ),
                          ),
                          Text(
                            'Вы успешно\nзаписались!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
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

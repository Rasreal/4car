import '../backend/backend.dart';
import '../components/booking_cancellation_widget.dart';
import '../components/company_card_widget.dart';
import '../components/sucsess_booking_review_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'current_booking_record_model.dart';
export 'current_booking_record_model.dart';

class CurrentBookingRecordWidget extends StatefulWidget {
  const CurrentBookingRecordWidget({
    Key? key,
    this.booking,
  }) : super(key: key);

  final DocumentReference? booking;

  @override
  _CurrentBookingRecordWidgetState createState() =>
      _CurrentBookingRecordWidgetState();
}

class _CurrentBookingRecordWidgetState extends State<CurrentBookingRecordWidget>
    with TickerProviderStateMixin {
  late CurrentBookingRecordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
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
    _model = createModel(context, () => CurrentBookingRecordModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (_model.canceled!) {
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          await animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0);
        }
      }
    });

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: FutureBuilder<BookingsRecord>(
            future: BookingsRecord.getDocumentOnce(widget.booking!),
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
              final stackBookingsRecord = snapshot.data!;
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                FFIcons.kicBack,
                                color:
                                FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                context.goNamed('My_notes');
                              },
                            ),
                            Text(
                              'Данные о записи',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap()
                                    .containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
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
                        Expanded(
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Запись №${stackBookingsRecord.id}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Color(0xFF9CA3AF),
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                      ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        dateTimeFormat(
                                          'yMMMd',
                                          stackBookingsRecord.bookedDate,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                        fontFamily:
                                        FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Color(0xFF9CA3AF),
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).gray4,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 14, 0, 0),
                                    child: StreamBuilder<CompaniesRecord>(
                                      stream: CompaniesRecord.getDocument(
                                          stackBookingsRecord.bookedCompany!),
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
                                        final companyCardCompaniesRecord =
                                        snapshot.data!;
                                        return wrapWithModel(
                                          model: _model.companyCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: CompanyCardWidget(
                                            company: companyCardCompaniesRecord,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Text(
                                    'Детали',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily:
                                      FlutterFlowTheme.of(context)
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Время записи',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .bodyText1Family,
                                          color:
                                          FlutterFlowTheme.of(context)
                                              .gray2,
                                          useGoogleFonts:
                                          GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodyText1Family),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          stackBookingsRecord.timeName,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .bodyText1Family,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                          GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodyText1Family),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).gray4,
                                ),
                                Text(
                                  'Услуги',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                                Builder(
                                  builder: (context) {
                                    final services = stackBookingsRecord
                                        .selectedCompanyServices!
                                        .toList();
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: services.length,
                                      itemBuilder: (context, servicesIndex) {
                                        final servicesItem =
                                        services[servicesIndex];
                                        return Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 8, 0, 8),
                                          child: StreamBuilder<
                                              CompanyServicesRecord>(
                                            stream: CompanyServicesRecord
                                                .getDocument(servicesItem),
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
                                              final rowCompanyServicesRecord =
                                              snapshot.data!;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text(
                                                    rowCompanyServicesRecord
                                                        .name!,
                                                    style: FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText1Family,
                                                      color: FlutterFlowTheme
                                                          .of(context)
                                                          .gray2,
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
                                                      '${rowCompanyServicesRecord.price?.toString()} ₸',
                                                      '0 ₸',
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
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Общая стоимость',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        '${valueOrDefault<String>(
                                          stackBookingsRecord.totalPrice
                                              ?.toString(),
                                          '-',
                                        )} ₸',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .bodyText1Family,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                          GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodyText1Family),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 20,
                                  thickness: 1,
                                  color: FlutterFlowTheme.of(context).gray4,
                                ),
                                Text(
                                  'Автомобиль',
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Автомобиль ${valueOrDefault<String>(
                                          stackBookingsRecord.carOrder
                                              ?.toString(),
                                          '-',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          '${stackBookingsRecord.carBody}, ${stackBookingsRecord.carName}',
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily:
                                          FlutterFlowTheme.of(context)
                                              .bodyText1Family,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts:
                                          GoogleFonts.asMap()
                                              .containsKey(
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .bodyText1Family),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (stackBookingsRecord.status == 'Завершено')
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 10),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                              Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                  MediaQuery.of(context)
                                                      .viewInsets,
                                                  child:
                                                  SucsessBookingReviewWidget(
                                                    booking: widget.booking,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          text: 'Пожаловаться',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle:
                                            FlutterFlowTheme.of(context)
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
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .subtitle2Family),
                                            ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                              width: 1,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if ((stackBookingsRecord.status ==
                                    'Забронировано') &&
                                    !stackBookingsRecord.cancelled!)
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 1),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 10),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                              Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                  MediaQuery.of(context)
                                                      .viewInsets,
                                                  child:
                                                  BookingCancellationWidget(
                                                    booking:
                                                    stackBookingsRecord,
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(
                                                    () => _model.canceled = value));

                                            setState(() {});
                                          },
                                          text: 'Отменить запись',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 48,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            textStyle:
                                            FlutterFlowTheme.of(context)
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
                                              useGoogleFonts: GoogleFonts
                                                  .asMap()
                                                  .containsKey(
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .subtitle2Family),
                                            ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                              width: 1,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
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
                  ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x67000000),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: 206,
                          height: 178,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20,
                                buttonSize: 60,
                                fillColor:
                                FlutterFlowTheme.of(context).primaryColor,
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'Ваша запись\nотменена!',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                        FlutterFlowTheme.of(context)
                                            .bodyText1Family),
                                  ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}

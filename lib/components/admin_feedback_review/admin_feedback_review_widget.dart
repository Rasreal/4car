import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_feedback_review_model.dart';
export 'admin_feedback_review_model.dart';

class AdminFeedbackReviewWidget extends StatefulWidget {
  const AdminFeedbackReviewWidget({
    Key? key,
    this.booking,
  }) : super(key: key);

  final BookingsRecord? booking;

  @override
  _AdminFeedbackReviewWidgetState createState() =>
      _AdminFeedbackReviewWidgetState();
}

class _AdminFeedbackReviewWidgetState extends State<AdminFeedbackReviewWidget> {
  late AdminFeedbackReviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminFeedbackReviewModel());

    _model.textController ??= TextEditingController();
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
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                child: FutureBuilder<UserRecord>(
                  future:
                      UserRecord.getDocumentOnce(widget.booking!.bookedUser!),
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
                    final rowUserRecord = snapshot.data!;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              valueOrDefault<String>(
                                rowUserRecord.photoUrl,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                              ),
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                rowUserRecord.displayName!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  rowUserRecord.phoneNumber!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Inter',
                                        color:
                                            FlutterFlowTheme.of(context).gray2,
                                        fontWeight: FontWeight.normal,
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
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            FFIcons.kicClose,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 38,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).gray4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                              child: InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().adminClientsTypeReview =
                                        'Детали операции';
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 17),
                                      child: Text(
                                        'Детали операции',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Inter',
                                              color: FFAppState()
                                                          .adminClientsTypeReview ==
                                                      'Детали операции'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .webUnselectedColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 138,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: FFAppState()
                                                    .adminClientsTypeReview ==
                                                'Детали операции'
                                            ? FlutterFlowTheme.of(context)
                                                .primaryColor
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                              child: InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().adminClientsTypeReview =
                                        'Отзыв клиента';
                                  });
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 17),
                                      child: Text(
                                        'Отзыв клиента',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Inter',
                                              color: FFAppState()
                                                          .adminClientsTypeReview ==
                                                      'Отзыв клиента'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .webUnselectedColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                    ),
                                    Container(
                                      width: 117,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: FFAppState()
                                                    .adminClientsTypeReview ==
                                                'Отзыв клиента'
                                            ? FlutterFlowTheme.of(context)
                                                .primaryColor
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (valueOrDefault(currentUserDocument?.role, '') ==
                                'Супер Админ')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    onTap: () async {
                                      FFAppState().update(() {
                                        FFAppState().adminClientsTypeReview =
                                            'Детали компании';
                                      });
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 17),
                                          child: Text(
                                            'Детали компании',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FFAppState()
                                                              .adminClientsTypeReview ==
                                                          'Детали компании'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .webUnselectedColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                        Container(
                                          width: 139,
                                          height: 1,
                                          decoration: BoxDecoration(
                                            color: FFAppState()
                                                        .adminClientsTypeReview ==
                                                    'Детали компании'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryColor
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (FFAppState().adminClientsTypeReview == 'Детали компании')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 32, 24, 0),
                  child: StreamBuilder<CompaniesRecord>(
                    stream: CompaniesRecord.getDocument(
                        widget.booking!.bookedCompany!),
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
                      final detailsCompanyCompaniesRecord = snapshot.data!;
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    '№Компании',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${valueOrDefault<String>(
                                      detailsCompanyCompaniesRecord.numDogovor,
                                      'null',
                                    )}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
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
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).gray4,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Название компании',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    valueOrDefault<String>(
                                      detailsCompanyCompaniesRecord.name,
                                      'null',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
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
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).gray4,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Всего точек',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '1',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
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
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).gray4,
                          ),
                          StreamBuilder<List<BookingsRecord>>(
                            stream: queryBookingsRecord(
                              queryBuilder: (bookingsRecord) =>
                                  bookingsRecord.where('booked_company',
                                      isEqualTo: detailsCompanyCompaniesRecord
                                          .reference),
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
                              List<BookingsRecord> containerBookingsRecordList =
                                  snapshot.data!;
                              return Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 16, 0, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Средний чек',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
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
                                          ),
                                          Expanded(
                                            child: Text(
                                              valueOrDefault<String>(
                                                functions.averageCheque(
                                                    containerBookingsRecordList
                                                        .toList()),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
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
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1,
                                      thickness: 1,
                                      color: FlutterFlowTheme.of(context).gray4,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 16, 0, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Оборот',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
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
                                          ),
                                          Expanded(
                                            child: Text(
                                              valueOrDefault<String>(
                                                functions
                                                    .oborot(
                                                        containerBookingsRecordList
                                                            .toList())
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).gray4,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Услуги',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: StreamBuilder<
                                      List<CompanyServicesRecord>>(
                                    stream: queryCompanyServicesRecord(
                                      parent: detailsCompanyCompaniesRecord
                                          .reference,
                                      queryBuilder: (companyServicesRecord) =>
                                          companyServicesRecord.where(
                                              'car_body',
                                              isEqualTo: 'Седан'),
                                    ),
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
                                      List<CompanyServicesRecord>
                                          containerCompanyServicesRecordList =
                                          snapshot.data!;
                                      return Container(
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          valueOrDefault<String>(
                                            functions.listStringToString(
                                                containerCompanyServicesRecordList
                                                    .map((e) => e.name)
                                                    .withoutNulls
                                                    .toList(),
                                                500),
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1Family),
                                              ),
                                        ),
                                      );
                                    },
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
              if (FFAppState().adminClientsTypeReview == 'Детали операции')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 32, 24, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                '№Заказа',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '№${valueOrDefault<String>(
                                  widget.booking!.id,
                                  'null',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
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
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).gray4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Время записи',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${valueOrDefault<String>(
                                  widget.booking!.timeName,
                                  'null',
                                )}, ${valueOrDefault<String>(
                                  dateTimeFormat(
                                    'd/M/y',
                                    widget.booking!.bookedDate,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  'null',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
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
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).gray4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Продолжительность',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${valueOrDefault<String>(
                                  widget.booking!.duration?.toString(),
                                  'null',
                                )} минут',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
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
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).gray4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                '№Бокса',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Бокс №${valueOrDefault<String>(
                                  widget.booking!.boxName,
                                  'null',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
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
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).gray4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Автомобиль',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${valueOrDefault<String>(
                                  widget.booking!.carBody,
                                  'null',
                                )}, ${valueOrDefault<String>(
                                  widget.booking!.carName,
                                  'null',
                                )}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
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
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).gray4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Услуги',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  functions.listStringToString(
                                      widget
                                          .booking!.selectedCompanyServicesName!
                                          .toList(),
                                      50),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
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
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).gray4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                'Стоимость',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '${valueOrDefault<String>(
                                  widget.booking!.totalPrice?.toString(),
                                  'null',
                                )} тг',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
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
                    ],
                  ),
                ),
              if (FFAppState().adminClientsTypeReview == 'Отзыв клиента')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
                  child: StreamBuilder<List<CommentsRecord>>(
                    stream: queryCommentsRecord(
                      parent: widget.booking!.bookedCompany,
                      queryBuilder: (commentsRecord) => commentsRecord
                          .where('created_by',
                              isEqualTo: widget.booking!.bookedUser)
                          .where('bookingDoc',
                              isEqualTo: widget.booking!.reference),
                      singleRecord: true,
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
                      List<CommentsRecord> columnCommentsRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final columnCommentsRecord =
                          columnCommentsRecordList.isNotEmpty
                              ? columnCommentsRecordList.first
                              : null;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Оценка',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 14, 0, 24),
                            child: RatingBarIndicator(
                              itemBuilder: (context, index) => Icon(
                                Icons.star_rounded,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                              direction: Axis.horizontal,
                              rating: valueOrDefault<double>(
                                columnCommentsRecord!.rating,
                                0.0,
                              ),
                              unratedColor:
                                  FlutterFlowTheme.of(context).starblue,
                              itemCount: 5,
                              itemSize: 20,
                            ),
                          ),
                          Text(
                            'Отзыв',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: Text(
                                  valueOrDefault<String>(
                                    columnCommentsRecord!.comment,
                                    'null',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 21, 0, 0),
                            child: Text(
                              'Ответить ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: TextFormField(
                                controller: _model.textController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Написать ответ...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText2Family),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).gray3,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                maxLines: 2,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.textController.text != null &&
                                    _model.textController.text != '') {
                                  final commentsUpdateData1 =
                                      createCommentsRecordData(
                                    responseComment: _model.textController.text,
                                    booleanResponse: true,
                                    obtobotan: true,
                                    obrobotanFilter: 'Обработан',
                                  );
                                  await columnCommentsRecord!.reference
                                      .update(commentsUpdateData1);
                                } else {
                                  final commentsUpdateData2 =
                                      createCommentsRecordData(
                                    responseComment: _model.textController.text,
                                    booleanResponse: true,
                                  );
                                  await columnCommentsRecord!.reference
                                      .update(commentsUpdateData2);
                                }
                              },
                              text: 'Опубликовать',
                              options: FFButtonOptions(
                                width: 142,
                                height: 40,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family),
                                    ),
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
      ),
    );
  }
}

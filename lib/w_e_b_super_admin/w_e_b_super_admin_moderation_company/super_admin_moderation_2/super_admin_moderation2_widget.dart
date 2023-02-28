import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/components/super_admin_app_bar/super_admin_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'super_admin_moderation2_model.dart';
export 'super_admin_moderation2_model.dart';

class SuperAdminModeration2Widget extends StatefulWidget {
  const SuperAdminModeration2Widget({
    Key? key,
    this.company,
  }) : super(key: key);

  final DocumentReference? company;

  @override
  _SuperAdminModeration2WidgetState createState() =>
      _SuperAdminModeration2WidgetState();
}

class _SuperAdminModeration2WidgetState
    extends State<SuperAdminModeration2Widget> {
  late SuperAdminModeration2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuperAdminModeration2Model());

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
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  wrapWithModel(
                    model: _model.superAdminAppBarModel,
                    updateCallback: () => setState(() {}),
                    child: SuperAdminAppBarWidget(
                      page: 'Главная',
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 120),
                                      child: Container(
                                        width: 1224,
                                        decoration: BoxDecoration(),
                                        child: FutureBuilder<CompaniesRecord>(
                                          future:
                                              CompaniesRecord.getDocumentOnce(
                                                  widget.company!),
                                          builder: (context, snapshot) {
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
                                            final columnCompaniesRecord =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 32, 0, 32),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Модерация',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 24,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .superAdminCencelledModeration =
                                                                true;
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          1,
                                                                          6,
                                                                          0),
                                                              child: Icon(
                                                                FFIcons
                                                                    .kicClose,
                                                                color: Color(
                                                                    0xFF1A1A1A),
                                                                size: 16,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Отменить',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0xFF1A1A1A),
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
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      100),
                                                          child: Container(
                                                            width: 392,
                                                            height: 468,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          24,
                                                                          24,
                                                                          24),
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
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              56,
                                                                          height:
                                                                              56,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  columnCompaniesRecord.logo,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                                                                ),
                                                                              ).image,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).starblue,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12,
                                                                              0,
                                                                              40,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  columnCompaniesRecord.name,
                                                                                  'null',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 18,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    columnCompaniesRecord.street,
                                                                                    'null',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).gray1,
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
                                                                  Divider(
                                                                    height: 1,
                                                                    thickness:
                                                                        1,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .gray4,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            24,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      'Процент',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                16,
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
                                                                            16,
                                                                            0,
                                                                            0),
                                                                    child: Wrap(
                                                                      spacing:
                                                                          0,
                                                                      runSpacing:
                                                                          16,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 3.0) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 3.0;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '3,0%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 3.0 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 3.0 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.9) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.9;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,9%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.9 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.9 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.8) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.8;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,8%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.8 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.8 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.7) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.7;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,7%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.7 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.7 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.6) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.6;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,6%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.6 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.6 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.5) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.5;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,5%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.5 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.5 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.4) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.4;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,4%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.4 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.4 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.3) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.3;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,3%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.3 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.3 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.2) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.2;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,2%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.2 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.2 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.1) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.1;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,1%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.1 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.1 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 2.0) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 2.0;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '2,0%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 2.0 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 2.0 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.9) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.9;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,9%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.9 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.9 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.8) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.8;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,8%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.8 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.8 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.7) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.7;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,7%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.7 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.7 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.6) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.6;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,6%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.6 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.6 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.5) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.5;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,5%',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.5 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.5 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.4) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.4;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,4 %',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.4 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.4 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.5) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.3;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,3 % ',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.3 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.3 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.5) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.2;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,2 %',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.2 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.2 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.5) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.1;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,1 %',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.1 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.1 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              24,
                                                                              0),
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (FFAppState().superAdminSelectPercent != 1.5) {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 1.0;
                                                                                });
                                                                              } else {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().superAdminSelectPercent = 0.0;
                                                                                });
                                                                              }
                                                                            },
                                                                            text:
                                                                                '1,0 %',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 61,
                                                                              height: 32,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                                                              color: FFAppState().superAdminSelectPercent == 1.0 ? FlutterFlowTheme.of(context).primaryColor : FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FFAppState().superAdminSelectPercent == 1.0 ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).primaryColor,
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                              elevation: 0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
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
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                width: 496,
                                                                height: 144,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          24,
                                                                          24,
                                                                          24),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Определите комиссию на операции.',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w500,
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
                                                                          'Выберите процент который будет сниматься на каждой операции.',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 16,
                                  color: Color(0x24DEDEDE),
                                  offset: Offset(0, -4),
                                )
                              ],
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Container(
                                width: 1224,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 24,
                                                height: 24,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .green,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .green,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Icon(
                                                    FFIcons.kcheeek,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 8, 0),
                                                child: Text(
                                                  'Основная информация',
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
                                                                .text3,
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
                                              Container(
                                                width: 40,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEDEDED),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '2',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
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
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 0),
                                                  child: Text(
                                                    'Установка процента',
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
                                                              .primaryColor,
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
                                                ),
                                                Container(
                                                  width: 40,
                                                  height: 1,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEDEDED),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .text3,
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Text(
                                                      '3',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text3,
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
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 8, 0),
                                                  child: Text(
                                                    'Подтверждение',
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
                                                              .text3,
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (FFAppState()
                                                .superAdminSelectPercent !=
                                            null) {
                                          final companiesUpdateData =
                                              createCompaniesRecordData(
                                            forCarPercent: FFAppState()
                                                .superAdminSelectPercent,
                                          );
                                          await widget.company!
                                              .update(companiesUpdateData);

                                          context.pushNamed(
                                            'super_admin_moderation_3',
                                            queryParams: {
                                              'company': serializeParam(
                                                widget.company,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }
                                      },
                                      text: 'Продолжить',
                                      options: FFButtonOptions(
                                        width: 131,
                                        height: 40,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0, 0, 0, 0),
                                        color: FFAppState()
                                                    .superAdminSelectPercent !=
                                                null
                                            ? FlutterFlowTheme.of(context)
                                                .primaryColor
                                            : FlutterFlowTheme.of(context)
                                                .starblue,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Inter',
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (FFAppState().superAdminCencelledModeration)
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: InkWell(
                    onTap: () async {
                      FFAppState().update(() {
                        FFAppState().superAdminCencelledModeration = false;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x67272727),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: 392,
                          height: 150,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Вы хотите отменить модерацию?',
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 32, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 24, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().update(() {
                                                FFAppState()
                                                        .superAdminCencelledModeration =
                                                    false;
                                              });

                                              context.pushNamed(
                                                  'super_admin_main');
                                            },
                                            text: 'Да',
                                            options: FFButtonOptions(
                                              width: 160,
                                              height: 48,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle2
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
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
                                      Align(
                                        alignment: AlignmentDirectional(1, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            FFAppState().update(() {
                                              FFAppState()
                                                      .superAdminCencelledModeration =
                                                  false;
                                            });
                                          },
                                          text: 'Нет',
                                          options: FFButtonOptions(
                                            width: 160,
                                            height: 48,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2Family),
                                                    ),
                                            elevation: 0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: wrapWithModel(
                  model: _model.adminAppBarInfoModel,
                  updateCallback: () => setState(() {}),
                  child: AdminAppBarInfoWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

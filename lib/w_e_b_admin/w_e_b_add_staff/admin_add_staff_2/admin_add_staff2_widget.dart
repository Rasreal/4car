import '/backend/backend.dart';
import '/components/admin_app_bar/admin_app_bar_widget.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_add_staff2_model.dart';
export 'admin_add_staff2_model.dart';

class AdminAddStaff2Widget extends StatefulWidget {
  const AdminAddStaff2Widget({
    Key? key,
    this.email,
    this.password,
    this.password2,
    this.companyDocument,
  }) : super(key: key);

  final String? email;
  final String? password;
  final String? password2;
  final CompanyDocumentRecord? companyDocument;

  @override
  _AdminAddStaff2WidgetState createState() => _AdminAddStaff2WidgetState();
}

class _AdminAddStaff2WidgetState extends State<AdminAddStaff2Widget> {
  late AdminAddStaff2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAddStaff2Model());

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
                    model: _model.adminAppBarModel,
                    updateCallback: () => setState(() {}),
                    child: AdminAppBarWidget(
                      pageName: 'Главная',
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 1224,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 32, 0, 32),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Добавление сотрудника',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 24,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 1, 6, 0),
                                          child: Icon(
                                            FFIcons.kicClose,
                                            color: Color(0xFF1A1A1A),
                                            size: 16,
                                          ),
                                        ),
                                        Text(
                                          'Отменить',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF1A1A1A),
                                                fontWeight: FontWeight.w500,
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 496,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 0, 24, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 24, 0, 0),
                                            child: Text(
                                              'Уровень доступа',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 20,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 24, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                FFAppState().update(() {
                                                  FFAppState().adminAddStaff =
                                                      'Менеджер';
                                                });
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 2, 16, 0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 0,
                                                      shape:
                                                          const CircleBorder(),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .adminAddStaff ==
                                                                    'Менеджер'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray2,
                                                            width: 0,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 8,
                                                              height: 8,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FFAppState()
                                                                            .adminAddStaff ==
                                                                        'Менеджер'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 16),
                                                        child: Text(
                                                          'Менеджер',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      ),
                                                      Text(
                                                        'Просмотр новых записей',
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
                                                                      .gray1,
                                                                  fontSize: 16,
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
                                                                    0, 8, 0, 0),
                                                        child: Text(
                                                          'Добавление записей',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray1,
                                                                fontSize: 16,
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
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 24, 0, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                FFAppState().update(() {
                                                  FFAppState().adminAddStaff =
                                                      'Администратор';
                                                });
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 2, 16, 0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 0,
                                                      shape:
                                                          const CircleBorder(),
                                                      child: Container(
                                                        width: 18,
                                                        height: 18,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .adminAddStaff ==
                                                                    'Администратор'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray2,
                                                            width: 0,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 0,
                                                            shape:
                                                                const CircleBorder(),
                                                            child: Container(
                                                              width: 8,
                                                              height: 8,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FFAppState()
                                                                            .adminAddStaff ==
                                                                        'Администратор'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    0, 16),
                                                        child: Text(
                                                          'Администратор',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      ),
                                                      Text(
                                                        'Просмотр новых записей',
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
                                                                      .gray1,
                                                                  fontSize: 16,
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
                                                                    0, 8, 0, 0),
                                                        child: Text(
                                                          'Добавление записей',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray1,
                                                                fontSize: 16,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: Text(
                                                          'Просмотр отчетов',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray1,
                                                                fontSize: 16,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: Text(
                                                          'Ответы на отзывы',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray1,
                                                                fontSize: 16,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: Text(
                                                          'Доступ к базе данных клиентов',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray1,
                                                                fontSize: 16,
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 0, 0),
                                                        child: Text(
                                                          'Добавление акций',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray1,
                                                                fontSize: 16,
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
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 24, 0, 53),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 2, 16, 0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    shape: const CircleBorder(),
                                                    child: Container(
                                                      width: 18,
                                                      height: 18,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FFAppState()
                                                                      .adminAddStaff ==
                                                                  'Руководитель'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryColor
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .gray2,
                                                          width: 0,
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 0,
                                                          shape:
                                                              const CircleBorder(),
                                                          child: Container(
                                                            width: 8,
                                                            height: 8,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FFAppState()
                                                                          .adminAddStaff ==
                                                                      'Руководитель'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                                                                  0, 0, 0, 16),
                                                      child: Text(
                                                        'Руководитель',
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
                                                    ),
                                                    Text(
                                                      'Доступ ко всему функционалу',
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
                                                                    .gray1,
                                                                fontSize: 16,
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
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 0, 0),
                                    child: Container(
                                      width: 496,
                                      height: 278,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 0, 24, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 24, 0, 0),
                                              child: Text(
                                                'Выберите уровень доступа',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 18,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 16, 0, 0),
                                              child: Text(
                                                'Выберите роль для нового сотрудника, доступный фунционал написан ниже.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
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
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).green,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .green,
                                          width: 2,
                                        ),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          FFIcons.kcheeek,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: Text(
                                        'Основные данные',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
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
                                      width: 40,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEDEDED),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            '2',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Text(
                                          'Уровень доступа',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFF515151),
                                            width: 2,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            '3',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF515151),
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                        child: Text(
                                          'Подтверждение',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF515151),
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
                                        width: 40,
                                        height: 1,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEDEDED),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'admin_add_staff_3',
                                      queryParams: {
                                        'email': serializeParam(
                                          widget.email,
                                          ParamType.String,
                                        ),
                                        'password': serializeParam(
                                          widget.password,
                                          ParamType.String,
                                        ),
                                        'password1': serializeParam(
                                          widget.password2,
                                          ParamType.String,
                                        ),
                                        'companyDocument': serializeParam(
                                          widget.companyDocument,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'companyDocument':
                                            widget.companyDocument,
                                      },
                                    );
                                  },
                                  text: 'Продолжить',
                                  options: FFButtonOptions(
                                    width: 185,
                                    height: 48,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Inter',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.adminAppBarInfoModel,
                updateCallback: () => setState(() {}),
                child: AdminAppBarInfoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

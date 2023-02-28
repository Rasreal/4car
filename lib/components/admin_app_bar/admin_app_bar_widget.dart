import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_app_bar_model.dart';
export 'admin_app_bar_model.dart';

class AdminAppBarWidget extends StatefulWidget {
  const AdminAppBarWidget({
    Key? key,
    this.pageName,
  }) : super(key: key);

  final String? pageName;

  @override
  _AdminAppBarWidgetState createState() => _AdminAppBarWidgetState();
}

class _AdminAppBarWidgetState extends State<AdminAppBarWidget> {
  late AdminAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAppBarModel());

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

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: 1224,
              height: 120,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 1224,
                    height: 71,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            '4 Car',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 25,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<CompaniesRecord>>(
                              stream: queryCompaniesRecord(
                                queryBuilder: (companiesRecord) =>
                                    companiesRecord.where('company_users',
                                        arrayContains: currentUserReference),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<CompaniesRecord>
                                    columnCompaniesRecordList = snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final columnCompaniesRecord =
                                    columnCompaniesRecordList.isNotEmpty
                                        ? columnCompaniesRecordList.first
                                        : null;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 16, 0),
                                      child: FutureBuilder<int>(
                                        future:
                                            queryCompanyNotificationsRecordCount(
                                          parent:
                                              columnCompaniesRecord!.reference,
                                          queryBuilder:
                                              (companyNotificationsRecord) =>
                                                  companyNotificationsRecord
                                                      .where('opened',
                                                          isEqualTo: true),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          int stackCount = snapshot.data!;
                                          return Container(
                                            width: 30,
                                            height: 30,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 16, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        if (FFAppState()
                                                                .adminAppBar ==
                                                            'notify') {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                .adminAppBar = '';
                                                          });
                                                        } else {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .adminAppBar =
                                                                'notify';
                                                          });
                                                        }
                                                      },
                                                      child: Icon(
                                                        FFIcons.kicNotification,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if (stackCount >= 1)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1, -1),
                                                    child: Container(
                                                      width: 10,
                                                      height: 10,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .red1,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            InkWell(
                              onTap: () async {
                                if (FFAppState().adminAppBar == 'profile') {
                                  FFAppState().update(() {
                                    FFAppState().adminAppBar = '';
                                  });
                                } else {
                                  FFAppState().update(() {
                                    FFAppState().adminAppBar = 'profile';
                                  });
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 8, 0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: 40,
                                        height: 40,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            currentUserPhoto,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 8, 0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<String>(
                                          currentUserDisplayName,
                                          'Имя не указано',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Inter',
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
                                  ),
                                  Icon(
                                    FFIcons.kicArrowsButtonDown,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1224,
                    height: 47,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 48, 0),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'admin_main',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Text(
                              'Главная',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.pageName == 'Главная'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                        if (valueOrDefault(currentUserDocument?.role, '') !=
                            'Менеджер')
                          AuthUserStreamWidget(
                            builder: (context) => Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 48, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'admin_reports',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Отчеты',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: widget.pageName == 'Отчеты'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryColor
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 48, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'admin_clients',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Клиенты',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: widget.pageName == 'Клиенты'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryColor
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                ),
                                if (valueOrDefault(
                                        currentUserDocument?.role, '') !=
                                    'Администратор')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 48, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'admin_analytics',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      },
                                      child: Text(
                                        'Аналитика',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Inter',
                                              color: widget.pageName ==
                                                      'Аналитика'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryColor
                                                  : FlutterFlowTheme.of(context)
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
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 48, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'admin_office',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Кабинет',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Inter',
                                            color: widget.pageName == 'Кабинет'
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryColor
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
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
                ],
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 1,
                height: 71,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: FlutterFlowTheme.of(context).drawer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ADMIN_APP_BAR_COMP_Icon_m0cs4xw3_ON_TAP');
                                  if (FFAppState().adminAppBar == 'notify') {
                                    logFirebaseEvent('Icon_update_local_state');
                                    FFAppState().update(() {
                                      FFAppState().adminAppBar = '';
                                    });
                                  } else {
                                    logFirebaseEvent('Icon_update_local_state');
                                    FFAppState().update(() {
                                      FFAppState().adminAppBar = 'notify';
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
                            InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'ADMIN_APP_BAR_COMP_Row_95xknc7v_ON_TAP');
                                if (FFAppState().adminAppBar == 'profile') {
                                  logFirebaseEvent('Row_update_local_state');
                                  FFAppState().update(() {
                                    FFAppState().adminAppBar = '';
                                  });
                                } else {
                                  logFirebaseEvent('Row_update_local_state');
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
                              logFirebaseEvent(
                                  'ADMIN_APP_BAR_COMP_Text_ht8b6ew9_ON_TAP');
                              logFirebaseEvent('Text_navigate_to');

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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 48, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADMIN_APP_BAR_COMP_Text_kobz919w_ON_TAP');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed(
                                'admin_reports',
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 48, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADMIN_APP_BAR_COMP_Text_q7mm8igr_ON_TAP');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed(
                                'admin_clients',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 48, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADMIN_APP_BAR_COMP_Text_5vh9vr6e_ON_TAP');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed(
                                'admin_analytics',
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
                              'Аналитика',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Inter',
                                    color: widget.pageName == 'Аналитика'
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 48, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADMIN_APP_BAR_COMP_Text_wvy5lwlf_ON_TAP');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed(
                                'admin_office',
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

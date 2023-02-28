import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'w_e_b_filter_company_status_model.dart';
export 'w_e_b_filter_company_status_model.dart';

class WEBFilterCompanyStatusWidget extends StatefulWidget {
  const WEBFilterCompanyStatusWidget({Key? key}) : super(key: key);

  @override
  _WEBFilterCompanyStatusWidgetState createState() =>
      _WEBFilterCompanyStatusWidgetState();
}

class _WEBFilterCompanyStatusWidgetState
    extends State<WEBFilterCompanyStatusWidget> {
  late WEBFilterCompanyStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WEBFilterCompanyStatusModel());

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
        width: 461,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(1, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1, 0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        FFIcons.kicClose,
                        color: FlutterFlowTheme.of(context).gray2,
                        size: 24,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 16),
              child: InkWell(
                onTap: () async {
                  if (FFAppState().WEBFilterCompanyStatus != null &&
                      FFAppState().WEBFilterCompanyStatus != '') {
                    setState(() {
                      FFAppState().WEBFilterCompanyStatus = '';
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        if (FFAppState().WEBFilterCompanyStatus == null ||
                            FFAppState().WEBFilterCompanyStatus == '')
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Icon(
                              FFIcons.kcheeek,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        if (FFAppState().WEBFilterCompanyStatus != null &&
                            FFAppState().WEBFilterCompanyStatus != '')
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Color(0xFFB1B1B1),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Text(
                        'Все',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 16),
              child: InkWell(
                onTap: () async {
                  if (FFAppState().WEBFilterCompanyStatus == 'Активно') {
                    setState(() {
                      FFAppState().WEBFilterCompanyStatus = '';
                    });
                  } else {
                    setState(() {
                      FFAppState().WEBFilterCompanyStatus = 'Активно';
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        if (FFAppState().WEBFilterCompanyStatus == 'Активно')
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Icon(
                              FFIcons.kcheeek,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        if (FFAppState().WEBFilterCompanyStatus != 'Активно')
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Color(0xFFB1B1B1),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Text(
                        'Активно',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 16),
              child: InkWell(
                onTap: () async {
                  if (FFAppState().WEBFilterCompanyStatus == 'Не активно') {
                    setState(() {
                      FFAppState().WEBFilterCompanyStatus = '';
                    });
                  } else {
                    setState(() {
                      FFAppState().WEBFilterCompanyStatus = 'Не активно';
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        if (FFAppState().WEBFilterCompanyStatus == 'Не активно')
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Icon(
                              FFIcons.kcheeek,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        if (FFAppState().WEBFilterCompanyStatus != 'Не активно')
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: Color(0xFFB1B1B1),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Text(
                        'Не активно',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
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
    );
  }
}

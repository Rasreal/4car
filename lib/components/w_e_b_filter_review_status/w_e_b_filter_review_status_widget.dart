import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'w_e_b_filter_review_status_model.dart';
export 'w_e_b_filter_review_status_model.dart';

class WEBFilterReviewStatusWidget extends StatefulWidget {
  const WEBFilterReviewStatusWidget({Key? key}) : super(key: key);

  @override
  _WEBFilterReviewStatusWidgetState createState() =>
      _WEBFilterReviewStatusWidgetState();
}

class _WEBFilterReviewStatusWidgetState
    extends State<WEBFilterReviewStatusWidget> {
  late WEBFilterReviewStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WEBFilterReviewStatusModel());

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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 461.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.kicClose,
                        color: FlutterFlowTheme.of(context).gray2,
                        size: 24.0,
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
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
              child: InkWell(
                onTap: () async {
                  if (FFAppState().WEBFilterReviewStatus != null &&
                      FFAppState().WEBFilterReviewStatus != '') {
                    setState(() {
                      FFAppState().WEBFilterReviewStatus = '';
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        if (FFAppState().WEBFilterReviewStatus == null ||
                            FFAppState().WEBFilterReviewStatus == '')
                          Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Icon(
                              FFIcons.kcheeek,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                        if (FFAppState().WEBFilterReviewStatus != null &&
                            FFAppState().WEBFilterReviewStatus != '')
                          Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              border: Border.all(
                                color: Color(0xFFB1B1B1),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
              child: InkWell(
                onTap: () async {
                  if (FFAppState().WEBFilterReviewStatus == 'Обработан') {
                    setState(() {
                      FFAppState().WEBFilterReviewStatus = '';
                    });
                  } else {
                    setState(() {
                      FFAppState().WEBFilterReviewStatus = 'Обработан';
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        if (FFAppState().WEBFilterReviewStatus == 'Обработан')
                          Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Icon(
                              FFIcons.kcheeek,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                        if (FFAppState().WEBFilterReviewStatus != 'Обработан')
                          Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              border: Border.all(
                                color: Color(0xFFB1B1B1),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Обработан',
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
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
              child: InkWell(
                onTap: () async {
                  if (FFAppState().WEBFilterReviewStatus == 'Не обработан') {
                    setState(() {
                      FFAppState().WEBFilterReviewStatus = '';
                    });
                  } else {
                    setState(() {
                      FFAppState().WEBFilterReviewStatus = 'Не обработан';
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        if (FFAppState().WEBFilterReviewStatus ==
                            'Не обработан')
                          Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Icon(
                              FFIcons.kcheeek,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                        if (FFAppState().WEBFilterReviewStatus !=
                            'Не обработан')
                          Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              border: Border.all(
                                color: Color(0xFFB1B1B1),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Не обработан',
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

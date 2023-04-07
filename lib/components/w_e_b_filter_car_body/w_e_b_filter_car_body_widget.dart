import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'w_e_b_filter_car_body_model.dart';
export 'w_e_b_filter_car_body_model.dart';

class WEBFilterCarBodyWidget extends StatefulWidget {
  const WEBFilterCarBodyWidget({Key? key}) : super(key: key);

  @override
  _WEBFilterCarBodyWidgetState createState() => _WEBFilterCarBodyWidgetState();
}

class _WEBFilterCarBodyWidgetState extends State<WEBFilterCarBodyWidget> {
  late WEBFilterCarBodyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WEBFilterCarBodyModel());

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
                  if (FFAppState().WEBFilterCarBody != 'Все авто') {
                    setState(() {
                      FFAppState().WEBFilterCarBody = 'Все авто';
                    });
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Stack(
                      children: [
                        if (FFAppState().WEBFilterCarBody == null ||
                            FFAppState().WEBFilterCarBody == '')
                          Container(
                            width: 16.0,
                            height: 16.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Icon(
                              FFIcons.kcheeek,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                        if (FFAppState().WEBFilterCarBody != null &&
                            FFAppState().WEBFilterCarBody != '')
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
                        'Все авто',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
              child: StreamBuilder<List<CarBodyRecord>>(
                stream: queryCarBodyRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    );
                  }
                  List<CarBodyRecord> columnCarBodyRecordList = snapshot.data!;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(columnCarBodyRecordList.length,
                        (columnIndex) {
                      final columnCarBodyRecord =
                          columnCarBodyRecordList[columnIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: InkWell(
                          onTap: () async {
                            if (FFAppState().WEBFilterCarBody ==
                                columnCarBodyRecord.bodyName) {
                              setState(() {
                                FFAppState().WEBFilterCarBody = '';
                              });
                            } else {
                              setState(() {
                                FFAppState().WEBFilterCarBody =
                                    columnCarBodyRecord.bodyName!;
                              });
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  if (FFAppState().WEBFilterCarBody ==
                                      columnCarBodyRecord.bodyName)
                                    Container(
                                      width: 16.0,
                                      height: 16.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      child: Icon(
                                        FFIcons.kcheeek,
                                        color: Colors.white,
                                        size: 14.0,
                                      ),
                                    ),
                                  if (FFAppState().WEBFilterCarBody !=
                                      columnCarBodyRecord.bodyName)
                                    Container(
                                      width: 16.0,
                                      height: 16.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        border: Border.all(
                                          color: Color(0xFFB1B1B1),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  columnCarBodyRecord.bodyName!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

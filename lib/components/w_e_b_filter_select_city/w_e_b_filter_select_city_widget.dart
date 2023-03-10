import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'w_e_b_filter_select_city_model.dart';
export 'w_e_b_filter_select_city_model.dart';

class WEBFilterSelectCityWidget extends StatefulWidget {
  const WEBFilterSelectCityWidget({Key? key}) : super(key: key);

  @override
  _WEBFilterSelectCityWidgetState createState() =>
      _WEBFilterSelectCityWidgetState();
}

class _WEBFilterSelectCityWidgetState extends State<WEBFilterSelectCityWidget> {
  late WEBFilterSelectCityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WEBFilterSelectCityModel());

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
        width: 672.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Выберите город',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FFIcons.kicClose,
                      color: FlutterFlowTheme.of(context).gray2,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 10.0),
                child: InkWell(
                  onTap: () async {
                    if (FFAppState().WEBfilterSelectCity != null) {
                      setState(() {
                        FFAppState().WEBfilterSelectCity = null;
                      });
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(
                        children: [
                          if (FFAppState().WEBfilterSelectCity == null)
                            Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              child: Icon(
                                FFIcons.kcheeek,
                                color: Colors.white,
                                size: 14.0,
                              ),
                            ),
                          if (FFAppState().WEBfilterSelectCity != null)
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
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color: FFAppState().WEBfilterSelectCity == null
                                    ? FlutterFlowTheme.of(context).primaryColor
                                    : FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              StreamBuilder<List<CityesRecord>>(
                stream: queryCityesRecord(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<CityesRecord> listViewCityesRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewCityesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewCityesRecord =
                          listViewCityesRecordList[listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: InkWell(
                          onTap: () async {
                            if (FFAppState().WEBfilterSelectCity ==
                                listViewCityesRecord.reference) {
                              setState(() {
                                FFAppState().WEBfilterSelectCity = null;
                              });
                            } else {
                              setState(() {
                                FFAppState().WEBfilterSelectCity =
                                    listViewCityesRecord.reference;
                              });
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  if (FFAppState().WEBfilterSelectCity ==
                                      listViewCityesRecord.reference)
                                    Container(
                                      width: 16.0,
                                      height: 16.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                      ),
                                      child: Icon(
                                        FFIcons.kcheeek,
                                        color: Colors.white,
                                        size: 14.0,
                                      ),
                                    ),
                                  if (FFAppState().WEBfilterSelectCity !=
                                      listViewCityesRecord.reference)
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
                                  listViewCityesRecord.name!,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: FFAppState()
                                                    .WEBfilterSelectCity ==
                                                listViewCityesRecord.reference
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
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

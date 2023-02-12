import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/edit_car_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_car_model.dart';
export 'select_car_model.dart';

class SelectCarWidget extends StatefulWidget {
  const SelectCarWidget({Key? key}) : super(key: key);

  @override
  _SelectCarWidgetState createState() => _SelectCarWidgetState();
}

class _SelectCarWidgetState extends State<SelectCarWidget> {
  late SelectCarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectCarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 16),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
              child: Text(
                'Выберете машину',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
            FutureBuilder<List<MyCarsRecord>>(
              future: (_model.firestoreRequestCompleter ??=
                      Completer<List<MyCarsRecord>>()
                        ..complete(queryMyCarsRecordOnce(
                          parent: currentUserReference,
                          queryBuilder: (myCarsRecord) =>
                              myCarsRecord.orderBy('car_order'),
                        )))
                  .future,
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
                List<MyCarsRecord> listViewMyCarsRecordList = snapshot.data!;
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() => _model.firestoreRequestCompleter = null);
                    await _model.waitForFirestoreRequestCompleter();
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewMyCarsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewMyCarsRecord =
                          listViewMyCarsRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: InkWell(
                          onTap: () async {
                            FFAppState().update(() {
                              FFAppState().selectedCar =
                                  listViewMyCarsRecord.reference;
                            });
                            setState(
                                () => _model.firestoreRequestCompleter = null);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  if (FFAppState().selectedCar ==
                                      listViewMyCarsRecord.reference)
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                  if (FFAppState().selectedCar !=
                                      listViewMyCarsRecord.reference)
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .gray1,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Автомобиль ${functions.indexIncrement(listViewIndex).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .gray2,
                                              fontSize: 12,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          '${listViewMyCarsRecord.carBody}, ${listViewMyCarsRecord.carNum}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  FFAppState().update(() {
                                    FFAppState().addCarBody =
                                        listViewMyCarsRecord.carBody!;
                                  });
                                  Navigator.pop(context);
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: EditCarWidget(
                                          myCar: listViewMyCarsRecord,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Icon(
                                  FFIcons.kicEdit,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 60),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Сохранить',
                options: FFButtonOptions(
                  width: 130,
                  height: 48,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
                        color: Colors.white,
                        fontSize: 16,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).subtitle2Family),
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
        ),
      ),
    );
  }
}

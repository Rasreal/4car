import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_city_model.dart';
export 'add_city_model.dart';

class AddCityWidget extends StatefulWidget {
  const AddCityWidget({Key? key}) : super(key: key);

  @override
  _AddCityWidgetState createState() => _AddCityWidgetState();
}

class _AddCityWidgetState extends State<AddCityWidget> {
  late AddCityModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCityModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 16.0),
                child: Container(
                  width: 40.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Выберите ваш город',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 200),
                  () => setState(() {}),
                ),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Поиск',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).gray2,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(
                    FFIcons.kicSearch,
                    color: Color(0xFFC4C4C4),
                    size: 24.0,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                maxLines: null,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.textController.text != null &&
                        _model.textController.text != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: StreamBuilder<List<CityesRecord>>(
                          stream: queryCityesRecord(
                            queryBuilder: (cityesRecord) =>
                                cityesRecord.orderBy('location'),
                          ),
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
                            List<CityesRecord> columnCityesRecordList =
                                snapshot.data!;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                  columnCityesRecordList.length, (columnIndex) {
                                final columnCityesRecord =
                                    columnCityesRecordList[columnIndex];
                                return Visibility(
                                  visible: functions.showSearchResult2(
                                      _model.textController.text,
                                      columnCityesRecord.name!),
                                  child: InkWell(
                                    onTap: () async {
                                      final userUpdateData =
                                          createUserRecordData(
                                        country: columnCityesRecord.reference,
                                        countryText: columnCityesRecord.name,
                                      );
                                      await currentUserReference!
                                          .update(userUpdateData);
                                      Navigator.pop(context);
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                columnCityesRecord.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              if (functions
                                                      .returnDistanceBetweenTwoPointsCopy(
                                                          columnCityesRecord
                                                              .location,
                                                          currentUserLocationValue)
                                                      .toString() ==
                                                  '5')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.kicNavigation,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          color: Color(0xFFEBEBEB),
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
                    if (_model.textController.text == null ||
                        _model.textController.text == '')
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: StreamBuilder<List<CityesRecord>>(
                              stream: queryCityesRecord(
                                queryBuilder: (cityesRecord) => cityesRecord
                                    .where('first', isEqualTo: '1')
                                    .orderBy('name'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<CityesRecord> columnCityesRecordList =
                                    snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                      columnCityesRecordList.length,
                                      (columnIndex) {
                                    final columnCityesRecord =
                                        columnCityesRecordList[columnIndex];
                                    return InkWell(
                                      onTap: () async {
                                        final userUpdateData =
                                            createUserRecordData(
                                          country: columnCityesRecord.reference,
                                          countryText: columnCityesRecord.name,
                                        );
                                        await currentUserReference!
                                            .update(userUpdateData);
                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  columnCityesRecord.name!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                if (functions
                                                        .returnDistanceBetweenTwoPointsCopy(
                                                            columnCityesRecord
                                                                .location,
                                                            currentUserLocationValue)
                                                        .toString() ==
                                                    '5')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kicNavigation,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: Color(0xFFEBEBEB),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: StreamBuilder<List<CityesRecord>>(
                              stream: queryCityesRecord(
                                queryBuilder: (cityesRecord) =>
                                    cityesRecord.orderBy('name'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                                List<CityesRecord> columnCityesRecordList =
                                    snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                      columnCityesRecordList.length,
                                      (columnIndex) {
                                    final columnCityesRecord =
                                        columnCityesRecordList[columnIndex];
                                    return InkWell(
                                      onTap: () async {
                                        final userUpdateData =
                                            createUserRecordData(
                                          country: columnCityesRecord.reference,
                                          countryText: columnCityesRecord.name,
                                        );
                                        await currentUserReference!
                                            .update(userUpdateData);
                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  columnCityesRecord.name!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                                if (functions
                                                        .returnDistanceBetweenTwoPointsCopy(
                                                            columnCityesRecord
                                                                .location,
                                                            currentUserLocationValue)
                                                        .toString() ==
                                                    '5')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kicNavigation,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color: Color(0xFFEBEBEB),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ],
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

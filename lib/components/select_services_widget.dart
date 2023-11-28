import '/backend/backend.dart';
import '/components/empty_services_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_services_model.dart';
export 'select_services_model.dart';

class SelectServicesWidget extends StatefulWidget {
  const SelectServicesWidget({
    Key? key,
    this.company,
    this.carBody,
  }) : super(key: key);

  final DocumentReference? company;
  final String? carBody;

  @override
  _SelectServicesWidgetState createState() => _SelectServicesWidgetState();
}

class _SelectServicesWidgetState extends State<SelectServicesWidget> {
  late SelectServicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectServicesModel());

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
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 22.0),
            child: Text(
              'Выберите услугу',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: FutureBuilder<List<CompanyServicesRecord>>(
                    future: queryCompanyServicesRecordOnce(
                      parent: widget.company,
                      queryBuilder: (companyServicesRecord) =>
                          companyServicesRecord.where(
                        'car_body',
                        isEqualTo: widget.carBody,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<CompanyServicesRecord>
                          columnCompanyServicesRecordList = snapshot.data!;
                      if (columnCompanyServicesRecordList.isEmpty) {
                        return EmptyServicesWidget();
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            columnCompanyServicesRecordList.length,
                            (columnIndex) {
                          final columnCompanyServicesRecord =
                              columnCompanyServicesRecordList[columnIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (FFAppState()
                                          .selectedServices
                                          .contains(columnCompanyServicesRecord
                                              .reference)) {
                                        FFAppState().update(() {
                                          FFAppState()
                                              .removeFromSelectedServices(
                                                  columnCompanyServicesRecord
                                                      .reference);
                                          FFAppState().price =
                                              functions.priceMinus(
                                                  FFAppState().price.toDouble(),
                                                  columnCompanyServicesRecord
                                                      .price);
                                          FFAppState()
                                              .removeFromBookingSelectedServicesName(
                                                  columnCompanyServicesRecord
                                                      .name);
                                          FFAppState()
                                                  .selectedServicesDuration =
                                              valueOrDefault<int>(
                                                    FFAppState()
                                                        .selectedServicesDuration,
                                                    0,
                                                  ) -
                                                  valueOrDefault<int>(
                                                    columnCompanyServicesRecord
                                                        .duration,
                                                    0,
                                                  );
                                        });
                                      } else {
                                        FFAppState().update(() {
                                          FFAppState().addToSelectedServices(
                                              columnCompanyServicesRecord
                                                  .reference);
                                          FFAppState().price =
                                              functions.pricePlus(
                                                  FFAppState().price.toDouble(),
                                                  columnCompanyServicesRecord
                                                      .price);
                                          FFAppState()
                                              .addToBookingSelectedServicesName(
                                                  columnCompanyServicesRecord
                                                      .name);
                                          FFAppState()
                                                  .selectedServicesDuration =
                                              FFAppState()
                                                      .selectedServicesDuration +
                                                  valueOrDefault<int>(
                                                    FFAppState()
                                                        .selectedServicesDuration,
                                                    0,
                                                  ) +
                                                  valueOrDefault<int>(
                                                    columnCompanyServicesRecord
                                                        .duration,
                                                    0,
                                                  );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState()
                                            .selectedServices
                                            .contains(
                                                columnCompanyServicesRecord
                                                    .reference))
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 12.0,
                                              ),
                                            ),
                                          ),
                                        if (!FFAppState()
                                            .selectedServices
                                            .contains(
                                                columnCompanyServicesRecord
                                                    .reference))
                                          Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .gray1,
                                              ),
                                            ),
                                          ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              columnCompanyServicesRecord.name,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Text(
                                            '${columnCompanyServicesRecord.price.toString()} тг',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).gray3,
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 60.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Сохранить',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            fontSize: 16.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

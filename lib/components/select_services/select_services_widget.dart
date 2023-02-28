import '/backend/backend.dart';
import '/components/empty_services_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
        child: SingleChildScrollView(
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
                  'Выберете услугу',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              FutureBuilder<List<CompanyServicesRecord>>(
                future: queryCompanyServicesRecordOnce(
                  parent: widget.company,
                  queryBuilder: (companyServicesRecord) => companyServicesRecord
                      .where('car_body', isEqualTo: widget.carBody),
                ),
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
                  List<CompanyServicesRecord>
                      listViewCompanyServicesRecordList = snapshot.data!;
                  if (listViewCompanyServicesRecordList.isEmpty) {
                    return EmptyServicesWidget();
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewCompanyServicesRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewCompanyServicesRecord =
                          listViewCompanyServicesRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                              child: InkWell(
                                onTap: () async {
                                  if (FFAppState().selectedServices.contains(
                                      listViewCompanyServicesRecord
                                          .reference)) {
                                    FFAppState().update(() {
                                      FFAppState().removeFromSelectedServices(
                                          listViewCompanyServicesRecord
                                              .reference);
                                      FFAppState().price = functions.priceMinus(
                                          FFAppState().price.toDouble(),
                                          listViewCompanyServicesRecord.price);
                                      FFAppState()
                                          .removeFromBookingSelectedServicesName(
                                              listViewCompanyServicesRecord
                                                  .name!);
                                    });
                                  } else {
                                    FFAppState().update(() {
                                      FFAppState().addToSelectedServices(
                                          listViewCompanyServicesRecord
                                              .reference);
                                      FFAppState().price = functions.pricePlus(
                                          FFAppState().price.toDouble(),
                                          listViewCompanyServicesRecord.price);
                                      FFAppState()
                                          .addToBookingSelectedServicesName(
                                              listViewCompanyServicesRecord
                                                  .name!);
                                    });
                                  }
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (FFAppState().selectedServices.contains(
                                        listViewCompanyServicesRecord
                                            .reference))
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          shape: BoxShape.rectangle,
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
                                    if (!FFAppState().selectedServices.contains(
                                        listViewCompanyServicesRecord
                                            .reference))
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .gray1,
                                          ),
                                        ),
                                      ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 0, 0, 0),
                                        child: Text(
                                          listViewCompanyServicesRecord.name!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        '${listViewCompanyServicesRecord.price?.toString()} тг',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
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
                            Divider(
                              thickness: 1,
                              color: FlutterFlowTheme.of(context).gray3,
                            ),
                          ],
                        ),
                      );
                    },
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
      ),
    );
  }
}

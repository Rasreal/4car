import '../backend/backend.dart';
import '../components/empty_services_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


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

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {

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
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 22),
            child: Text(
              'Выберите услугу',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).bodyText1Family),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: FutureBuilder<List<CompanyServicesRecord>>(
                      future: queryCompanyServicesRecordOnce(
                        parent: widget.company,
                        queryBuilder: (companyServicesRecord) =>
                            companyServicesRecord.where('car_body',
                                isEqualTo: widget.carBody),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: InkWell(
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
                                                        .name!);
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
                                                        .name!);
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
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                    BorderRadius.circular(4),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                    AlignmentDirectional(0, 0),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 12,
                                                    ),
                                                  ),
                                                ),
                                              if (!FFAppState()
                                                  .selectedServices
                                                  .contains(
                                                  columnCompanyServicesRecord
                                                      .reference))
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(4),
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
                                                      16, 0, 0, 0),
                                                  child: Text(
                                                    columnCompanyServicesRecord.name!,
                                                    style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                                child: Text(
                                                  '${columnCompanyServicesRecord.price?.toInt().toString()} тг',
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText1Family,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
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
                              }),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 60),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Сохранить',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
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
        ],
      ),
    );
  }
}



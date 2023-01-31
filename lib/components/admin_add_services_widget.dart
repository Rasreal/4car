import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/admin_add_services_price_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddServicesWidget extends StatefulWidget {
  const AdminAddServicesWidget({
    Key? key,
    this.bodyName,
    this.companyDoc,
  }) : super(key: key);

  final String? bodyName;
  final DocumentReference? companyDoc;

  @override
  _AdminAddServicesWidgetState createState() => _AdminAddServicesWidgetState();
}

class _AdminAddServicesWidgetState extends State<AdminAddServicesWidget> {
  Map<String?, String> dropDownValueMap = {};
  TextEditingController? new1Controller;

  @override
  void initState() {
    super.initState();
    new1Controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    new1Controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: ExpandableNotifier(
          initialExpanded: false,
          child: ExpandablePanel(
            header: Text(
              widget.bodyName!,
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: FlutterFlowTheme.of(context).title1Family,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).title1Family),
                  ),
            ),
            collapsed: Container(
              width: 1,
              height: 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            expanded: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: Builder(
                    builder: (context) {
                      final services =
                          FFAppState().adminForCarServices.toList();
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(services.length, (servicesIndex) {
                          final servicesItem = services[servicesIndex];
                          return StreamBuilder<List<CompanyServicesRecord>>(
                            stream: queryCompanyServicesRecord(
                              parent: widget.companyDoc,
                              queryBuilder: (companyServicesRecord) =>
                                  companyServicesRecord
                                      .where('name', isEqualTo: servicesItem)
                                      .where('car_body',
                                          isEqualTo: widget.bodyName),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<CompanyServicesRecord>
                                  container1CompanyServicesRecordList =
                                  snapshot.data!;
                              final container1CompanyServicesRecord =
                                  container1CompanyServicesRecordList.isNotEmpty
                                      ? container1CompanyServicesRecordList
                                          .first
                                      : null;
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!(container1CompanyServicesRecord !=
                                        null))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                final companyServicesCreateData =
                                                    createCompanyServicesRecordData(
                                                  name: servicesItem,
                                                  carBody: widget.bodyName,
                                                );
                                                await CompanyServicesRecord
                                                        .createDoc(
                                                            widget.companyDoc!)
                                                    .set(
                                                        companyServicesCreateData);
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 16,
                                                    height: 16,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFB1B1B1),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 10, 0),
                                                    child: Text(
                                                      servicesItem,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 90,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (container1CompanyServicesRecord != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: InkWell(
                                                onTap: () async {
                                                  await container1CompanyServicesRecord!
                                                      .reference
                                                      .delete();
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          width: 16,
                                                          height: 16,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                          ),
                                                          child: Icon(
                                                            FFIcons.kcheeek,
                                                            color: Colors.white,
                                                            size: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20, 0, 10, 0),
                                                      child: Text(
                                                        container1CompanyServicesRecord!
                                                            .name!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText1Family),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 55, 0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                initialOption: dropDownValueMap[
                                                        servicesItem] ??=
                                                    valueOrDefault<String>(
                                                  container1CompanyServicesRecord!
                                                      .durationName,
                                                  '0 мин',
                                                ),
                                                options: FFAppState()
                                                    .adminForCarServicesDuration
                                                    .toList(),
                                                onChanged: (val) async {
                                                  setState(() =>
                                                      dropDownValueMap[
                                                          servicesItem] = val!);
                                                  final companyServicesUpdateData =
                                                      createCompanyServicesRecordData(
                                                    duration:
                                                        valueOrDefault<int>(
                                                      functions.durationToInt(
                                                          valueOrDefault<
                                                              String>(
                                                        dropDownValueMap[
                                                            servicesItem],
                                                        '0',
                                                      )),
                                                      0,
                                                    ),
                                                  );
                                                  await container1CompanyServicesRecord!
                                                      .reference
                                                      .update(
                                                          companyServicesUpdateData);
                                                },
                                                width: 124,
                                                height: 40,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .text3,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                                hintText: '0 мин',
                                                fillColor: Colors.white,
                                                elevation: 0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .gray3,
                                                borderWidth: 0,
                                                borderRadius: 8,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(12, 4, 12, 4),
                                                hidesUnderline: true,
                                              ),
                                            ),
                                            AdminAddServicesPriceWidget(
                                              service:
                                                  container1CompanyServicesRecord,
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 500,
                          child: TextFormField(
                            controller: new1Controller,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Введите название услуги',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText2Family,
                                    color: FlutterFlowTheme.of(context).gray2,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText2Family),
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final companiesUpdateData = {
                            'listServices':
                                FieldValue.arrayUnion([new1Controller!.text]),
                          };
                          await widget.companyDoc!.update(companiesUpdateData);
                          FFAppState().update(() {
                            FFAppState()
                                .addToAdminForCarServices(new1Controller!.text);
                          });
                          setState(() {
                            new1Controller?.clear();
                          });
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                              child: Icon(
                                FFIcons.kicPlus,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'Добавить услугу ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
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
                    ],
                  ),
                ),
              ],
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: true,
            ),
          ),
        ),
      ),
    );
  }
}

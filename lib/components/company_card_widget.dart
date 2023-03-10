import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompanyCardWidget extends StatefulWidget {
  const CompanyCardWidget({
    Key? key,
    this.company,
  }) : super(key: key);

  final CompaniesRecord? company;

  @override
  _CompanyCardWidgetState createState() => _CompanyCardWidgetState();
}

class _CompanyCardWidgetState extends State<CompanyCardWidget> {
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).primaryColor,
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: Image.network(
                      valueOrDefault<String>(
                        widget.company!.logo,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/mq76tomaqbk1/4car.png',
                      ),
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 4, 0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.company!.name,
                                          '---',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              fontSize: 16,
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

                                      Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            functions.closedOpened(
                                                        getCurrentTimestamp,
                                                        valueOrDefault<int>(
                                                          widget.company!
                                                              .openTimeOrder,
                                                          0,
                                                        ),
                                                        valueOrDefault<int>(
                                                          widget.company!
                                                              .closedTimeOrder,
                                                          0,
                                                        )) ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryColor
                                                : FlutterFlowTheme.of(context)
                                                    .red1,
                                            Colors.white,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                                child: RatingBarIndicator(
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                  direction: Axis.horizontal,
                                  rating: valueOrDefault<double>(
                                    functions.averageRating(
                                        widget.company!.rating!.toList()),
                                    0.0,
                                  ),
                                  unratedColor:
                                      FlutterFlowTheme.of(context).starblue,
                                  itemCount: 5,
                                  itemSize: 14,
                                ),
                              ),
                            ],
                          ),
                          StreamBuilder<UserRecord>(
                            stream:
                                UserRecord.getDocument(currentUserReference!),
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
                              final toggleIconUserRecord = snapshot.data!;
                              return ToggleIcon(
                                onPressed: () async {
                                  final favCompanyElement =
                                      widget.company!.reference;
                                  final favCompanyUpdate = toggleIconUserRecord
                                          .favCompany!
                                          .toList()
                                          .contains(favCompanyElement)
                                      ? FieldValue.arrayRemove(
                                          [favCompanyElement])
                                      : FieldValue.arrayUnion(
                                          [favCompanyElement]);
                                  final userUpdateData = {
                                    'favCompany': favCompanyUpdate,
                                  };
                                  await toggleIconUserRecord.reference
                                      .update(userUpdateData);
                                },
                                value: toggleIconUserRecord.favCompany!
                                    .toList()
                                    .contains(widget.company!.reference),
                                onIcon: Icon(
                                  FFIcons.kicSaveee,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                                offIcon: Icon(
                                  FFIcons.kproperty1unsaved,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  size: 24,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.company!.street,
                              '---',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              '${formatNumber(
                                functions.returnDistanceBetweenTwoPoints(
                                    currentUserLocationValue,
                                    widget.company!.location),
                                formatType: FormatType.custom,
                                format: '',
                                locale: '',
                              )}км',
                              '----',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyText1Family,
                                  color: Color(0xFF9CA3AF),
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyText1Family),
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
        Divider(
          thickness: 1,
          color: Color(0xFFF2F2F2),
        ),
      ],
    );
  }
}

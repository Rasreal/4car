import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/car_wash_company_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class CompanyTopStoriesBottomsheetWidget extends StatefulWidget {
  const CompanyTopStoriesBottomsheetWidget({
    Key? key,
    this.index,
  }) : super(key: key);

  final int? index;

  @override
  _CompanyTopStoriesBottomsheetWidgetState createState() =>
      _CompanyTopStoriesBottomsheetWidgetState();
}

class _CompanyTopStoriesBottomsheetWidgetState
    extends State<CompanyTopStoriesBottomsheetWidget> {
  PageController? pageViewController;
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
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: AuthUserStreamWidget(
                    builder: (context) => FutureBuilder<List<PromotionRecord>>(
                      future: queryPromotionRecordOnce(
                        queryBuilder: (promotionRecord) => promotionRecord
                            .where('city_link',
                            isEqualTo: currentUserDocument!.country)
                            .where('top', isEqualTo: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<PromotionRecord> pageViewPromotionRecordList =
                        snapshot.data!;
                        return Container(
                          width: double.infinity,
                          height: 500,
                          child: Stack(
                            children: [
                              PageView.builder(
                                controller: pageViewController ??=
                                    PageController(
                                        initialPage: min(
                                            valueOrDefault<int>(
                                              widget.index,
                                              0,
                                            ),
                                            pageViewPromotionRecordList.length -
                                                1)),
                                scrollDirection: Axis.horizontal,
                                itemCount: pageViewPromotionRecordList.length,
                                itemBuilder: (context, pageViewIndex) {
                                  final pageViewPromotionRecord =
                                  pageViewPromotionRecordList[
                                  pageViewIndex];
                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          pageViewPromotionRecord.img!,
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.5,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 1),
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.6,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.black
                                                ],
                                                stops: [0, 0.2],
                                                begin: AlignmentDirectional(
                                                    0.03, -1),
                                                end: AlignmentDirectional(
                                                    -0.03, 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              16, 28, 16, 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      StreamBuilder<
                                                          CompaniesRecord>(
                                                        stream: CompaniesRecord
                                                            .getDocument(
                                                            pageViewPromotionRecord
                                                                .parentReference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                      context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final rowCompaniesRecord =
                                                          snapshot.data!;
                                                          return Row(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rowCompaniesRecord
                                                                        .logo,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/mq76tomaqbk1/4car.png',
                                                                  ),
                                                                  width: 32,
                                                                  height: 32,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    8,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                child: Text(
                                                                  rowCompaniesRecord
                                                                      .name!,
                                                                  style: FlutterFlowTheme.of(
                                                                      context)
                                                                      .bodyText1
                                                                      .override(
                                                                    fontFamily:
                                                                    FlutterFlowTheme.of(context).bodyText1Family,
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                    16,
                                                                    useGoogleFonts:
                                                                    GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.max,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    Text(
                                                      pageViewPromotionRecord
                                                          .title!,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1Family,
                                                        color: Colors
                                                            .white,
                                                        fontSize: 24,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyText1Family),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0, 16, 0, 0),
                                                      child: Text(
                                                        pageViewPromotionRecord
                                                            .subtitle!,
                                                        style:
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: FlutterFlowTheme.of(
                                                              context)
                                                              .bodyText1Family,
                                                          color: Colors
                                                              .white,
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
                                              Align(
                                                alignment:
                                                AlignmentDirectional(0, 1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 40),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                        true,
                                                        backgroundColor:
                                                        Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                            MediaQuery.of(
                                                                context)
                                                                .viewInsets,
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .height *
                                                                  0.8,
                                                              child:
                                                              CarWashCompanyWidget(
                                                                currentCompanyLink:
                                                                pageViewPromotionRecord
                                                                    .parentReference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: 'Перейти',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 48,
                                                      color:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .primaryColor,
                                                      textStyle:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .subtitle2
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .subtitle2Family,
                                                        color: Colors
                                                            .white,
                                                        fontSize: 16,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .subtitle2Family),
                                                      ),
                                                      borderSide: BorderSide(
                                                        color:
                                                        Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, -0.97),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 10),
                                  child:
                                  smooth_page_indicator.SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                valueOrDefault<int>(
                                                  widget.index,
                                                  0,
                                                ),
                                                pageViewPromotionRecordList
                                                    .length -
                                                    1)),
                                    count: pageViewPromotionRecordList.length,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController!.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 2,
                                      spacing: 8,
                                      radius: 16,
                                      dotWidth: 40,
                                      dotHeight: 4,
                                      dotColor: Color(0xFFD2D2D2),
                                      activeDotColor: Colors.white,
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(1, -1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 80, 16, 0),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).gray1,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
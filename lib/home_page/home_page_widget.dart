import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_city_widget.dart';
import '../components/car_wash_company_widget.dart';
import '../components/company_card_widget.dart';
import '../components/company_stories_bottomsheet_widget.dart';
import '../components/company_top_stories_bottomsheet.dart';
import '../components/log_out_widget.dart';
import '../components/sucsess_booking_review_widget.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/lat_lng.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle, rootBundle;
import 'dart:ui' as ui;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

export 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
export '../flutter_flow/lat_lng.dart' show LatLng;

import 'package:latlong2/latlong.dart' as lt;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  FocusNode _focus = FocusNode();
  bool focused = false;
  double zoom1 = 20;

  var keyVis = KeyboardVisibilityController();

  List<String> images = ['assets/images/marker.png'];
  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Uint8List? markIcons;
  BitmapDescriptor? iconn;

  loadData() async {
    markIcons = await getImages(images[0], 40);
    iconn = BitmapDescriptor.fromBytes(markIcons!);
  }

  Completer<List<CompaniesRecord>>? _firestoreRequestCompleter;
  TextEditingController? textController;
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  LatLng? currentUserLocationValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool? switchListTileValue;

  PanelController panelController = PanelController();

  var pixelRatio = window.devicePixelRatio;

  //Size in physical pixels
  var physicalScreenSize = window.physicalSize;

  double fabHeightClosed = 310;

  double? fabHeight;

  double? pgTop;

  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {
    focused = _focus.hasFocus;
    loadData();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault<bool>(
          currentUserDocument?.lastBookingBoolean, false)) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: SucsessBookingReviewWidget(
                  booking: currentUserDocument!.linkLastBooking,
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));
      }
    });
    super.initState();
    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() {
              currentUserLocationValue = loc;
              FFAppState().currLoc = loc;
            }));
    textController = TextEditingController();

    var physicalWidth = physicalScreenSize.width;
    var physicalHeight = physicalScreenSize.height;

//Size in logical pixels
    var logicalScreenSize = window.physicalSize / pixelRatio;
    var logicalWidth = logicalScreenSize.width;
    var logicalHeight = logicalScreenSize.height;

//Padding in physical pixels
    var padding = window.padding;

//Safe area paddings in logical pixels
    var paddingLeft = window.padding.left / window.devicePixelRatio;
    var paddingRight = window.padding.right / window.devicePixelRatio;
    var paddingTop = window.padding.top / window.devicePixelRatio;
    var paddingBottom = window.padding.bottom / window.devicePixelRatio;

//Safe area in logical pixels
    var safeWidth = logicalWidth - paddingLeft - paddingRight;
    var safeHeight = logicalHeight - paddingTop - paddingBottom;

    fabHeightClosed = safeHeight * 0.308;

    fabHeight = fabHeightClosed;

    pgTop = paddingTop;
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _panelHeightOpen;
    double _panelHeightClosed;

    _panelHeightClosed = MediaQuery.of(context).size.height * 0.255;

    // fabHeightClosed = MediaQuery.of(context).size.height * 0.385;
    // fabHeight = fabHeightClosed;
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.8;

    if (currentUserLocationValue == null) {
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

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        // endDrawer: Drawer(
        //   backgroundColor: Colors.black87,
        //   elevation: 1,
        //   child: Container(
        //     width: 100,
        //     height: 100,
        //     decoration: BoxDecoration(
        //       color: FlutterFlowTheme.of(context).primaryBackground,
        //     ),
        //     child: Padding(
        //       padding: EdgeInsetsDirectional.fromSTEB(16, 57, 16, 16),
        //       child: Column(
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           Padding(
        //             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
        //             child: InkWell(
        //               onTap: () async {
        //                 context.pushNamed('edit_profile');
        //               },
        //               child: Row(
        //                 mainAxisSize: MainAxisSize.max,
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Row(
        //                     mainAxisSize: MainAxisSize.max,
        //                     children: [
        //                       AuthUserStreamWidget(
        //                         child: ClipRRect(
        //                           borderRadius: BorderRadius.circular(8),
        //                           child: Image.network(
        //                             valueOrDefault<String>(
        //                               currentUserPhoto,
        //                               'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/tsybuq71uj0t/Avatars_48x48.png',
        //                             ),
        //                             width: 48,
        //                             height: 48,
        //                             fit: BoxFit.cover,
        //                           ),
        //                         ),
        //                       ),
        //                       Padding(
        //                         padding: EdgeInsetsDirectional.fromSTEB(
        //                             12, 0, 0, 0),
        //                         child: Column(
        //                           mainAxisSize: MainAxisSize.max,
        //                           crossAxisAlignment:
        //                               CrossAxisAlignment.start,
        //                           children: [
        //                             Padding(
        //                               padding:
        //                                   EdgeInsetsDirectional.fromSTEB(
        //                                       0, 0, 0, 8),
        //                               child: AuthUserStreamWidget(
        //                                 child: Text(
        //                                   valueOrDefault<String>(
        //                                     currentUserDisplayName,
        //                                     'Имя не указано',
        //                                   ),
        //                                   style:
        //                                       FlutterFlowTheme.of(context)
        //                                           .bodyText1
        //                                           .override(
        //                                             fontFamily:
        //                                                 FlutterFlowTheme.of(
        //                                                         context)
        //                                                     .bodyText1Family,
        //                                             fontWeight:
        //                                                 FontWeight.w500,
        //                                             useGoogleFonts: GoogleFonts
        //                                                     .asMap()
        //                                                 .containsKey(
        //                                                     FlutterFlowTheme.of(
        //                                                             context)
        //                                                         .bodyText1Family),
        //                                           ),
        //                                 ),
        //                               ),
        //                             ),
        //                             AuthUserStreamWidget(
        //                               child: Text(
        //                                 valueOrDefault<String>(
        //                                   functions.phoneNum(
        //                                       valueOrDefault<String>(
        //                                     currentPhoneNumber,
        //                                     '-',
        //                                   )),
        //                                   '-',
        //                                 ),
        //                                 style: FlutterFlowTheme.of(context)
        //                                     .bodyText1
        //                                     .override(
        //                                       fontFamily:
        //                                           FlutterFlowTheme.of(
        //                                                   context)
        //                                               .bodyText1Family,
        //                                       color: Color(0xFF9CA3AF),
        //                                       fontSize: 12,
        //                                       fontWeight: FontWeight.normal,
        //                                       useGoogleFonts: GoogleFonts
        //                                               .asMap()
        //                                           .containsKey(
        //                                               FlutterFlowTheme.of(
        //                                                       context)
        //                                                   .bodyText1Family),
        //                                     ),
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   Icon(
        //                     FFIcons.kicArrowsButtonLeft,
        //                     color:
        //                         FlutterFlowTheme.of(context).primaryColor,
        //                     size: 24,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           Divider(
        //             thickness: 1,
        //             color: FlutterFlowTheme.of(context).gray4,
        //           ),
        //           Padding(
        //             padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        //             child: InkWell(
        //               onTap: () async {
        //                 await showModalBottomSheet(
        //                   isScrollControlled: true,
        //                   backgroundColor: Colors.transparent,
        //                   context: context,
        //                   builder: (context) {
        //                     return Padding(
        //                       padding: MediaQuery.of(context).viewInsets,
        //                       child: Container(
        //                         height: MediaQuery.of(context).size.height *
        //                             0.8,
        //                         child: AddCityWidget(),
        //                       ),
        //                     );
        //                   },
        //                 ).then((value) => setState(() {}));
        //               },
        //               child: Row(
        //                 mainAxisSize: MainAxisSize.max,
        //                 children: [
        //                   Icon(
        //                     FFIcons.kicMapIc,
        //                     color:
        //                         FlutterFlowTheme.of(context).primaryColor,
        //                     size: 22,
        //                   ),
        //                   Padding(
        //                     padding:
        //                         EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        //                     child: Text(
        //                       'Город',
        //                       style: FlutterFlowTheme.of(context)
        //                           .bodyText1
        //                           .override(
        //                             fontFamily: FlutterFlowTheme.of(context)
        //                                 .bodyText1Family,
        //                             fontWeight: FontWeight.normal,
        //                             useGoogleFonts: GoogleFonts.asMap()
        //                                 .containsKey(
        //                                     FlutterFlowTheme.of(context)
        //                                         .bodyText1Family),
        //                           ),
        //                     ),
        //                   ),
        //                   Padding(
        //                     padding:
        //                         EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        //                     child: AuthUserStreamWidget(
        //                       child: Text(
        //                         valueOrDefault<String>(
        //                           valueOrDefault(
        //                               currentUserDocument?.countryText, ''),
        //                           'Не выбрано',
        //                         ),
        //                         style: FlutterFlowTheme.of(context)
        //                             .bodyText1
        //                             .override(
        //                               fontFamily:
        //                                   FlutterFlowTheme.of(context)
        //                                       .bodyText1Family,
        //                               color: Color(0xFF9CA3AF),
        //                               fontWeight: FontWeight.normal,
        //                               useGoogleFonts: GoogleFonts.asMap()
        //                                   .containsKey(
        //                                       FlutterFlowTheme.of(context)
        //                                           .bodyText1Family),
        //                             ),
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        //             child: InkWell(
        //               onTap: () async {
        //                 context.pushNamed('Favorites_Car_Washes');
        //               },
        //               child: Row(
        //                 mainAxisSize: MainAxisSize.max,
        //                 children: [
        //                   Icon(
        //                     FFIcons.kproperty1unsaved,
        //                     color:
        //                         FlutterFlowTheme.of(context).primaryColor,
        //                     size: 22,
        //                   ),
        //                   Padding(
        //                     padding:
        //                         EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        //                     child: Text(
        //                       'Избранные',
        //                       style: FlutterFlowTheme.of(context)
        //                           .bodyText1
        //                           .override(
        //                             fontFamily: FlutterFlowTheme.of(context)
        //                                 .bodyText1Family,
        //                             fontWeight: FontWeight.normal,
        //                             useGoogleFonts: GoogleFonts.asMap()
        //                                 .containsKey(
        //                                     FlutterFlowTheme.of(context)
        //                                         .bodyText1Family),
        //                           ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        //             child: Row(
        //               mainAxisSize: MainAxisSize.max,
        //               children: [
        //                 Icon(
        //                   FFIcons.kicShower,
        //                   color: FlutterFlowTheme.of(context).primaryColor,
        //                   size: 22,
        //                 ),
        //                 Padding(
        //                   padding:
        //                       EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        //                   child: Text(
        //                     'Добавить автомойку',
        //                     style: FlutterFlowTheme.of(context)
        //                         .bodyText1
        //                         .override(
        //                           fontFamily: FlutterFlowTheme.of(context)
        //                               .bodyText1Family,
        //                           fontWeight: FontWeight.normal,
        //                           useGoogleFonts: GoogleFonts.asMap()
        //                               .containsKey(
        //                                   FlutterFlowTheme.of(context)
        //                                       .bodyText1Family),
        //                         ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
        //             child: Row(
        //               mainAxisSize: MainAxisSize.max,
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Row(
        //                   children: [
        //                     Padding(
        //                       padding: EdgeInsetsDirectional.fromSTEB(
        //                           0, 0, 10, 0),
        //                       child: Icon(
        //                         FFIcons.kicNotification,
        //                         color: FlutterFlowTheme.of(context)
        //                             .primaryColor,
        //                         size: 22,
        //                       ),
        //                     ),
        //                     Text(
        //                       'Уведомления',
        //                       style: FlutterFlowTheme.of(context)
        //                           .title3
        //                           .override(
        //                             fontFamily: FlutterFlowTheme.of(context)
        //                                 .title3Family,
        //                             fontSize: 14,
        //                             fontWeight: FontWeight.w400,
        //                             useGoogleFonts: GoogleFonts.asMap()
        //                                 .containsKey(
        //                                     FlutterFlowTheme.of(context)
        //                                         .title3Family),
        //                           ),
        //                     ),
        //                   ],
        //                 ),
        //
        //                 Transform.scale(
        //                   scale: 0.7,
        //                   child: CupertinoSwitch(
        //                     value: switchListTileValue ??= true,
        //                     onChanged: (newValue) async {
        //                       setState(
        //                           () => switchListTileValue = newValue!);
        //                     },
        //                   ),
        //                 ),
        //                 // Expanded(
        //                 //   child: SwitchListTile(
        //                 //     value: switchListTileValue ??= true,
        //                 //     onChanged: (newValue) async {
        //                 //       setState(() => switchListTileValue = newValue!);
        //                 //     },
        //                 //     title: Text(
        //                 //       'Уведомления',
        //                 //       style:
        //                 //           FlutterFlowTheme.of(context).title3.override(
        //                 //                 fontFamily: FlutterFlowTheme.of(context)
        //                 //                     .title3Family,
        //                 //                 fontSize: 14,
        //                 //                 fontWeight: FontWeight.w500,
        //                 //                 useGoogleFonts: GoogleFonts.asMap()
        //                 //                     .containsKey(
        //                 //                         FlutterFlowTheme.of(context)
        //                 //                             .title3Family),
        //                 //               ),
        //                 //     ),
        //                 //     tileColor: Colors.white,
        //                 //     dense: true,
        //                 //     controlAffinity: ListTileControlAffinity.trailing,
        //                 //   ),
        //                 // ),
        //               ],
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
        //             child: InkWell(
        //               onTap: () async {
        //                 context.pushNamed('About_company');
        //               },
        //               child: Row(
        //                 mainAxisSize: MainAxisSize.max,
        //                 children: [
        //                   Icon(
        //                     FFIcons.kicWorld,
        //                     color:
        //                         FlutterFlowTheme.of(context).primaryColor,
        //                     size: 22,
        //                   ),
        //                   Padding(
        //                     padding:
        //                         EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        //                     child: Text(
        //                       'О компании',
        //                       style: FlutterFlowTheme.of(context)
        //                           .bodyText1
        //                           .override(
        //                             fontFamily: FlutterFlowTheme.of(context)
        //                                 .bodyText1Family,
        //                             fontWeight: FontWeight.normal,
        //                             useGoogleFonts: GoogleFonts.asMap()
        //                                 .containsKey(
        //                                     FlutterFlowTheme.of(context)
        //                                         .bodyText1Family),
        //                           ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        //             child: InkWell(
        //               onTap: () async {
        //                 context.pushNamed('Terms_of_Use');
        //               },
        //               child: Row(
        //                 mainAxisSize: MainAxisSize.max,
        //                 children: [
        //                   Icon(
        //                     FFIcons.kicTermscond,
        //                     color:
        //                         FlutterFlowTheme.of(context).primaryColor,
        //                     size: 22,
        //                   ),
        //                   Padding(
        //                     padding:
        //                         EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
        //                     child: Text(
        //                       ' Условия пользования',
        //                       style: FlutterFlowTheme.of(context)
        //                           .bodyText1
        //                           .override(
        //                             fontFamily: FlutterFlowTheme.of(context)
        //                                 .bodyText1Family,
        //                             fontWeight: FontWeight.normal,
        //                             useGoogleFonts: GoogleFonts.asMap()
        //                                 .containsKey(
        //                                     FlutterFlowTheme.of(context)
        //                                         .bodyText1Family),
        //                           ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           Expanded(
        //             child: Column(
        //               mainAxisSize: MainAxisSize.max,
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 Divider(
        //                   color: FlutterFlowTheme.of(context).gray4,
        //                 ),
        //                 Padding(
        //                   padding:
        //                       EdgeInsetsDirectional.fromSTEB(0, 25, 0, 30),
        //                   child: InkWell(
        //                     onTap: () async {
        //                       await showModalBottomSheet(
        //                         isScrollControlled: true,
        //                         backgroundColor: Colors.transparent,
        //                         context: context,
        //                         builder: (context) {
        //                           return Padding(
        //                             padding:
        //                                 MediaQuery.of(context).viewInsets,
        //                             child: LogOutWidget(),
        //                           );
        //                         },
        //                       ).then((value) => setState(() {}));
        //                     },
        //                     child: Row(
        //                       mainAxisSize: MainAxisSize.max,
        //                       children: [
        //                         Icon(
        //                           FFIcons.kicExit,
        //                           color: Color(0xFFE20000),
        //                           size: 22,
        //                         ),
        //                         Padding(
        //                           padding: EdgeInsetsDirectional.fromSTEB(
        //                               8, 0, 0, 0),
        //                           child: Text(
        //                             'Выйти',
        //                             style: FlutterFlowTheme.of(context)
        //                                 .bodyText1
        //                                 .override(
        //                                   fontFamily:
        //                                       FlutterFlowTheme.of(context)
        //                                           .bodyText1Family,
        //                                   fontWeight: FontWeight.w500,
        //                                   useGoogleFonts:
        //                                       GoogleFonts.asMap()
        //                                           .containsKey(
        //                                               FlutterFlowTheme.of(
        //                                                       context)
        //                                                   .bodyText1Family),
        //                                 ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: GestureDetector(
          onTap: () {
            setState(() {
              focused = false;
            });
          },
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    focused = false;
                    textController!.clear();
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
                child: Padding(
                  padding: focused == false
                      ? EdgeInsets.all(0)
                      : EdgeInsets.only(top: pgTop!),
                  child: SlidingUpPanel(
                    //color: Colors.black87,
                    controller: panelController,
                    parallaxEnabled: true,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12)),
                    maxHeight: keyVis.isVisible == true
                        ? _panelHeightClosed
                        : _panelHeightOpen ?? 400,
                    minHeight: _panelHeightClosed ?? 150,
                    body: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        focused = false;
                        textController!.clear();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  focused = false;
                                  textController!.clear();
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  margin: EdgeInsets.only(
                                      bottom: Platform.isAndroid
                                          ? MediaQuery.of(context).size.height *
                                              0.2
                                          : MediaQuery.of(context).size.height *
                                              0.334),
                                  child: Stack(
                                    children: [
                                      FutureBuilder<List<CompaniesRecord>>(
                                        future: queryCompaniesRecordOnce(
                                          queryBuilder: (companiesRecord) =>
                                              companiesRecord.where('status', isEqualTo: 'Активно'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
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
                                          List<CompaniesRecord>
                                              googleMapCompaniesRecordList =
                                              snapshot.data!;

                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                                FocusScope.of(context)
                                                    .unfocus();
                                                focused = false;
                                                textController!.clear();
                                              });
                                            },
                                            child: FlutterFlowGoogleMap(
                                              controller: googleMapsController,
                                              onCameraIdle: (latLng) =>
                                                  googleMapsCenter = latLng,
                                              initialLocation:
                                                  googleMapsCenter ??=
                                                      currentUserLocationValue!,
                                              markers:
                                                  googleMapCompaniesRecordList
                                                      .map(
                                                        (googleMapCompaniesRecord) =>
                                                            FlutterFlowMarker(
                                                          googleMapCompaniesRecord
                                                              .reference.path,
                                                          googleMapCompaniesRecord
                                                              .location!,
                                                          () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.8,
                                                                    child:
                                                                        CarWashCompanyWidget(
                                                                      currentCompanyLink:
                                                                          googleMapCompaniesRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                        ),
                                                      )
                                                      .toList(),
                                              markerColor:
                                                  GoogleMarkerColor.blue,
                                              mapType: MapType.normal,
                                              style: GoogleMapStyle.standard,
                                              initialZoom: 16,
                                              allowInteraction: true,
                                              allowZoom: true,
                                              showZoomControls: true,
                                              showLocation: true,
                                              showCompass: false,
                                              showMapToolbar: false,
                                              showTraffic: false,
                                              centerMapOnMarkerTap: true,
                                              iconn: iconn!,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed('main_old');
                                  },
                                  text: 'Button',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2Family),
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    onPanelSlide: (position) {
                      if (position == 0) {
                        FocusScope.of(context).unfocus();
                        focused = false;
                        textController!.clear();
                        panelController.close();
                      }
                      setState(() {
                        final panelMax = _panelHeightOpen - _panelHeightClosed;

                        fabHeight = panelMax * position + fabHeightClosed;
                      });
                    },
                    panelBuilder: (controller) => //Scaffold(
                        // backgroundColor: Colors.red,
                        // resizeToAvoidBottomInset: false,
                        // body:
                        MediaQuery.removePadding(
                      removeBottom: true,
                      context: context,
                      removeTop: true,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: ListView(
                            //mainAxisSize: MainAxisSize.max,
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            controller: controller,
                            //mainAxisSize: MainAxisSize.max,
                            //mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (panelController.isPanelOpen == false) {
                                    panelController.open();
                                  } else
                                    panelController.close();
                                },
                                child: Center(
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
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).gray3,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 8, 8),
                                      child: Icon(
                                        FFIcons.kicSearch,
                                        color:
                                            FlutterFlowTheme.of(context).gray3,
                                        size: 24,
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        width: double.infinity,
                                        child: SizedBox(
                                          height: 38,
                                          child: FocusScope(
                                            child: Focus(
                                              onFocusChange: (focuss) {
                                                setState(() {
                                                  focused = _focus.hasFocus;
                                                  panelController.open();
                                                });
                                              },
                                              child: TextFormField(
                                                focusNode: _focus,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                controller: textController,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  'textController',
                                                  Duration(milliseconds: 500),
                                                  () => setState(() {}),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .copyWith(fontSize: 22),
                                                  hintText: 'Поиск',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontSize: 14,
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            Color(0xFFC4C4C4),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  suffixIcon:
                                                      textController!
                                                              .text.isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                textController
                                                                    ?.clear();
                                                                setState(() {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray3,
                                                                size: 22,
                                                              ),
                                                            )
                                                          : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyText1Family,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1Family),
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if ((textController!.text == null ||
                                      textController!.text == '') &&
                                  focused == false)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Padding(
                                    //   padding: EdgeInsetsDirectional.fromSTEB(
                                    //       0, 16, 0, 16),
                                    //   child: Container(
                                    //       width: double.infinity,
                                    //       height: 100,
                                    //       child: AuthUserStreamWidget(
                                    //         builder: (context) => FutureBuilder<
                                    //             List<PromotionRecord>>(
                                    //           future: queryPromotionRecordOnce(
                                    //             queryBuilder: (promotionRecord) =>
                                    //                 promotionRecord
                                    //                     .where('city_link',
                                    //                         isEqualTo:
                                    //                             currentUserDocument!
                                    //                                 .country)
                                    //                     .where('top',
                                    //                         isEqualTo: true),
                                    //             limit: 3,
                                    //           ),
                                    //           builder: (context, snapshot) {
                                    //             // Customize what your widget looks like when it's loading.
                                    //             if (!snapshot.hasData) {
                                    //               return Center(
                                    //                 child: SizedBox(
                                    //                   width: 50,
                                    //                   height: 50,
                                    //                   child:
                                    //                       CircularProgressIndicator(
                                    //                     color:
                                    //                         FlutterFlowTheme.of(
                                    //                                 context)
                                    //                             .primaryColor,
                                    //                   ),
                                    //                 ),
                                    //               );
                                    //             }
                                    //             List<PromotionRecord>
                                    //                 listViewPromotionRecordList =
                                    //                 snapshot.data!;
                                    //             return ListView.builder(
                                    //               padding: EdgeInsets.zero,
                                    //               shrinkWrap: true,
                                    //               scrollDirection:
                                    //                   Axis.horizontal,
                                    //               itemCount:
                                    //                   listViewPromotionRecordList
                                    //                       .length,
                                    //               itemBuilder:
                                    //                   (context, listViewIndex) {
                                    //                 final listViewPromotionRecord =
                                    //                     listViewPromotionRecordList[
                                    //                         listViewIndex];
                                    //                 return Padding(
                                    //                   padding:
                                    //                       EdgeInsetsDirectional
                                    //                           .fromSTEB(
                                    //                               0, 0, 16, 0),
                                    //                   child: InkWell(
                                    //                     onTap: () async {
                                    //                       await showModalBottomSheet(
                                    //                         isScrollControlled:
                                    //                             true,
                                    //                         backgroundColor:
                                    //                             Colors
                                    //                                 .transparent,
                                    //                         context: context,
                                    //                         builder: (context) {
                                    //                           return Padding(
                                    //                             padding: MediaQuery.of(
                                    //                                     context)
                                    //                                 .viewInsets,
                                    //                             child:
                                    //                                 Container(
                                    //                               height: double
                                    //                                   .infinity,
                                    //                               child:
                                    //                                   CompanyStoriesBottomsheetWidget(
                                    //                                 currentCompany:
                                    //                                     listViewPromotionRecord.reference,
                                    //                                 index:
                                    //                                     listViewIndex,
                                    //                               ),
                                    //                             ),
                                    //                           );
                                    //                         },
                                    //                       ).then((value) =>
                                    //                           setState(() {}));
                                    //                     },
                                    //                     child: Container(
                                    //                       width: 104,
                                    //                       height: 100,
                                    //                       child: Stack(
                                    //                         children: [
                                    //                           ClipRRect(
                                    //                             borderRadius:
                                    //                                 BorderRadius
                                    //                                     .circular(
                                    //                                         8),
                                    //                             child: Image
                                    //                                 .network(
                                    //                               valueOrDefault<
                                    //                                   String>(
                                    //                                 listViewPromotionRecord
                                    //                                     .img,
                                    //                                 'https://picsum.photos/seed/112/600',
                                    //                               ),
                                    //                               width: 104,
                                    //                               height: 100,
                                    //                               fit: BoxFit
                                    //                                   .cover,
                                    //                             ),
                                    //                           ),
                                    //                           Container(
                                    //                             width: 104,
                                    //                             height: 100,
                                    //                             decoration:
                                    //                                 BoxDecoration(
                                    //                               gradient:
                                    //                                   LinearGradient(
                                    //                                 colors: [
                                    //                                   Colors
                                    //                                       .transparent,
                                    //                                   Colors
                                    //                                       .black
                                    //                                 ],
                                    //                                 stops: [
                                    //                                   0,
                                    //                                   1
                                    //                                 ],
                                    //                                 begin:
                                    //                                     AlignmentDirectional(
                                    //                                         0,
                                    //                                         -1),
                                    //                                 end:
                                    //                                     AlignmentDirectional(
                                    //                                         0,
                                    //                                         1),
                                    //                               ),
                                    //                               borderRadius:
                                    //                                   BorderRadius
                                    //                                       .circular(
                                    //                                           8),
                                    //                             ),
                                    //                           ),
                                    //                           Column(
                                    //                             mainAxisSize:
                                    //                                 MainAxisSize
                                    //                                     .max,
                                    //                             mainAxisAlignment:
                                    //                                 MainAxisAlignment
                                    //                                     .center,
                                    //                             crossAxisAlignment:
                                    //                                 CrossAxisAlignment
                                    //                                     .start,
                                    //                             children: [
                                    //                               Expanded(
                                    //                                 child:
                                    //                                     Align(
                                    //                                   alignment:
                                    //                                       AlignmentDirectional(
                                    //                                           -1,
                                    //                                           1),
                                    //                                   child:
                                    //                                       Padding(
                                    //                                     padding: EdgeInsetsDirectional.fromSTEB(
                                    //                                         6,
                                    //                                         0,
                                    //                                         6,
                                    //                                         8),
                                    //                                     child:
                                    //                                         Text(
                                    //                                       listViewPromotionRecord
                                    //                                           .title!,
                                    //                                       textAlign:
                                    //                                           TextAlign.start,
                                    //                                       maxLines:
                                    //                                           2,
                                    //                                       style: FlutterFlowTheme.of(context)
                                    //                                           .bodyText1
                                    //                                           .override(
                                    //                                             fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                    //                                             color: Colors.white,
                                    //                                             fontSize: 11,
                                    //                                             fontWeight: FontWeight.w500,
                                    //                                             useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                    //                                           ),
                                    //                                     ),
                                    //                                   ),
                                    //                                 ),
                                    //                               ),
                                    //                             ],
                                    //                           ),
                                    //                         ],
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 );
                                    //               },
                                    //             );
                                    //           },
                                    //         ),
                                    //       )),
                                    // ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: AuthUserStreamWidget(
                                          builder: (context) =>
                                              FutureBuilder<List<PromotionRecord>>(
                                                future: queryPromotionRecordOnce(
                                                  queryBuilder: (promotionRecord) => promotionRecord
                                                      .where('city_link',
                                                      isEqualTo: currentUserDocument!.country)
                                                      .where('top', isEqualTo: true),
                                                  limit: 3,
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
                                                  List<PromotionRecord> rowPromotionRecordList =
                                                  snapshot.data!;
                                                  return SingleChildScrollView(
                                                    scrollDirection: Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: List.generate(
                                                          rowPromotionRecordList.length, (rowIndex) {
                                                        final rowPromotionRecord =
                                                        rowPromotionRecordList[rowIndex];
                                                        return Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                              0, 0, 16, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled: true,
                                                                backgroundColor: Colors.transparent,
                                                                context: context,
                                                                builder: (context) {
                                                                  return Padding(
                                                                    padding: MediaQuery.of(context)
                                                                        .viewInsets,
                                                                    child: Container(
                                                                      height: double.infinity,
                                                                      child:
                                                                      CompanyTopStoriesBottomsheetWidget(
                                                                        index: rowIndex,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) => setState(() {}));
                                                            },
                                                            child: Container(
                                                              width: 104,
                                                              height: 100,
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                    BorderRadius.circular(8),
                                                                    child: Image.network(
                                                                      valueOrDefault<String>(
                                                                        rowPromotionRecord.img,
                                                                        'https://picsum.photos/seed/112/600',
                                                                      ),
                                                                      width: 104,
                                                                      height: 100,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 104,
                                                                    height: 100,
                                                                    decoration: BoxDecoration(
                                                                      gradient: LinearGradient(
                                                                        colors: [
                                                                          Colors.transparent,
                                                                          Colors.black
                                                                        ],
                                                                        stops: [0, 1],
                                                                        begin:
                                                                        AlignmentDirectional(0, -1),
                                                                        end: AlignmentDirectional(0, 1),
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius.circular(8),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.center,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                    children: [
                                                                      Expanded(
                                                                        child: Align(
                                                                          alignment:
                                                                          AlignmentDirectional(
                                                                              -1, 1),
                                                                          child: Padding(
                                                                            padding:
                                                                            EdgeInsetsDirectional
                                                                                .fromSTEB(
                                                                                6, 0, 6, 8),
                                                                            child: Text(
                                                                              rowPromotionRecord.title!,
                                                                              textAlign:
                                                                              TextAlign.start,
                                                                              maxLines: 2,
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
                                                                                fontSize: 11,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .w500,
                                                                                useGoogleFonts: GoogleFonts
                                                                                    .asMap()
                                                                                    .containsKey(
                                                                                    FlutterFlowTheme.of(context)
                                                                                        .bodyText1Family),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: FlutterFlowTheme.of(context).gray3,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 14, 0, 0),
                                      child: AuthUserStreamWidget(
                                          builder: (context) {
                                        return FutureBuilder<
                                            List<CompaniesRecord>>(
                                          future: queryCompaniesRecordOnce(
                                            queryBuilder: (companiesRecord) =>
                                                companiesRecord.where(
                                                    'link_city',
                                                    isEqualTo:
                                                        currentUserDocument!
                                                            .country).where('status', isEqualTo: 'Активно'),

                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
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
                                            List<CompaniesRecord>
                                                listViewCompaniesRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              //scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewCompaniesRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewCompaniesRecord =
                                                    listViewCompaniesRecordList[
                                                        listViewIndex];
                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: InkWell(
                                                    onTap: () async {
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
                                                                    listViewCompaniesRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: CompanyCardWidget(
                                                      company:
                                                          listViewCompaniesRecord,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              if (focused == true && textController!.text == '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) {
                                          final searchHistory =
                                              (currentUserDocument
                                                          ?.searchHistory
                                                          ?.toList() ??
                                                      [])
                                                  .toList();
                                          return ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: searchHistory.length,
                                            itemBuilder:
                                                (context, searchHistoryIndex) {
                                              final searchHistoryItem =
                                                  searchHistory[
                                                      searchHistoryIndex];
                                              return // Generated code for this Column Widget...
                                                  StreamBuilder<
                                                      CompaniesRecord>(
                                                stream:
                                                    CompaniesRecord.getDocument(
                                                        searchHistoryItem),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final columnCompaniesRecord =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    onTap: () async {
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
                                                                    columnCompaniesRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      16, 0, 8),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .access_time,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .gray2,
                                                                size: 24,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            2),
                                                                        child:
                                                                            Text(
                                                                          columnCompaniesRecord
                                                                              .name!,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            columnCompaniesRecord.street!,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              '${formatNumber(
                                                                                functions.returnDistanceBetweenTwoPoints(currentUserLocationValue, columnCompaniesRecord.location),
                                                                                formatType: FormatType.custom,
                                                                                format: '',
                                                                                locale: '',
                                                                              )}км',
                                                                              '----',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                  color: Color(0xFF9CA3AF),
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                          color:
                                                              Color(0xFFEFEFEF),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      if ((currentUserDocument?.searchHistory
                                                      ?.toList() ??
                                                  [])
                                              .length
                                              .toString() !=
                                          '0')
                                        AuthUserStreamWidget(
                                            builder: (context) {
                                          return InkWell(
                                            onTap: () async {
                                              final userUpdateData = {
                                                'search_history':
                                                    FieldValue.delete(),
                                              };
                                              await currentUserReference!
                                                  .update(userUpdateData);
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray2,
                                                ),
                                              ),
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: SelectionArea(
                                                    child: Text(
                                                  'Очистить историю',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                )),
                                              ),
                                            ),
                                          );
                                        }),
                                    ],
                                  ),
                                ),
                              if (textController!.text != null &&
                                  textController!.text != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AuthUserStreamWidget(builder: (context) {
                                        return FutureBuilder<
                                            List<CompaniesRecord>>(
                                          future: (_firestoreRequestCompleter ??=
                                                  Completer<
                                                      List<CompaniesRecord>>()
                                                    ..complete(
                                                        queryCompaniesRecordOnce(
                                                      queryBuilder: (companiesRecord) =>
                                                          companiesRecord.where(
                                                              'link_city',
                                                              isEqualTo:
                                                                  currentUserDocument!
                                                                      .country),
                                                    )))
                                              .future,
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
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
                                            List<CompaniesRecord>
                                                listViewCompaniesRecordList =
                                                snapshot.data!;
                                            return RefreshIndicator(
                                              onRefresh: () async {
                                                setState(() =>
                                                    _firestoreRequestCompleter =
                                                        null);
                                              },
                                              child: ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewCompaniesRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewCompaniesRecord =
                                                      listViewCompaniesRecordList[
                                                          listViewIndex];
                                                  return Visibility(
                                                    visible: functions
                                                        .showSearchResult2(
                                                            textController!
                                                                .text,
                                                            listViewCompaniesRecord
                                                                .name!),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 16, 0, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          if ((currentUserDocument
                                                                      ?.searchHistory
                                                                      ?.toList() ??
                                                                  [])
                                                              .contains(
                                                                  listViewCompaniesRecord
                                                                      .reference)) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.8,
                                                                    child:
                                                                        CarWashCompanyWidget(
                                                                      currentCompanyLink:
                                                                          listViewCompaniesRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          } else {
                                                            final userUpdateData =
                                                                {
                                                              'search_history':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                listViewCompaniesRecord
                                                                    .reference
                                                              ]),
                                                            };
                                                            await currentUserReference!
                                                                .update(
                                                                    userUpdateData);
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.8,
                                                                    child:
                                                                        CarWashCompanyWidget(
                                                                      currentCompanyLink:
                                                                          listViewCompaniesRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          }
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          8),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .kicSearch,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .gray2,
                                                                      size: 24,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              2),
                                                                          child:
                                                                              Text(
                                                                            listViewCompaniesRecord.name!,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyText1,
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              listViewCompaniesRecord.street!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                '${formatNumber(
                                                                                  functions.returnDistanceBetweenTwoPoints(currentUserLocationValue, listViewCompaniesRecord.location),
                                                                                  formatType: FormatType.custom,
                                                                                  format: '',
                                                                                  locale: '',
                                                                                )}км',
                                                                                '----',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                    color: Color(0xFF9CA3AF),
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Divider(
                                                              thickness: 1,
                                                              color: Color(
                                                                  0xFFEFEFEF),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //),
              Positioned(
                right: 20,
                bottom: fabHeight,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90),
                      side: BorderSide(color: Color(0xFFD6D6D6))),
                  onPressed: () async {
                    currentUserLocationValue = await getCurrentUserLocation(
                        defaultLocation: LatLng(0.0, 0.0));
                    await googleMapsController.future.then(
                      (c) => c.animateCamera(
                        CameraUpdate.newLatLngZoom(
                            currentUserLocationValue!.toGoogleMaps(), 16),
                      ),
                    );
                  },
                  backgroundColor: Colors.white,
                  elevation: 3,
                  child: Icon(
                    FFIcons.kicNavigation,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 27,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

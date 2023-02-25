// import '../auth/auth_util.dart';
// import '../backend/backend.dart';
// import '../components/admin_app_bar_info_widget.dart';
// import '../components/admin_app_bar_widget.dart';
// import '../components/admin_new_booking_record_widget.dart';
// import '../components/admin_times_widget.dart';
// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
// import '../flutter_flow/flutter_flow_widgets.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// class AdminMainWidget extends StatefulWidget {
//   const AdminMainWidget({Key? key}) : super(key: key);
//
//   @override
//   _AdminMainWidgetState createState() => _AdminMainWidgetState();
// }
//
// class _AdminMainWidgetState extends State<AdminMainWidget> {
//   CompaniesRecord? addCompany;
//   final _unfocusNode = FocusNode();
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     // On page load action.
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       if (valueOrDefault(currentUserDocument?.role, '') == 'Супер Админ') {
//         context.goNamed('super_admin_main');
//       }
//     });
//
//     WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
//   }
//
//   @override
//   void dispose() {
//     _unfocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     context.watch<FFAppState>();
//
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
//           child: Stack(
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   AdminAppBarWidget(
//                     pageName: 'Главная',
//                   ),
//                   Expanded(
//                     child: Container(
//                       width: double.infinity,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         color: FlutterFlowTheme.of(context).secondaryBackground,
//                       ),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 1224,
//                               decoration: BoxDecoration(
//                                 color: FlutterFlowTheme.of(context)
//                                     .secondaryBackground,
//                               ),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsetsDirectional.fromSTEB(
//                                         0, 32, 0, 0),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         if (currentUserDocument!
//                                                 .merchanDocument !=
//                                             null)
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 23, 0),
//                                             child: AuthUserStreamWidget(
//                                               builder: (context) => Container(
//                                                 width: 392,
//                                                 height: 168,
//                                                 decoration: BoxDecoration(
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primaryBackground,
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                 ),
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(24, 24, 24, 24),
//                                                   child: Column(
//                                                     mainAxisSize:
//                                                         MainAxisSize.max,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Expanded(
//                                                         child: Row(
//                                                           mainAxisSize:
//                                                               MainAxisSize.min,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               width: 48,
//                                                               height: 48,
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .secondaryBackground,
//                                                                 shape: BoxShape
//                                                                     .circle,
//                                                               ),
//                                                               child: Icon(
//                                                                 FFIcons.kicBoks,
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .primaryColor,
//                                                                 size: 24,
//                                                               ),
//                                                             ),
//                                                             Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           16,
//                                                                           0,
//                                                                           0,
//                                                                           0),
//                                                               child: Column(
//                                                                 mainAxisSize:
//                                                                     MainAxisSize
//                                                                         .max,
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Text(
//                                                                     'Боксы',
//                                                                     style: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .bodyText1
//                                                                         .override(
//                                                                           fontFamily:
//                                                                               'Inter',
//                                                                           fontSize:
//                                                                               18,
//                                                                           fontWeight:
//                                                                               FontWeight.w500,
//                                                                           useGoogleFonts:
//                                                                               GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                         ),
//                                                                   ),
//                                                                   Padding(
//                                                                     padding: EdgeInsetsDirectional
//                                                                         .fromSTEB(
//                                                                             0,
//                                                                             8,
//                                                                             0,
//                                                                             0),
//                                                                     child: Text(
//                                                                       'Укажите сколько боксов будет сегодня\nработать.',
//                                                                       style: FlutterFlowTheme.of(
//                                                                               context)
//                                                                           .bodyText1
//                                                                           .override(
//                                                                             fontFamily:
//                                                                                 'Inter',
//                                                                             color:
//                                                                                 FlutterFlowTheme.of(context).gray2,
//                                                                             fontWeight:
//                                                                                 FontWeight.normal,
//                                                                             useGoogleFonts:
//                                                                                 GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                           ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Row(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         children: [
//                                                           Expanded(
//                                                             child: Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           0,
//                                                                           24,
//                                                                           0),
//                                                               child: Container(
//                                                                 height: 40,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   color: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .primaryBackground,
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               8),
//                                                                   border: Border
//                                                                       .all(
//                                                                     color: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .gray2,
//                                                                   ),
//                                                                 ),
//                                                                 child: Padding(
//                                                                   padding: EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           16,
//                                                                           0,
//                                                                           16,
//                                                                           0),
//                                                                   child: Row(
//                                                                     mainAxisSize:
//                                                                         MainAxisSize
//                                                                             .max,
//                                                                     children: [
//                                                                       Expanded(
//                                                                         child:
//                                                                             Text(
//                                                                           '1 Бокс',
//                                                                           style: FlutterFlowTheme.of(context)
//                                                                               .bodyText1
//                                                                               .override(
//                                                                                 fontFamily: 'Inter',
//                                                                                 color: FlutterFlowTheme.of(context).gray2,
//                                                                                 fontWeight: FontWeight.w500,
//                                                                                 useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                               ),
//                                                                         ),
//                                                                       ),
//                                                                       Icon(
//                                                                         FFIcons
//                                                                             .kicArrowsButtonDown,
//                                                                         color: FlutterFlowTheme.of(context)
//                                                                             .gray2,
//                                                                         size:
//                                                                             24,
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           FFButtonWidget(
//                                                             onPressed: () {
//                                                               print(
//                                                                   'Button pressed ...');
//                                                             },
//                                                             text: 'Сохранить',
//                                                             options:
//                                                                 FFButtonOptions(
//                                                               width: 118,
//                                                               height: 40,
//                                                               color: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .primaryColor,
//                                                               textStyle:
//                                                                   FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .subtitle2
//                                                                       .override(
//                                                                         fontFamily:
//                                                                             'Inter',
//                                                                         color: Colors
//                                                                             .white,
//                                                                         fontSize:
//                                                                             14,
//                                                                         fontWeight:
//                                                                             FontWeight.normal,
//                                                                         useGoogleFonts:
//                                                                             GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
//                                                                       ),
//                                                               elevation: 0,
//                                                               borderSide:
//                                                                   BorderSide(
//                                                                 color: Colors
//                                                                     .transparent,
//                                                                 width: 1,
//                                                               ),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           8),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         if (currentUserDocument!
//                                                 .merchanDocument !=
//                                             null)
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 23, 0),
//                                             child: AuthUserStreamWidget(
//                                               builder: (context) =>
//                                                   StreamBuilder<
//                                                       List<CompaniesRecord>>(
//                                                 stream: queryCompaniesRecord(
//                                                   queryBuilder: (companiesRecord) =>
//                                                       companiesRecord.where(
//                                                           'company_users',
//                                                           arrayContains:
//                                                               currentUserReference),
//                                                   singleRecord: true,
//                                                 ),
//                                                 builder: (context, snapshot) {
//                                                   // Customize what your widget looks like when it's loading.
//                                                   if (!snapshot.hasData) {
//                                                     return Center(
//                                                       child: SizedBox(
//                                                         width: 50,
//                                                         height: 50,
//                                                         child:
//                                                             CircularProgressIndicator(
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .primaryColor,
//                                                         ),
//                                                       ),
//                                                     );
//                                                   }
//                                                   List<CompaniesRecord>
//                                                       containerNewBookingCompaniesRecordList =
//                                                       snapshot.data!;
//                                                   // Return an empty Container when the item does not exist.
//                                                   if (snapshot.data!.isEmpty) {
//                                                     return Container();
//                                                   }
//                                                   final containerNewBookingCompaniesRecord =
//                                                       containerNewBookingCompaniesRecordList
//                                                               .isNotEmpty
//                                                           ? containerNewBookingCompaniesRecordList
//                                                               .first
//                                                           : null;
//                                                   return Container(
//                                                     width: 392,
//                                                     height: 168,
//                                                     decoration: BoxDecoration(
//                                                       color: FlutterFlowTheme
//                                                               .of(context)
//                                                           .primaryBackground,
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               8),
//                                                     ),
//                                                     child: Padding(
//                                                       padding:
//                                                           EdgeInsetsDirectional
//                                                               .fromSTEB(24, 24,
//                                                                   24, 24),
//                                                       child: Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           Expanded(
//                                                             child: Row(
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .min,
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Container(
//                                                                   width: 48,
//                                                                   height: 48,
//                                                                   decoration:
//                                                                       BoxDecoration(
//                                                                     color: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .secondaryBackground,
//                                                                     shape: BoxShape
//                                                                         .circle,
//                                                                   ),
//                                                                   child: Icon(
//                                                                     FFIcons
//                                                                         .kicAddEnroll,
//                                                                     color: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .primaryColor,
//                                                                     size: 24,
//                                                                   ),
//                                                                 ),
//                                                                 Padding(
//                                                                   padding: EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           16,
//                                                                           0,
//                                                                           0,
//                                                                           0),
//                                                                   child: Column(
//                                                                     mainAxisSize:
//                                                                         MainAxisSize
//                                                                             .max,
//                                                                     crossAxisAlignment:
//                                                                         CrossAxisAlignment
//                                                                             .start,
//                                                                     children: [
//                                                                       Text(
//                                                                         'Новая запись',
//                                                                         style: FlutterFlowTheme.of(context)
//                                                                             .bodyText1
//                                                                             .override(
//                                                                               fontFamily: 'Inter',
//                                                                               fontSize: 18,
//                                                                               fontWeight: FontWeight.w500,
//                                                                               useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                             ),
//                                                                       ),
//                                                                       Padding(
//                                                                         padding: EdgeInsetsDirectional.fromSTEB(
//                                                                             0,
//                                                                             8,
//                                                                             0,
//                                                                             0),
//                                                                         child:
//                                                                             Text(
//                                                                           'Добавьте новую запись если она\nпришла не через приложение.',
//                                                                           style: FlutterFlowTheme.of(context)
//                                                                               .bodyText1
//                                                                               .override(
//                                                                                 fontFamily: 'Inter',
//                                                                                 color: FlutterFlowTheme.of(context).gray2,
//                                                                                 fontWeight: FontWeight.normal,
//                                                                                 useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                               ),
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           InkWell(
//                                                             onTap: () async {
//                                                               FFAppState()
//                                                                   .update(() {
//                                                                 FFAppState()
//                                                                         .adminSelectBookingDate =
//                                                                     getCurrentTimestamp;
//                                                                 FFAppState()
//                                                                     .bookingSelectedServicesName = [];
//                                                               });
//                                                               await showModalBottomSheet(
//                                                                 isScrollControlled:
//                                                                     true,
//                                                                 backgroundColor:
//                                                                     Colors
//                                                                         .transparent,
//                                                                 enableDrag:
//                                                                     false,
//                                                                 context:
//                                                                     context,
//                                                                 builder:
//                                                                     (context) {
//                                                                   return Padding(
//                                                                     padding: MediaQuery.of(
//                                                                             context)
//                                                                         .viewInsets,
//                                                                     child:
//                                                                         AdminNewBookingRecordWidget(
//                                                                       company:
//                                                                           containerNewBookingCompaniesRecord,
//                                                                     ),
//                                                                   );
//                                                                 },
//                                                               ).then((value) =>
//                                                                   setState(
//                                                                       () {}));
//                                                             },
//                                                             child: Row(
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .max,
//                                                               children: [
//                                                                 Padding(
//                                                                   padding: EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           0,
//                                                                           0,
//                                                                           8,
//                                                                           0),
//                                                                   child: Icon(
//                                                                     FFIcons
//                                                                         .kicPlus,
//                                                                     color: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .primaryColor,
//                                                                     size: 22,
//                                                                   ),
//                                                                 ),
//                                                                 Text(
//                                                                   'Добавить запись',
//                                                                   style: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .bodyText1
//                                                                       .override(
//                                                                         fontFamily:
//                                                                             'Inter',
//                                                                         color: FlutterFlowTheme.of(context)
//                                                                             .primaryColor,
//                                                                         fontSize:
//                                                                             16,
//                                                                         fontWeight:
//                                                                             FontWeight.normal,
//                                                                         useGoogleFonts:
//                                                                             GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                       ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   );
//                                                 },
//                                               ),
//                                             ),
//                                           ),
//                                         if (currentUserDocument!
//                                                 .merchanDocument ==
//                                             null)
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 0, 23, 0),
//                                             child: AuthUserStreamWidget(
//                                               builder: (context) => Container(
//                                                 width: 392,
//                                                 height: 168,
//                                                 decoration: BoxDecoration(
//                                                   color: FlutterFlowTheme.of(
//                                                           context)
//                                                       .primaryBackground,
//                                                   borderRadius:
//                                                       BorderRadius.circular(8),
//                                                 ),
//                                                 child: Padding(
//                                                   padding: EdgeInsetsDirectional
//                                                       .fromSTEB(24, 24, 24, 24),
//                                                   child: Column(
//                                                     mainAxisSize:
//                                                         MainAxisSize.min,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Expanded(
//                                                         child: Row(
//                                                           mainAxisSize:
//                                                               MainAxisSize.min,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             Container(
//                                                               width: 48,
//                                                               height: 48,
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .secondaryBackground,
//                                                                 shape: BoxShape
//                                                                     .circle,
//                                                               ),
//                                                               child: Icon(
//                                                                 FFIcons.kicHome,
//                                                                 color: FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .primaryColor,
//                                                                 size: 24,
//                                                               ),
//                                                             ),
//                                                             Padding(
//                                                               padding:
//                                                                   EdgeInsetsDirectional
//                                                                       .fromSTEB(
//                                                                           16,
//                                                                           0,
//                                                                           0,
//                                                                           0),
//                                                               child: Column(
//                                                                 mainAxisSize:
//                                                                     MainAxisSize
//                                                                         .max,
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Text(
//                                                                     'Регистрация компании',
//                                                                     style: FlutterFlowTheme.of(
//                                                                             context)
//                                                                         .bodyText1
//                                                                         .override(
//                                                                           fontFamily:
//                                                                               'Inter',
//                                                                           fontSize:
//                                                                               18,
//                                                                           fontWeight:
//                                                                               FontWeight.w500,
//                                                                           useGoogleFonts:
//                                                                               GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                         ),
//                                                                   ),
//                                                                   Padding(
//                                                                     padding: EdgeInsetsDirectional
//                                                                         .fromSTEB(
//                                                                             0,
//                                                                             8,
//                                                                             0,
//                                                                             0),
//                                                                     child: Text(
//                                                                       'Введите данные компании и пройдите\nмодерацию.',
//                                                                       style: FlutterFlowTheme.of(
//                                                                               context)
//                                                                           .bodyText1
//                                                                           .override(
//                                                                             fontFamily:
//                                                                                 'Inter',
//                                                                             color:
//                                                                                 FlutterFlowTheme.of(context).gray2,
//                                                                             fontWeight:
//                                                                                 FontWeight.normal,
//                                                                             useGoogleFonts:
//                                                                                 GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                           ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       StreamBuilder<
//                                                           List<
//                                                               CompaniesRecord>>(
//                                                         stream:
//                                                             queryCompaniesRecord(
//                                                           queryBuilder: (companiesRecord) =>
//                                                               companiesRecord
//                                                                   .where(
//                                                                       'admin_created_by',
//                                                                       isEqualTo:
//                                                                           currentUserReference)
//                                                                   .where(
//                                                                       'status',
//                                                                       isEqualTo:
//                                                                           'new'),
//                                                           singleRecord: true,
//                                                         ),
//                                                         builder: (context,
//                                                             snapshot) {
//                                                           // Customize what your widget looks like when it's loading.
//                                                           if (!snapshot
//                                                               .hasData) {
//                                                             return Center(
//                                                               child: SizedBox(
//                                                                 width: 50,
//                                                                 height: 50,
//                                                                 child:
//                                                                     CircularProgressIndicator(
//                                                                   color: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .primaryColor,
//                                                                 ),
//                                                               ),
//                                                             );
//                                                           }
//                                                           List<CompaniesRecord>
//                                                               containerCompaniesRecordList =
//                                                               snapshot.data!;
//                                                           final containerCompaniesRecord =
//                                                               containerCompaniesRecordList
//                                                                       .isNotEmpty
//                                                                   ? containerCompaniesRecordList
//                                                                       .first
//                                                                   : null;
//                                                           return Container(
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .primaryBackground,
//                                                             ),
//                                                             child: Column(
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .max,
//                                                               children: [
//                                                                 if (containerCompaniesRecord !=
//                                                                     null)
//                                                                   InkWell(
//                                                                     onTap:
//                                                                         () async {
//                                                                       context
//                                                                           .pushNamed(
//                                                                         'admin_add_company_1',
//                                                                         queryParams:
//                                                                             {
//                                                                           'company':
//                                                                               serializeParam(
//                                                                             containerCompaniesRecord!.reference,
//                                                                             ParamType.DocumentReference,
//                                                                           ),
//                                                                         }.withoutNulls,
//                                                                         extra: <
//                                                                             String,
//                                                                             dynamic>{
//                                                                           kTransitionInfoKey:
//                                                                               TransitionInfo(
//                                                                             hasTransition:
//                                                                                 true,
//                                                                             transitionType:
//                                                                                 PageTransitionType.fade,
//                                                                             duration:
//                                                                                 Duration(milliseconds: 0),
//                                                                           ),
//                                                                         },
//                                                                       );
//                                                                     },
//                                                                     child: Row(
//                                                                       mainAxisSize:
//                                                                           MainAxisSize
//                                                                               .max,
//                                                                       children: [
//                                                                         Padding(
//                                                                           padding: EdgeInsetsDirectional.fromSTEB(
//                                                                               0,
//                                                                               0,
//                                                                               8,
//                                                                               0),
//                                                                           child:
//                                                                               Icon(
//                                                                             FFIcons.kicPlus,
//                                                                             color:
//                                                                                 FlutterFlowTheme.of(context).primaryColor,
//                                                                             size:
//                                                                                 22,
//                                                                           ),
//                                                                         ),
//                                                                         Text(
//                                                                           'Зарегестрировать кампанию',
//                                                                           style: FlutterFlowTheme.of(context)
//                                                                               .bodyText1
//                                                                               .override(
//                                                                                 fontFamily: 'Inter',
//                                                                                 color: FlutterFlowTheme.of(context).primaryColor,
//                                                                                 fontSize: 16,
//                                                                                 fontWeight: FontWeight.normal,
//                                                                                 useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                               ),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                                 if (!(containerCompaniesRecord !=
//                                                                     null))
//                                                                   InkWell(
//                                                                     onTap:
//                                                                         () async {
//                                                                       final companiesCreateData =
//                                                                           {
//                                                                         ...createCompaniesRecordData(
//                                                                           status:
//                                                                               'new',
//                                                                           adminCreatedBy:
//                                                                               currentUserReference,
//                                                                         ),
//                                                                         'listServices':
//                                                                             FFAppState().adminForCarServices,
//                                                                       };
//                                                                       var companiesRecordReference = CompaniesRecord
//                                                                           .collection
//                                                                           .doc();
//                                                                       await companiesRecordReference
//                                                                           .set(
//                                                                               companiesCreateData);
//                                                                       addCompany = CompaniesRecord.getDocumentFromData(
//                                                                           companiesCreateData,
//                                                                           companiesRecordReference);
//
//                                                                       context
//                                                                           .pushNamed(
//                                                                         'admin_add_company_1',
//                                                                         queryParams:
//                                                                             {
//                                                                           'company':
//                                                                               serializeParam(
//                                                                             addCompany!.reference,
//                                                                             ParamType.DocumentReference,
//                                                                           ),
//                                                                         }.withoutNulls,
//                                                                       );
//
//                                                                       setState(
//                                                                           () {});
//                                                                     },
//                                                                     child: Row(
//                                                                       mainAxisSize:
//                                                                           MainAxisSize
//                                                                               .max,
//                                                                       children: [
//                                                                         Padding(
//                                                                           padding: EdgeInsetsDirectional.fromSTEB(
//                                                                               0,
//                                                                               0,
//                                                                               8,
//                                                                               0),
//                                                                           child:
//                                                                               Icon(
//                                                                             FFIcons.kicPlus,
//                                                                             color:
//                                                                                 FlutterFlowTheme.of(context).primaryColor,
//                                                                             size:
//                                                                                 22,
//                                                                           ),
//                                                                         ),
//                                                                         Text(
//                                                                           'Зарегестрировать кампанию',
//                                                                           style: FlutterFlowTheme.of(context)
//                                                                               .bodyText1
//                                                                               .override(
//                                                                                 fontFamily: 'Inter',
//                                                                                 color: FlutterFlowTheme.of(context).primaryColor,
//                                                                                 fontSize: 16,
//                                                                                 fontWeight: FontWeight.normal,
//                                                                                 useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
//                                                                               ),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                   ),
//                                                               ],
//                                                             ),
//                                                           );
//                                                         },
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                       ],
//                                     ),
//                                   ),
//                                   if ((currentUserDocument!.merchanDocument !=
//                                           null) &&
//                                       responsiveVisibility(
//                                         context: context,
//                                         phone: false,
//                                         tablet: false,
//                                         tabletLandscape: false,
//                                       ))
//                                     AuthUserStreamWidget(
//                                       builder: (context) => Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding:
//                                                 EdgeInsetsDirectional.fromSTEB(
//                                                     0, 24, 0, 24),
//                                             child: Text(
//                                               'Записи',
//                                               style:
//                                                   FlutterFlowTheme.of(context)
//                                                       .bodyText1
//                                                       .override(
//                                                         fontFamily: 'Inter',
//                                                         fontSize: 24,
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                         useGoogleFonts: GoogleFonts
//                                                                 .asMap()
//                                                             .containsKey(
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyText1Family),
//                                                       ),
//                                             ),
//                                           ),
//                                           Row(
//                                             mainAxisSize: MainAxisSize.min,
//                                             children: [
//                                               Icon(
//                                                 FFIcons.kicSettings,
//                                                 color:
//                                                     FlutterFlowTheme.of(context)
//                                                         .gray2,
//                                                 size: 24,
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(8, 0, 0, 0),
//                                                 child: Text(
//                                                   'Фильтр',
//                                                   style: FlutterFlowTheme.of(
//                                                           context)
//                                                       .bodyText1
//                                                       .override(
//                                                         fontFamily: 'Inter',
//                                                         color:
//                                                             FlutterFlowTheme.of(
//                                                                     context)
//                                                                 .gray2,
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         useGoogleFonts: GoogleFonts
//                                                                 .asMap()
//                                                             .containsKey(
//                                                                 FlutterFlowTheme.of(
//                                                                         context)
//                                                                     .bodyText1Family),
//                                                       ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(24, 0, 0, 0),
//                                                 child: Container(
//                                                   width: 212,
//                                                   height: 40,
//                                                   decoration: BoxDecoration(
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .primaryBackground,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8),
//                                                     border: Border.all(
//                                                       color:
//                                                           FlutterFlowTheme.of(
//                                                                   context)
//                                                               .gray2,
//                                                     ),
//                                                   ),
//                                                   child: Padding(
//                                                     padding:
//                                                         EdgeInsetsDirectional
//                                                             .fromSTEB(
//                                                                 16, 0, 16, 0),
//                                                     child: Row(
//                                                       mainAxisSize:
//                                                           MainAxisSize.max,
//                                                       children: [
//                                                         Expanded(
//                                                           child: Text(
//                                                             'Сегодня',
//                                                             style: FlutterFlowTheme
//                                                                     .of(context)
//                                                                 .bodyText1
//                                                                 .override(
//                                                                   fontFamily:
//                                                                       'Inter',
//                                                                   color: FlutterFlowTheme.of(
//                                                                           context)
//                                                                       .gray2,
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .normal,
//                                                                   useGoogleFonts: GoogleFonts
//                                                                           .asMap()
//                                                                       .containsKey(
//                                                                           FlutterFlowTheme.of(context)
//                                                                               .bodyText1Family),
//                                                                 ),
//                                                           ),
//                                                         ),
//                                                         Icon(
//                                                           FFIcons
//                                                               .kicArrowsButtonDown,
//                                                           color: FlutterFlowTheme
//                                                                   .of(context)
//                                                               .gray2,
//                                                           size: 24,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Column(
//                                             mainAxisSize: MainAxisSize.max,
//                                             children: [
//                                               Padding(
//                                                 padding: EdgeInsetsDirectional
//                                                     .fromSTEB(0, 24, 0, 0),
//                                                 child: Container(
//                                                   width: 1224,
//                                                   decoration: BoxDecoration(
//                                                     color: FlutterFlowTheme.of(
//                                                             context)
//                                                         .primaryBackground,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8),
//                                                   ),
//                                                   child: FutureBuilder<
//                                                       List<
//                                                           CompanyDocumentRecord>>(
//                                                     future:
//                                                         queryCompanyDocumentRecordOnce(
//                                                       queryBuilder: (companyDocumentRecord) =>
//                                                           companyDocumentRecord.where(
//                                                               'company_users',
//                                                               arrayContains:
//                                                                   currentUserReference),
//                                                       singleRecord: true,
//                                                     ),
//                                                     builder:
//                                                         (context, snapshot) {
//                                                       // Customize what your widget looks like when it's loading.
//                                                       if (!snapshot.hasData) {
//                                                         return Center(
//                                                           child: SizedBox(
//                                                             width: 50,
//                                                             height: 50,
//                                                             child:
//                                                                 CircularProgressIndicator(
//                                                               color: FlutterFlowTheme
//                                                                       .of(context)
//                                                                   .primaryColor,
//                                                             ),
//                                                           ),
//                                                         );
//                                                       }
//                                                       List<CompanyDocumentRecord>
//                                                           columnCompanyDocumentRecordList =
//                                                           snapshot.data!;
//                                                       // Return an empty Container when the item does not exist.
//                                                       if (snapshot
//                                                           .data!.isEmpty) {
//                                                         return Container();
//                                                       }
//                                                       final columnCompanyDocumentRecord =
//                                                           columnCompanyDocumentRecordList
//                                                                   .isNotEmpty
//                                                               ? columnCompanyDocumentRecordList
//                                                                   .first
//                                                               : null;
//                                                       return Column(
//                                                         mainAxisSize:
//                                                             MainAxisSize.max,
//                                                         children: [
//                                                           if (columnCompanyDocumentRecord !=
//                                                               null)
//                                                             FutureBuilder<
//                                                                 List<
//                                                                     ForcarTimesRecord>>(
//                                                               future:
//                                                                   queryForcarTimesRecordOnce(),
//                                                               builder: (context,
//                                                                   snapshot) {
//                                                                 // Customize what your widget looks like when it's loading.
//                                                                 if (!snapshot
//                                                                     .hasData) {
//                                                                   return Center(
//                                                                     child:
//                                                                         SizedBox(
//                                                                       width: 50,
//                                                                       height:
//                                                                           50,
//                                                                       child:
//                                                                           CircularProgressIndicator(
//                                                                         color: FlutterFlowTheme.of(context)
//                                                                             .primaryColor,
//                                                                       ),
//                                                                     ),
//                                                                   );
//                                                                 }
//                                                                 List<ForcarTimesRecord>
//                                                                     columnForcarTimesRecordList =
//                                                                     snapshot
//                                                                         .data!;
//                                                                 return Column(
//                                                                   mainAxisSize:
//                                                                       MainAxisSize
//                                                                           .max,
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .start,
//                                                                   children: List.generate(
//                                                                       columnForcarTimesRecordList
//                                                                           .length,
//                                                                       (columnIndex) {
//                                                                     final columnForcarTimesRecord =
//                                                                         columnForcarTimesRecordList[
//                                                                             columnIndex];
//                                                                     return FutureBuilder<
//                                                                         int>(
//                                                                       future:
//                                                                           queryBookingsRecordCount(
//                                                                         queryBuilder: (bookingsRecord) => bookingsRecord
//                                                                             .where('booked_company_document',
//                                                                                 isEqualTo: columnCompanyDocumentRecord!.reference)
//                                                                             .where('selected_times_order', arrayContains: columnForcarTimesRecord.timeOrder)
//                                                                             .where('cancelled', isEqualTo: false),
//                                                                       ),
//                                                                       builder:
//                                                                           (context,
//                                                                               snapshot) {
//                                                                         // Customize what your widget looks like when it's loading.
//                                                                         if (!snapshot
//                                                                             .hasData) {
//                                                                           return Center(
//                                                                             child:
//                                                                                 SizedBox(
//                                                                               width: 50,
//                                                                               height: 50,
//                                                                               child: CircularProgressIndicator(
//                                                                                 color: FlutterFlowTheme.of(context).primaryColor,
//                                                                               ),
//                                                                             ),
//                                                                           );
//                                                                         }
//                                                                         int columnCount =
//                                                                             snapshot.data!;
//                                                                         return Column(
//                                                                           mainAxisSize:
//                                                                               MainAxisSize.max,
//                                                                           children: [
//                                                                             if (columnCount >=
//                                                                                 1)
//                                                                               AdminTimesWidget(
//                                                                                 companyDoc: columnCompanyDocumentRecord,
//                                                                                 timeOrder: columnForcarTimesRecord.timeOrder,
//                                                                               ),
//                                                                           ],
//                                                                         );
//                                                                       },
//                                                                     );
//                                                                   }),
//                                                                 );
//                                                               },
//                                                             ),
//                                                         ],
//                                                       );
//                                                     },
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Align(
//                 alignment: AlignmentDirectional(0, -1),
//                 child: AdminAppBarInfoWidget(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

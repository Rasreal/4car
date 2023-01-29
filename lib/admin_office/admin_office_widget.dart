import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/admin_app_bar_info_widget.dart';
import '../components/admin_app_bar_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdminOfficeWidget extends StatefulWidget {
  const AdminOfficeWidget({Key? key}) : super(key: key);

  @override
  _AdminOfficeWidgetState createState() => _AdminOfficeWidgetState();
}

class _AdminOfficeWidgetState extends State<AdminOfficeWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? editFIOController;
  TextEditingController? editPhoneController;
  final editPhoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  Map<DocumentReference?, String> dropDown667ValueMap = {};
  TextEditingController? textController3;
  TextEditingController? textController4;
  Completer<List<CompanyServicesRecord>>? _firestoreRequestCompleter;
  TextEditingController? textController10;
  final textFieldMask8 = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  TextEditingController? textController9;
  TextEditingController? textController11;
  TextEditingController? textController12;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  TextEditingController? textController8;
  CompaniesRecord? addCompany;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADMIN_OFFICE_admin_office_ON_LOAD');
      if (FFAppState().adminOfficeType == null ||
          FFAppState().adminOfficeType == '') {
        logFirebaseEvent('admin_office_update_local_state');
        FFAppState().update(() {
          FFAppState().adminOfficeType = 'Личные данные';
        });
      }
      if (FFAppState().adminSelectServicesBody == null ||
          FFAppState().adminSelectServicesBody == '') {
        logFirebaseEvent('admin_office_update_local_state');
        FFAppState().update(() {
          FFAppState().adminSelectServicesBody = 'Седан';
        });
      }
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'admin_office'});
    editFIOController = TextEditingController();
    editPhoneController = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    editFIOController?.dispose();
    editPhoneController?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController10?.dispose();
    textController9?.dispose();
    textController11?.dispose();
    textController12?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    textController7?.dispose();
    textController8?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AdminAppBarWidget(
                    pageName: 'Кабинет',
                  ),
                  Expanded(
                    child: StreamBuilder<List<CompanyDocumentRecord>>(
                      stream: queryCompanyDocumentRecord(
                        queryBuilder: (companyDocumentRecord) =>
                            companyDocumentRecord.where('company_users',
                                arrayContains: currentUserReference),
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
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<CompanyDocumentRecord>
                            containerCompanyDocumentRecordList = snapshot.data!;
                        final containerCompanyDocumentRecord =
                            containerCompanyDocumentRecordList.isNotEmpty
                                ? containerCompanyDocumentRecordList.first
                                : null;
                        return Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 1224,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (containerCompanyDocumentRecord !=
                                          null)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (containerCompanyDocumentRecord!
                                                    .status ==
                                                'Модерация')
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 60, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/img_moderation.png',
                                                        width: 130,
                                                        height: 130,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 26,
                                                                    0, 0),
                                                        child: Text(
                                                          'Компания на модерации',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 16,
                                                                    0, 0),
                                                        child: Text(
                                                          'Ваша кампания успешно создана и проходит\nмодерацию. Заявку можете посмотреть в разделе \n‘Главная’.',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 42,
                                                                    0, 0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'ADMIN_OFFICE_ПЕРЕЙТИ_В_РАЗДЕЛ_“ГЛАВНАЯ”_');
                                                            logFirebaseEvent(
                                                                'Button_navigate_to');

                                                            context.pushNamed(
                                                                'admin_main');
                                                          },
                                                          text:
                                                              'Перейти в раздел “Главная”',
                                                          options:
                                                              FFButtonOptions(
                                                            width: 392,
                                                            height: 48,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).subtitle2Family),
                                                                    ),
                                                            elevation: 0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            if ((containerCompanyDocumentRecord!
                                                        .status !=
                                                    'Модерация') &&
                                                (containerCompanyDocumentRecord!
                                                        .status !=
                                                    'New'))
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 32, 0, 24),
                                                    child: Text(
                                                      'Кабинет',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText1Family),
                                                              ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    24, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'ADMIN_OFFICE_PAGE_Column_jba1ajak_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Column_update_local_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .adminOfficeType =
                                                                  'Личные данные';
                                                            });
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                            17),
                                                                child: Text(
                                                                  'Личные данные',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        color: FFAppState().adminOfficeType ==
                                                                                'Личные данные'
                                                                            ? FlutterFlowTheme.of(context).primaryColor
                                                                            : FlutterFlowTheme.of(context).webUnselectedColor,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 122,
                                                                height: 1,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppState()
                                                                              .adminOfficeType ==
                                                                          'Личные данные'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    24, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'ADMIN_OFFICE_PAGE_Column_oa7x0khr_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Column_update_local_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .adminOfficeType =
                                                                  'Автомойки';
                                                            });
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                            17),
                                                                child: Text(
                                                                  'Автомойки',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        color: FFAppState().adminOfficeType ==
                                                                                'Автомойки'
                                                                            ? FlutterFlowTheme.of(context).primaryColor
                                                                            : FlutterFlowTheme.of(context).webUnselectedColor,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 85,
                                                                height: 1,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppState()
                                                                              .adminOfficeType ==
                                                                          'Автомойки'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    24, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'ADMIN_OFFICE_PAGE_Column_1v3o4ij3_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Column_update_local_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .adminOfficeType =
                                                                  'Акции';
                                                            });
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                            17),
                                                                child: Text(
                                                                  'Акции',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        color: FFAppState().adminOfficeType ==
                                                                                'Акции'
                                                                            ? FlutterFlowTheme.of(context).primaryColor
                                                                            : FlutterFlowTheme.of(context).webUnselectedColor,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 48,
                                                                height: 1,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppState()
                                                                              .adminOfficeType ==
                                                                          'Акции'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0, 0,
                                                                    24, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'ADMIN_OFFICE_PAGE_Column_0xse3vau_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Column_update_local_state');
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .adminOfficeType =
                                                                  'Сотрудники';
                                                            });
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                            17),
                                                                child: Text(
                                                                  'Сотрудники',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyText1Family,
                                                                        color: FFAppState().adminOfficeType ==
                                                                                'Сотрудники'
                                                                            ? FlutterFlowTheme.of(context).primaryColor
                                                                            : FlutterFlowTheme.of(context).webUnselectedColor,
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 88,
                                                                height: 1,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FFAppState()
                                                                              .adminOfficeType ==
                                                                          'Сотрудники'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 1224,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (FFAppState()
                                                                    .adminOfficeType ==
                                                                'Личные данные')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            48,
                                                                            48,
                                                                            48,
                                                                            48),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              24),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              'Основная информация',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Inter',
                                                                                    fontSize: 18,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('ADMIN_OFFICE_PAGE_Row_hdzio73s_ON_TAP');
                                                                              logFirebaseEvent('Row_update_local_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().adminOfficeType = 'Редактировать данные';
                                                                              });
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                                                                  child: Icon(
                                                                                    FFIcons.kicEdit,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    size: 24,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Редактировать',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                                                                                  child: Icon(
                                                                                    FFIcons.kicRefresh,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    size: 22,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Изменить пароль',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        AuthUserStreamWidget(
                                                                          builder: (context) =>
                                                                              Container(
                                                                            width:
                                                                                80,
                                                                            height:
                                                                                80,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              valueOrDefault<String>(
                                                                                currentUserPhoto,
                                                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => Text(
                                                                                    '${currentUserDisplayName} null',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 18,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  currentUserEmail,
                                                                                  'null',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                      color: FlutterFlowTheme.of(context).gray2,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              24,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Номер телефона',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: FlutterFlowTheme.of(context).gray2,
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                  child: AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      currentPhoneNumber,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 16,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Дата регистрации',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: FlutterFlowTheme.of(context).gray2,
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                  child: AuthUserStreamWidget(
                                                                                    builder: (context) => Text(
                                                                                      valueOrDefault<String>(
                                                                                        dateTimeFormat(
                                                                                          'd/M/y',
                                                                                          currentUserDocument!.signUpDate,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        '0.0.0000',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 16,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Должность',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: FlutterFlowTheme.of(context).gray2,
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                  child: Text(
                                                                                    'Руководитель',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  'Компания',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        color: FlutterFlowTheme.of(context).gray2,
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                  child: Text(
                                                                                    containerCompanyDocumentRecord!.companyName!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 16,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                              ),
                                                            if (FFAppState()
                                                                    .adminOfficeType ==
                                                                'Редактировать данные')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            48,
                                                                            48,
                                                                            48,
                                                                            48),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              24),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              'Основная информация',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Inter',
                                                                                    fontSize: 18,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('ADMIN_OFFICE_PAGE_Row_orndzt5s_ON_TAP');
                                                                              logFirebaseEvent('Row_update_local_state');
                                                                              FFAppState().update(() {
                                                                                FFAppState().adminOfficeType = 'Личные данные';
                                                                              });
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 1, 6, 0),
                                                                                  child: Icon(
                                                                                    FFIcons.kicClose,
                                                                                    color: Color(0xFF1A1A1A),
                                                                                    size: 16,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'Отменить',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: Color(0xFF1A1A1A),
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Form(
                                                                      key:
                                                                          formKey,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .disabled,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('ADMIN_OFFICE_PAGE_Row_37rqv8ym_ON_TAP');
                                                                              logFirebaseEvent('Row_upload_media_to_firebase');
                                                                              final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                context: context,
                                                                                allowPhoto: true,
                                                                              );
                                                                              if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                setState(() => isMediaUploading = true);
                                                                                var downloadUrls = <String>[];
                                                                                try {
                                                                                  downloadUrls = (await Future.wait(
                                                                                    selectedMedia.map(
                                                                                      (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                    ),
                                                                                  ))
                                                                                      .where((u) => u != null)
                                                                                      .map((u) => u!)
                                                                                      .toList();
                                                                                } finally {
                                                                                  isMediaUploading = false;
                                                                                }
                                                                                if (downloadUrls.length == selectedMedia.length) {
                                                                                  setState(() => uploadedFileUrl = downloadUrls.first);
                                                                                } else {
                                                                                  setState(() {});
                                                                                  return;
                                                                                }
                                                                              }
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                AuthUserStreamWidget(
                                                                                  builder: (context) => Container(
                                                                                    width: 80,
                                                                                    height: 80,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      uploadedFileUrl != null && uploadedFileUrl != ''
                                                                                          ? uploadedFileUrl
                                                                                          : valueOrDefault<String>(
                                                                                              currentUserPhoto,
                                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/tsybuq71uj0t/Avatars_48x48.png',
                                                                                            ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                  child: Text(
                                                                                    'Заменить фото',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          fontSize: 14,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                24,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 356,
                                                                              child: TextFormField(
                                                                                controller: editFIOController,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: 'ФИО',
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).gray2,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).gray2,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                    ),
                                                                                validator: (val) {
                                                                                  if (val == null || val.isEmpty) {
                                                                                    return 'ФИО не заполнено';
                                                                                  }

                                                                                  if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
                                                                                    return 'Must start with a letter and can only contain letters, digits and - or _.';
                                                                                  }
                                                                                  return null;
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                16,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 356,
                                                                              child: TextFormField(
                                                                                controller: editPhoneController,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelText: 'Номер телефона',
                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        fontSize: 12,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                  enabledBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).gray2,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  focusedBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: FlutterFlowTheme.of(context).gray2,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  errorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                  ),
                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                    ),
                                                                                validator: (val) {
                                                                                  if (val == null || val.isEmpty) {
                                                                                    return 'Номер телефона не заполнено';
                                                                                  }

                                                                                  return null;
                                                                                },
                                                                                inputFormatters: [
                                                                                  editPhoneMask
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            if (FFAppState()
                                                                    .adminOfficeType ==
                                                                'Сотрудники')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24,
                                                                            24,
                                                                            24,
                                                                            24),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              288,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).gray2,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16,
                                                                                0,
                                                                                16,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: TextFormField(
                                                                                    controller: textController3,
                                                                                    autofocus: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      hintText: 'Поиск',
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: Color(0xFF8E8E8E),
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                          ),
                                                                                      enabledBorder: InputBorder.none,
                                                                                      focusedBorder: InputBorder.none,
                                                                                      errorBorder: InputBorder.none,
                                                                                      focusedErrorBorder: InputBorder.none,
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 13),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: Color(0xFF8E8E8E),
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  FFIcons.kicSearch,
                                                                                  color: FlutterFlowTheme.of(context).gray2,
                                                                                  size: 24,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('ADMIN_OFFICE_PAGE_ДОБАВИТЬ_BTN_ON_TAP');
                                                                            logFirebaseEvent('Button_navigate_to');

                                                                            context.pushNamed('admin_add_staff_1');
                                                                          },
                                                                          text:
                                                                              'Добавить',
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kicPlus,
                                                                            size:
                                                                                22,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                157,
                                                                            height:
                                                                                40,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Colors.white,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              32,
                                                                              0,
                                                                              16),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                flex: 4,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'ФИО',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                                                                      child: Icon(
                                                                                        Icons.arrow_upward,
                                                                                        color: FlutterFlowTheme.of(context).gray2,
                                                                                        size: 12,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 3,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 3,
                                                                                      child: Text(
                                                                                        'Контакты',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).gray2,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 5,
                                                                                child: Text(
                                                                                  'Email',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).gray2,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 3,
                                                                                child: Text(
                                                                                  'Должность',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).gray2,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 4,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Статус',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Text(
                                                                                  'Действие',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).gray2,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Divider(
                                                                          height:
                                                                              1,
                                                                          thickness:
                                                                              1,
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                        ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final users =
                                                                                containerCompanyDocumentRecord!.companyUsers!.toList();
                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: users.length,
                                                                              itemBuilder: (context, usersIndex) {
                                                                                final usersItem = users[usersIndex];
                                                                                return StreamBuilder<UserRecord>(
                                                                                  stream: UserRecord.getDocument(usersItem),
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
                                                                                    final columnUserRecord = snapshot.data!;
                                                                                    return Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                flex: 4,
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    columnUserRecord.displayName,
                                                                                                    'null',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 3,
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    columnUserRecord.phoneNumber,
                                                                                                    'null',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 5,
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    columnUserRecord.email,
                                                                                                    'null',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 3,
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    columnUserRecord.role,
                                                                                                    'null',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Roboto',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 4,
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    FlutterFlowDropDown<String>(
                                                                                                      initialOption: dropDown667ValueMap[usersItem] ??= valueOrDefault<String>(
                                                                                                        columnUserRecord.adminStatus,
                                                                                                        'Активен',
                                                                                                      ),
                                                                                                      options: [
                                                                                                        'Активен',
                                                                                                        'Не активен'
                                                                                                      ],
                                                                                                      onChanged: (val) async {
                                                                                                        setState(() => dropDown667ValueMap[usersItem] = val!);
                                                                                                        logFirebaseEvent('ADMIN_OFFICE_DropDown667_ON_FORM_WIDGET_');
                                                                                                        logFirebaseEvent('DropDown667_backend_call');

                                                                                                        final userUpdateData = createUserRecordData(
                                                                                                          adminStatus: dropDown667ValueMap[usersItem],
                                                                                                        );
                                                                                                        await columnUserRecord.reference.update(userUpdateData);
                                                                                                      },
                                                                                                      width: 180,
                                                                                                      height: 50,
                                                                                                      textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            color: () {
                                                                                                              if (columnUserRecord.adminStatus == 'Не активен') {
                                                                                                                return Color(0xFFE20000);
                                                                                                              } else if (columnUserRecord.adminStatus == 'Активен') {
                                                                                                                return FlutterFlowTheme.of(context).green;
                                                                                                              } else {
                                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                                              }
                                                                                                            }(),
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                          ),
                                                                                                      icon: Icon(
                                                                                                        FFIcons.kicArrowsButtonDown,
                                                                                                        size: 15,
                                                                                                      ),
                                                                                                      fillColor: Colors.white,
                                                                                                      elevation: 2,
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderWidth: 0,
                                                                                                      borderRadius: 0,
                                                                                                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                                                                                                      hidesUnderline: true,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 2,
                                                                                                child: Icon(
                                                                                                  FFIcons.kicDelete,
                                                                                                  color: FlutterFlowTheme.of(context).gray2,
                                                                                                  size: 24,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Divider(
                                                                                          height: 1,
                                                                                          thickness: 1,
                                                                                          color: Color(0xFFEEEEEE),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            if (FFAppState()
                                                                    .adminOfficeType ==
                                                                'Автомойки')
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              24,
                                                                              24,
                                                                              24,
                                                                              24),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              CompaniesRecord>>(
                                                                        stream:
                                                                            queryCompaniesRecord(
                                                                          queryBuilder: (companiesRecord) => companiesRecord.where('admin_created_by', isEqualTo: currentUserReference).where(
                                                                              'status',
                                                                              isNotEqualTo: 'New'),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<CompaniesRecord>
                                                                              wrapCompaniesRecordList =
                                                                              snapshot.data!;
                                                                          return Wrap(
                                                                            spacing:
                                                                                24,
                                                                            runSpacing:
                                                                                24,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children:
                                                                                List.generate(wrapCompaniesRecordList.length, (wrapIndex) {
                                                                              final wrapCompaniesRecord = wrapCompaniesRecordList[wrapIndex];
                                                                              return InkWell(
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('ADMIN_OFFICE_Container_kua68y5o_ON_TAP');
                                                                                  logFirebaseEvent('Container_update_local_state');
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().adminOfficeType = 'current автомойка';
                                                                                    FFAppState().adminOfficeCurrentCompany = wrapCompaniesRecord.reference;
                                                                                  });
                                                                                },
                                                                                child: Container(
                                                                                  width: 312,
                                                                                  height: 138,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).gray2,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 56,
                                                                                              height: 56,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                image: DecorationImage(
                                                                                                  fit: BoxFit.cover,
                                                                                                  image: Image.network(
                                                                                                    valueOrDefault<String>(
                                                                                                      wrapCompaniesRecord.logo,
                                                                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                                                                                    ),
                                                                                                  ).image,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).starblue,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      wrapCompaniesRecord.name,
                                                                                                      'null',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontSize: 18,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        wrapCompaniesRecord.street,
                                                                                                        'null',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).gray1,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Wrap(
                                                                                            spacing: 0,
                                                                                            runSpacing: 0,
                                                                                            alignment: WrapAlignment.start,
                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                            direction: Axis.horizontal,
                                                                                            runAlignment: WrapAlignment.start,
                                                                                            verticalDirection: VerticalDirection.down,
                                                                                            clipBehavior: Clip.none,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                                      child: Text(
                                                                                                        'Город:',
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: FlutterFlowTheme.of(context).gray1,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        wrapCompaniesRecord.city,
                                                                                                        'null',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                                                                                                      child: Text(
                                                                                                        'Статус:',
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: FlutterFlowTheme.of(context).gray1,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      wrapCompaniesRecord.status!,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: () {
                                                                                                              if (wrapCompaniesRecord.status == 'Активная') {
                                                                                                                return FlutterFlowTheme.of(context).green;
                                                                                                              } else if (wrapCompaniesRecord.status == 'Неактивна') {
                                                                                                                return FlutterFlowTheme.of(context).red1;
                                                                                                              } else if (wrapCompaniesRecord.status == 'Модерация') {
                                                                                                                return FlutterFlowTheme.of(context).alternate;
                                                                                                              } else {
                                                                                                                return FlutterFlowTheme.of(context).primaryText;
                                                                                                              }
                                                                                                            }(),
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            24,
                                                                            24,
                                                                            0),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'Button pressed ...');
                                                                      },
                                                                      text:
                                                                          'Добавить',
                                                                      icon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kicPlus,
                                                                        size:
                                                                            22,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            157,
                                                                        height:
                                                                            40,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                            ),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            if (FFAppState()
                                                                    .adminOfficeType ==
                                                                'Акции')
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24,
                                                                            24,
                                                                            24,
                                                                            24),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              288,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).gray2,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16,
                                                                                0,
                                                                                16,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: TextFormField(
                                                                                    controller: textController4,
                                                                                    autofocus: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      hintText: 'Поиск',
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: Color(0xFF8E8E8E),
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                          ),
                                                                                      enabledBorder: InputBorder.none,
                                                                                      focusedBorder: InputBorder.none,
                                                                                      errorBorder: InputBorder.none,
                                                                                      focusedErrorBorder: InputBorder.none,
                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(0, 13, 0, 13),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: Color(0xFF8E8E8E),
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Icon(
                                                                                  FFIcons.kicSearch,
                                                                                  color: FlutterFlowTheme.of(context).gray2,
                                                                                  size: 24,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              'Добавить',
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kicPlus,
                                                                            size:
                                                                                22,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                157,
                                                                            height:
                                                                                40,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Colors.white,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                24,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              color: Colors.white,
                                                                              child: ExpandableNotifier(
                                                                                initialExpanded: false,
                                                                                child: ExpandablePanel(
                                                                                  header: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                                                                                        child: Text(
                                                                                          'Активные',
                                                                                          style: FlutterFlowTheme.of(context).title1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: Colors.black,
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Divider(
                                                                                        height: 1,
                                                                                        thickness: 1,
                                                                                        color: FlutterFlowTheme.of(context).drawer,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  collapsed: Container(),
                                                                                  expanded: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
                                                                                    child: StreamBuilder<List<UserRecord>>(
                                                                                      stream: queryUserRecord(),
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
                                                                                        List<UserRecord> wrapUserRecordList = snapshot.data!;
                                                                                        return Wrap(
                                                                                          spacing: 24,
                                                                                          runSpacing: 24,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: List.generate(wrapUserRecordList.length, (wrapIndex) {
                                                                                            final wrapUserRecord = wrapUserRecordList[wrapIndex];
                                                                                            return Container(
                                                                                              width: 376,
                                                                                              height: 312,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).gray4,
                                                                                                ),
                                                                                              ),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(0),
                                                                                                      bottomRight: Radius.circular(0),
                                                                                                      topLeft: Radius.circular(8),
                                                                                                      topRight: Radius.circular(8),
                                                                                                    ),
                                                                                                    child: Image.network(
                                                                                                      'https://picsum.photos/seed/421/600',
                                                                                                      width: double.infinity,
                                                                                                      height: 152,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Узнавайте о снижении цен',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                fontSize: 16,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                              ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                          child: Text(
                                                                                                            'Удобное расположение, центр города Алматы. Полный спектр услуг, мойка...',
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Архивировать',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                    ),
                                                                                                              ),
                                                                                                              FFButtonWidget(
                                                                                                                onPressed: () {
                                                                                                                  print('Button pressed ...');
                                                                                                                },
                                                                                                                text: 'Подробнее',
                                                                                                                options: FFButtonOptions(
                                                                                                                  width: 121,
                                                                                                                  height: 40,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        color: Colors.white,
                                                                                                                        fontSize: 14,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                                                      ),
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: Colors.transparent,
                                                                                                                    width: 1,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                                ),
                                                                                                                showLoadingIndicator: false,
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            );
                                                                                          }),
                                                                                        );
                                                                                      },
                                                                                    ),
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
                                                                          ),
                                                                        ],
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
                                                  if (FFAppState()
                                                          .adminOfficeType ==
                                                      'current автомойка')
                                                    FutureBuilder<
                                                        CompaniesRecord>(
                                                      future: CompaniesRecord
                                                          .getDocumentOnce(
                                                              FFAppState()
                                                                  .adminOfficeCurrentCompany!),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        final currentCompanyCompaniesRecord =
                                                            snapshot.data!;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 1224,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child:
                                                                      Visibility(
                                                                    visible:
                                                                        loggedIn,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              24,
                                                                              24,
                                                                              24,
                                                                              24),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 56,
                                                                                height: 56,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.cover,
                                                                                    image: Image.network(
                                                                                      valueOrDefault<String>(
                                                                                        currentCompanyCompaniesRecord.logo,
                                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                                                                      ),
                                                                                    ).image,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).starblue,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 40, 0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        currentCompanyCompaniesRecord.name,
                                                                                        'null',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 18,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          currentCompanyCompaniesRecord.street,
                                                                                          'null',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).gray1,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                24,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 392,
                                                                                  height: 406,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFFEEEEEE),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Основная информация',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                                                                                          child: Text(
                                                                                            'Наименование автомойки',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            currentCompanyCompaniesRecord.tooName,
                                                                                            'null',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                                                                                          child: Text(
                                                                                            'ФИО руководителя',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            currentCompanyCompaniesRecord.fioAdmin,
                                                                                            'null',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                                                                                          child: Text(
                                                                                            'Номер договора',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          '№${valueOrDefault<String>(
                                                                                            currentCompanyCompaniesRecord.numDogovor?.toString(),
                                                                                            'null',
                                                                                          )}',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                                                                                          child: Text(
                                                                                            'Дата заключения договора',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  fontSize: 14,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            dateTimeFormat(
                                                                                              'd/M/y',
                                                                                              currentCompanyCompaniesRecord.dateDogovor,
                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                            ),
                                                                                            'null',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 16,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 760,
                                                                                        height: 144,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                          border: Border.all(
                                                                                            color: Color(0xFFEEEEEE),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Основная информация',
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontSize: 18,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 26, 0, 0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                                      child: Container(
                                                                                                        width: 346,
                                                                                                        child: TextFormField(
                                                                                                          controller: textController5 ??= TextEditingController(
                                                                                                            text: valueOrDefault<String>(
                                                                                                              currentCompanyCompaniesRecord.binIin?.toString(),
                                                                                                              'null',
                                                                                                            ),
                                                                                                          ),
                                                                                                          readOnly: true,
                                                                                                          obscureText: false,
                                                                                                          decoration: InputDecoration(
                                                                                                            labelText: 'БИН',
                                                                                                            labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 12,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                ),
                                                                                                            hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 12,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                ),
                                                                                                            enabledBorder: OutlineInputBorder(
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).gray2,
                                                                                                                width: 1,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                            ),
                                                                                                            focusedBorder: OutlineInputBorder(
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).gray2,
                                                                                                                width: 1,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                            ),
                                                                                                            errorBorder: OutlineInputBorder(
                                                                                                              borderSide: BorderSide(
                                                                                                                color: Color(0x00000000),
                                                                                                                width: 1,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                            ),
                                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                                              borderSide: BorderSide(
                                                                                                                color: Color(0x00000000),
                                                                                                                width: 1,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                            ),
                                                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 16,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      width: 346,
                                                                                                      child: TextFormField(
                                                                                                        controller: textController6 ??= TextEditingController(
                                                                                                          text: valueOrDefault<String>(
                                                                                                            currentCompanyCompaniesRecord.iban,
                                                                                                            'null',
                                                                                                          ),
                                                                                                        ),
                                                                                                        readOnly: true,
                                                                                                        obscureText: false,
                                                                                                        decoration: InputDecoration(
                                                                                                          labelText: 'IBAN',
                                                                                                          labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 12,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                              ),
                                                                                                          hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 12,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                              ),
                                                                                                          enabledBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).gray2,
                                                                                                              width: 1,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                          ),
                                                                                                          focusedBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).gray2,
                                                                                                              width: 1,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                          ),
                                                                                                          errorBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Color(0x00000000),
                                                                                                              width: 1,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                          ),
                                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Color(0x00000000),
                                                                                                              width: 1,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                          ),
                                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 16,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                                                        child: Container(
                                                                                          width: 760,
                                                                                          height: 144,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                            border: Border.all(
                                                                                              color: Color(0xFFEEEEEE),
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Местоположение',
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        fontSize: 18,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 26, 0, 0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                                                                                        child: Container(
                                                                                                          width: 346,
                                                                                                          child: TextFormField(
                                                                                                            controller: textController7 ??= TextEditingController(
                                                                                                              text: valueOrDefault<String>(
                                                                                                                currentCompanyCompaniesRecord.iban,
                                                                                                                'null',
                                                                                                              ),
                                                                                                            ),
                                                                                                            readOnly: true,
                                                                                                            obscureText: false,
                                                                                                            decoration: InputDecoration(
                                                                                                              labelText: 'Город',
                                                                                                              labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    fontSize: 12,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                  ),
                                                                                                              hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    fontSize: 12,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                  ),
                                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: FlutterFlowTheme.of(context).gray2,
                                                                                                                  width: 1,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                              ),
                                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: FlutterFlowTheme.of(context).gray2,
                                                                                                                  width: 1,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                              ),
                                                                                                              errorBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: Color(0x00000000),
                                                                                                                  width: 1,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                              ),
                                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: Color(0x00000000),
                                                                                                                  width: 1,
                                                                                                                ),
                                                                                                                borderRadius: BorderRadius.circular(8),
                                                                                                              ),
                                                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 16,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 346,
                                                                                                        child: TextFormField(
                                                                                                          controller: textController8 ??= TextEditingController(
                                                                                                            text: valueOrDefault<String>(
                                                                                                              currentCompanyCompaniesRecord.street,
                                                                                                              'null',
                                                                                                            ),
                                                                                                          ),
                                                                                                          readOnly: true,
                                                                                                          obscureText: false,
                                                                                                          decoration: InputDecoration(
                                                                                                            labelText: 'Адрес',
                                                                                                            labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 12,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                ),
                                                                                                            hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 12,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                ),
                                                                                                            enabledBorder: OutlineInputBorder(
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).gray2,
                                                                                                                width: 1,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                            ),
                                                                                                            focusedBorder: OutlineInputBorder(
                                                                                                              borderSide: BorderSide(
                                                                                                                color: FlutterFlowTheme.of(context).gray2,
                                                                                                                width: 1,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                            ),
                                                                                                            errorBorder: OutlineInputBorder(
                                                                                                              borderSide: BorderSide(
                                                                                                                color: Color(0x00000000),
                                                                                                                width: 1,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                            ),
                                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                                              borderSide: BorderSide(
                                                                                                                color: Color(0x00000000),
                                                                                                                width: 1,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(8),
                                                                                                            ),
                                                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 16,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
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
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          24,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              24,
                                                                              24,
                                                                              24,
                                                                              24),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Детали',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 18,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                    ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                    child: Icon(
                                                                                      FFIcons.kicEdit,
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 24,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Изменить',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 29, 24, 0),
                                                                                child: Container(
                                                                                  width: 335,
                                                                                  height: 142,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).gray4,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Количество боксов',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                                                          child: Container(
                                                                                            width: 346,
                                                                                            child: TextFormField(
                                                                                              controller: textController9 ??= TextEditingController(
                                                                                                text: valueOrDefault<String>(
                                                                                                  currentCompanyCompaniesRecord.countBox?.toString(),
                                                                                                  'null',
                                                                                                ),
                                                                                              ),
                                                                                              readOnly: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 12,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 12,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).gray4,
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).gray4,
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 16,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 29, 24, 0),
                                                                                child: Container(
                                                                                  width: 335,
                                                                                  height: 142,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).gray4,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Номер телефона',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                                                          child: Container(
                                                                                            width: 346,
                                                                                            child: TextFormField(
                                                                                              controller: textController10 ??= TextEditingController(
                                                                                                text: valueOrDefault<String>(
                                                                                                  currentCompanyCompaniesRecord.phoneNum,
                                                                                                  'null',
                                                                                                ),
                                                                                              ),
                                                                                              readOnly: true,
                                                                                              obscureText: false,
                                                                                              decoration: InputDecoration(
                                                                                                labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 12,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                    ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      fontSize: 12,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).gray4,
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).gray4,
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: Color(0x00000000),
                                                                                                    width: 1,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                                ),
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 16,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                  ),
                                                                                              keyboardType: TextInputType.phone,
                                                                                              inputFormatters: [textFieldMask8],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 29, 24, 0),
                                                                                child: Container(
                                                                                  width: 458,
                                                                                  height: 142,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).gray4,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          'График работы',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 24, 0),
                                                                                              child: Container(
                                                                                                width: 181,
                                                                                                child: TextFormField(
                                                                                                  controller: textController11 ??= TextEditingController(
                                                                                                    text: valueOrDefault<String>(
                                                                                                      currentCompanyCompaniesRecord.openTime,
                                                                                                      'null',
                                                                                                    ),
                                                                                                  ),
                                                                                                  readOnly: true,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    labelText: 'Начало работы',
                                                                                                    labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).gray4,
                                                                                                        width: 1,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).gray4,
                                                                                                        width: 1,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                    errorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0x00000000),
                                                                                                        width: 1,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0x00000000),
                                                                                                        width: 1,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                                    ),
                                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                                                                child: Container(
                                                                                                  width: 181,
                                                                                                  child: TextFormField(
                                                                                                    controller: textController12 ??= TextEditingController(
                                                                                                      text: valueOrDefault<String>(
                                                                                                        currentCompanyCompaniesRecord.closeTime,
                                                                                                        'null',
                                                                                                      ),
                                                                                                    ),
                                                                                                    readOnly: true,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelText: 'Конец работы',
                                                                                                      labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                          ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).gray4,
                                                                                                          width: 1,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).gray4,
                                                                                                          width: 1,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Color(0x00000000),
                                                                                                          width: 1,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Color(0x00000000),
                                                                                                          width: 1,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 16,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          24,
                                                                          0,
                                                                          0),
                                                                  child: Row(
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
                                                                            100),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              704,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24,
                                                                                24,
                                                                                24,
                                                                                24),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Услуги',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Inter',
                                                                                            fontSize: 18,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                          child: Icon(
                                                                                            FFIcons.kicEdit,
                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                            size: 24,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          'Изменить',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('ADMIN_OFFICE_Container_bldf4n7a_ON_TAP');
                                                                                              logFirebaseEvent('Container_update_local_state');
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().adminSelectServicesBody = 'Седан';
                                                                                              });
                                                                                              logFirebaseEvent('Container_refresh_database_request');
                                                                                              setState(() => _firestoreRequestCompleter = null);
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 171,
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().adminSelectServicesBody == 'Седан' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(8),
                                                                                                  bottomRight: Radius.circular(0),
                                                                                                  topLeft: Radius.circular(8),
                                                                                                  topRight: Radius.circular(0),
                                                                                                ),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1, 0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    'Седан',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            FFAppState().adminSelectServicesBody == 'Седан' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('ADMIN_OFFICE_Container_18t127x8_ON_TAP');
                                                                                              logFirebaseEvent('Container_update_local_state');
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().adminSelectServicesBody = 'Хетчбэк';
                                                                                              });
                                                                                              logFirebaseEvent('Container_refresh_database_request');
                                                                                              setState(() => _firestoreRequestCompleter = null);
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 171,
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().adminSelectServicesBody == 'Хетчбэк' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(8),
                                                                                                  bottomRight: Radius.circular(0),
                                                                                                  topLeft: Radius.circular(8),
                                                                                                  topRight: Radius.circular(0),
                                                                                                ),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1, 0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    'Хетчбэк',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            FFAppState().adminSelectServicesBody == 'Хетчбэк' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('ADMIN_OFFICE_Container_7gen624l_ON_TAP');
                                                                                              logFirebaseEvent('Container_update_local_state');
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().adminSelectServicesBody = 'Кроссовер';
                                                                                              });
                                                                                              logFirebaseEvent('Container_refresh_database_request');
                                                                                              setState(() => _firestoreRequestCompleter = null);
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 171,
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().adminSelectServicesBody == 'Кроссовер' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(8),
                                                                                                  bottomRight: Radius.circular(0),
                                                                                                  topLeft: Radius.circular(8),
                                                                                                  topRight: Radius.circular(0),
                                                                                                ),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1, 0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    'Кроссовер',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            FFAppState().adminSelectServicesBody == 'Кроссовер' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('ADMIN_OFFICE_Container_z3fxsff8_ON_TAP');
                                                                                              logFirebaseEvent('Container_update_local_state');
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().adminSelectServicesBody = 'Внедорожник';
                                                                                              });
                                                                                              logFirebaseEvent('Container_refresh_database_request');
                                                                                              setState(() => _firestoreRequestCompleter = null);
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 171,
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().adminSelectServicesBody == 'Внедорожник' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(8),
                                                                                                  bottomRight: Radius.circular(0),
                                                                                                  topLeft: Radius.circular(8),
                                                                                                  topRight: Radius.circular(0),
                                                                                                ),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1, 0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    'Внедорожник',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            FFAppState().adminSelectServicesBody == 'Внедорожник' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('ADMIN_OFFICE_Container_zxp67o14_ON_TAP');
                                                                                              logFirebaseEvent('Container_update_local_state');
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().adminSelectServicesBody = 'Пикап';
                                                                                              });
                                                                                              logFirebaseEvent('Container_refresh_database_request');
                                                                                              setState(() => _firestoreRequestCompleter = null);
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 171,
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().adminSelectServicesBody == 'Пикап' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(8),
                                                                                                  bottomRight: Radius.circular(0),
                                                                                                  topLeft: Radius.circular(8),
                                                                                                  topRight: Radius.circular(0),
                                                                                                ),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1, 0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    'Пикап',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            FFAppState().adminSelectServicesBody == 'Пикап' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('ADMIN_OFFICE_Container_dozdyjwg_ON_TAP');
                                                                                              logFirebaseEvent('Container_update_local_state');
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().adminSelectServicesBody = 'Минивен';
                                                                                              });
                                                                                              logFirebaseEvent('Container_refresh_database_request');
                                                                                              setState(() => _firestoreRequestCompleter = null);
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 171,
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().adminSelectServicesBody == 'Минивен' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(8),
                                                                                                  bottomRight: Radius.circular(0),
                                                                                                  topLeft: Radius.circular(8),
                                                                                                  topRight: Radius.circular(0),
                                                                                                ),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1, 0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    'Минивен',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            FFAppState().adminSelectServicesBody == 'Минивен' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('ADMIN_OFFICE_Container_vquwbcw8_ON_TAP');
                                                                                              logFirebaseEvent('Container_update_local_state');
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().adminSelectServicesBody = 'Купе';
                                                                                              });
                                                                                              logFirebaseEvent('Container_refresh_database_request');
                                                                                              setState(() => _firestoreRequestCompleter = null);
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 171,
                                                                                              height: 40,
                                                                                              decoration: BoxDecoration(
                                                                                                color: valueOrDefault<Color>(
                                                                                                  FFAppState().adminSelectServicesBody == 'Купе' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  FlutterFlowTheme.of(context).primaryBackground,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(8),
                                                                                                  bottomRight: Radius.circular(0),
                                                                                                  topLeft: Radius.circular(8),
                                                                                                  topRight: Radius.circular(0),
                                                                                                ),
                                                                                              ),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(-1, 0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                  child: Text(
                                                                                                    'Купе',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: valueOrDefault<Color>(
                                                                                                            FFAppState().adminSelectServicesBody == 'Купе' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                                                          ),
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Container(
                                                                                        width: 485,
                                                                                        height: 300,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(8),
                                                                                            bottomRight: Radius.circular(8),
                                                                                            topLeft: Radius.circular(0),
                                                                                            topRight: Radius.circular(8),
                                                                                          ),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).gray4,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                          child: FutureBuilder<List<CompanyServicesRecord>>(
                                                                                            future: (_firestoreRequestCompleter ??= Completer<List<CompanyServicesRecord>>()
                                                                                                  ..complete(queryCompanyServicesRecordOnce(
                                                                                                    parent: currentCompanyCompaniesRecord.reference,
                                                                                                    queryBuilder: (companyServicesRecord) => companyServicesRecord.where('car_body', isEqualTo: FFAppState().adminSelectServicesBody),
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
                                                                                              List<CompanyServicesRecord> listViewCompanyServicesRecordList = snapshot.data!;
                                                                                              return RefreshIndicator(
                                                                                                onRefresh: () async {
                                                                                                  logFirebaseEvent('ADMIN_OFFICE_ListView_4iou0i81_ON_PULL_T');
                                                                                                  logFirebaseEvent('ListView_refresh_database_request');
                                                                                                  setState(() => _firestoreRequestCompleter = null);
                                                                                                  await waitForFirestoreRequestCompleter();
                                                                                                },
                                                                                                child: ListView.builder(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  scrollDirection: Axis.vertical,
                                                                                                  itemCount: listViewCompanyServicesRecordList.length,
                                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                                    final listViewCompanyServicesRecord = listViewCompanyServicesRecordList[listViewIndex];
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            flex: 4,
                                                                                                            child: Text(
                                                                                                              listViewCompanyServicesRecord.name!,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              '${listViewCompanyServicesRecord.price?.toString()}₸',
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 496,
                                                                              height: 208,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(8),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Удобства',
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                              ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                                                                              child: Icon(
                                                                                                FFIcons.kicEdit,
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                size: 24,
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              'Изменить',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 113,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).gray4,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              currentCompanyCompaniesRecord.conveniences,
                                                                                              'null',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                                  fontSize: 16,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      if (!(containerCompanyDocumentRecord !=
                                          null))
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 32, 0, 24),
                                                child: Text(
                                                  'Кабинет',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 24,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: 1224,
                                                height: 294,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 62, 0, 0),
                                                      child: Container(
                                                        width: 48,
                                                        height: 48,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          FFIcons.kicVisitors,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 24,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 16, 0, 0),
                                                      child: Text(
                                                        'Регистрация компании',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 14,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 8, 0, 0),
                                                      child: Text(
                                                        'Введите данные компании и \nпройдите модерацию.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .gray2,
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 25, 0, 0),
                                                      child: StreamBuilder<
                                                          List<
                                                              CompaniesRecord>>(
                                                        stream:
                                                            queryCompaniesRecord(
                                                          queryBuilder: (companiesRecord) =>
                                                              companiesRecord
                                                                  .where(
                                                                      'admin_created_by',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'new'),
                                                          singleRecord: true,
                                                        ),
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
                                                          List<CompaniesRecord>
                                                              containerCompaniesRecordList =
                                                              snapshot.data!;
                                                          final containerCompaniesRecord =
                                                              containerCompaniesRecordList
                                                                      .isNotEmpty
                                                                  ? containerCompaniesRecordList
                                                                      .first
                                                                  : null;
                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                if (containerCompaniesRecord !=
                                                                    null)
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'ADMIN_OFFICE_PAGE_docExists_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'docExists_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'admin_add_company_1',
                                                                        queryParams:
                                                                            {
                                                                          'company':
                                                                              serializeParam(
                                                                            containerCompaniesRecord!.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.fade,
                                                                            duration:
                                                                                Duration(milliseconds: 0),
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Text(
                                                                          'Зарегестрировать кампанию',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                if (!(containerCompaniesRecord !=
                                                                    null))
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'ADMIN_OFFICE_PAGE_docNotExists_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'docNotExists_backend_call');

                                                                      final companiesCreateData =
                                                                          {
                                                                        ...createCompaniesRecordData(
                                                                          status:
                                                                              'new',
                                                                          adminCreatedBy:
                                                                              currentUserReference,
                                                                        ),
                                                                        'listServices':
                                                                            FFAppState().adminForCarServices,
                                                                      };
                                                                      var companiesRecordReference = CompaniesRecord
                                                                          .collection
                                                                          .doc();
                                                                      await companiesRecordReference
                                                                          .set(
                                                                              companiesCreateData);
                                                                      addCompany = CompaniesRecord.getDocumentFromData(
                                                                          companiesCreateData,
                                                                          companiesRecordReference);
                                                                      logFirebaseEvent(
                                                                          'docNotExists_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        'admin_add_company_1',
                                                                        queryParams:
                                                                            {
                                                                          'company':
                                                                              serializeParam(
                                                                            addCompany!.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Text(
                                                                          'Зарегестрировать кампанию',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
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
                                                    ),
                                                  ],
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
                          ),
                        );
                      },
                    ),
                  ),
                  if (FFAppState().adminOfficeType == 'Редактировать данные')
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              color: Color(0x4DDEDEDE),
                              offset: Offset(0, -4),
                            )
                          ],
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Container(
                            width: 1224,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ADMIN_OFFICE_PAGE_СОХРАНИТЬ_BTN_ON_TAP');
                                  if (uploadedFileUrl != null &&
                                      uploadedFileUrl != '') {
                                    logFirebaseEvent('Button_backend_call');

                                    final userUpdateData = createUserRecordData(
                                      displayName: editFIOController!.text,
                                      phoneNumber: editPhoneController!.text,
                                      photoUrl: uploadedFileUrl,
                                    );
                                    await currentUserReference!
                                        .update(userUpdateData);
                                  } else {
                                    logFirebaseEvent('Button_backend_call');

                                    final userUpdateData = createUserRecordData(
                                      displayName: editFIOController!.text,
                                      phoneNumber: editPhoneController!.text,
                                    );
                                    await currentUserReference!
                                        .update(userUpdateData);
                                  }

                                  logFirebaseEvent('Button_update_local_state');
                                  FFAppState().update(() {
                                    FFAppState().adminOfficeType =
                                        'Личные данные';
                                  });
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Успешно!',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryColor,
                                    ),
                                  );
                                },
                                text: 'Сохранить',
                                options: FFButtonOptions(
                                  width: 185,
                                  height: 48,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2Family),
                                      ),
                                  elevation: 0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              AdminAppBarInfoWidget(),
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

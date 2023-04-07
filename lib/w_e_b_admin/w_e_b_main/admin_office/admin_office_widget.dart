import '/auth/auth_util.dart';
import '/auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/admin_add_sales/admin_add_sales_widget.dart';
import '/components/admin_app_bar/admin_app_bar_widget.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/components/admin_edit_stuff_status_widget.dart';
import '/components/admin_reset_password/admin_reset_password_widget.dart';
import '/components/admin_sales_active_empty/admin_sales_active_empty_widget.dart';
import '/components/admin_sales_archive_empty/admin_sales_archive_empty_widget.dart';
import '/components/admin_sales_details/admin_sales_details_widget.dart';
import '/components/admin_sales_moderation_empty/admin_sales_moderation_empty_widget.dart';
import '/components/success/success_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'admin_office_model.dart';
export 'admin_office_model.dart';

class AdminOfficeWidget extends StatefulWidget {
  const AdminOfficeWidget({
    Key? key,
    bool? success,
  })  : this.success = success ?? false,
        super(key: key);

  final bool success;

  @override
  _AdminOfficeWidgetState createState() => _AdminOfficeWidgetState();
}

class _AdminOfficeWidgetState extends State<AdminOfficeWidget> {
  late AdminOfficeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminOfficeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().adminOfficeType == null ||
          FFAppState().adminOfficeType == '') {
        FFAppState().update(() {
          FFAppState().adminOfficeType = 'Личные данные';
        });
      }
      if (FFAppState().adminSelectServicesBody == null ||
          FFAppState().adminSelectServicesBody == '') {
        FFAppState().update(() {
          FFAppState().adminSelectServicesBody = 'Седан';
        });
      }
      if (widget.success) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: Color(0x00000000),
          enableDrag: false,
          context: context,
          builder: (bottomSheetContext) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Padding(
                padding: MediaQuery.of(bottomSheetContext).viewInsets,
                child: SuccessWidget(
                  message: 'Сотрудник успешно добавлен',
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));
      }
    });

    _model.emailController ??= TextEditingController(text: currentUserEmail);
    _model.editFIOController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.editPhoneController ??=
        TextEditingController(text: currentPhoneNumber);
    _model.textController3 ??= TextEditingController();
    _model.textController4 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  wrapWithModel(
                    model: _model.adminAppBarModel,
                    updateCallback: () => setState(() {}),
                    child: AdminAppBarWidget(
                      pageName: 'Кабинет',
                    ),
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
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
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
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: StreamBuilder<List<CompaniesRecord>>(
                            stream: queryCompaniesRecord(
                              queryBuilder: (companiesRecord) =>
                                  companiesRecord.where('company_users',
                                      arrayContains: currentUserReference),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<CompaniesRecord> scrollCompaniesRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final scrollCompaniesRecord =
                                  scrollCompaniesRecordList.isNotEmpty
                                      ? scrollCompaniesRecordList.first
                                      : null;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 1224.0,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (scrollCompaniesRecord != null)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (containerCompanyDocumentRecord!
                                                        .status ==
                                                    'Модерация')
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  60.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Image.asset(
                                                            'assets/images/img_moderation.png',
                                                            width: 130.0,
                                                            height: 130.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        26.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Компания на модерации',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontSize:
                                                                        24.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Ваша кампания успешно создана и проходит\nмодерацию. Заявку можете посмотреть в разделе \n‘Главная’.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        42.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'admin_main');
                                                              },
                                                              text:
                                                                  'Перейти в раздел “Главная”',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 392.0,
                                                                height: 48.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
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
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
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
                                                                    0.0,
                                                                    32.0,
                                                                    0.0,
                                                                    24.0),
                                                        child: Text(
                                                          'Кабинет',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
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
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              onTap: () async {
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            17.0),
                                                                    child: Text(
                                                                      'Личные данные',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color: FFAppState().adminOfficeType == 'Личные данные'
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).webUnselectedColor,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        122.0,
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FFAppState().adminOfficeType ==
                                                                              'Личные данные'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.role,
                                                                  '') !=
                                                              'Администратор')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            17.0),
                                                                        child:
                                                                            Text(
                                                                          'Автомойки',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FFAppState().adminOfficeType == 'Автомойки' ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).webUnselectedColor,
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            85.0,
                                                                        height:
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: FFAppState().adminOfficeType == 'Автомойки'
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              onTap: () async {
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            17.0),
                                                                    child: Text(
                                                                      'Акции',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color: FFAppState().adminOfficeType == 'Акции'
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).webUnselectedColor,
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 48.0,
                                                                    height: 1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FFAppState().adminOfficeType ==
                                                                              'Акции'
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          if (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.role,
                                                                  '') !=
                                                              'Администратор')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            17.0),
                                                                        child:
                                                                            Text(
                                                                          'Сотрудники',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FFAppState().adminOfficeType == 'Сотрудники' ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).webUnselectedColor,
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            88.0,
                                                                        height:
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: FFAppState().adminOfficeType == 'Сотрудники'
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                            width: 1224.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                if (FFAppState()
                                                                        .adminOfficeType ==
                                                                    'Личные данные')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            48.0,
                                                                            48.0,
                                                                            48.0,
                                                                            48.0),
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
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              24.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  'Основная информация',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 18.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().adminOfficeType = 'Редактировать данные';
                                                                                  });
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                      child: Icon(
                                                                                        FFIcons.kicEdit,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Редактировать',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    if (_model.emailController.text.isEmpty) {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Email required!',
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                      return;
                                                                                    }
                                                                                    await resetPassword(
                                                                                      email: _model.emailController.text,
                                                                                      context: context,
                                                                                    );
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      barrierColor: Color(0x00000000),
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (bottomSheetContext) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                            child: AdminResetPasswordWidget(
                                                                                              emaill: currentUserEmail,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                        child: Icon(
                                                                                          FFIcons.kicRefresh,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Изменить пароль',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            AuthUserStreamWidget(
                                                                              builder: (context) => Container(
                                                                                width: 80.0,
                                                                                height: 80.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  valueOrDefault<String>(
                                                                                    currentUserPhoto,
                                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                                                                  ),
                                                                                  fit: BoxFit.contain,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                    child: AuthUserStreamWidget(
                                                                                      builder: (context) => Text(
                                                                                        '${currentUserDisplayName} null',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 18.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      currentUserEmail,
                                                                                      'null',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).gray2,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: TextFormField(
                                                                                controller: _model.emailController,
                                                                                readOnly: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  hintText: '[Some hint text...]',
                                                                                  enabledBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  errorBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                  focusedErrorBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Color(0x00000000),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      topLeft: Radius.circular(4.0),
                                                                                      topRight: Radius.circular(4.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: Color(0x00FFFFFF),
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                                validator: _model.emailControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Номер телефона',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: AuthUserStreamWidget(
                                                                                        builder: (context) => Text(
                                                                                          currentPhoneNumber,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 16.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Дата регистрации',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 16.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Должность',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Руководитель',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Компания',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        containerCompanyDocumentRecord!.companyName!,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 16.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            48.0,
                                                                            48.0,
                                                                            48.0,
                                                                            48.0),
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
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              24.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Expanded(
                                                                                child: Text(
                                                                                  'Основная информация',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 18.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  FFAppState().update(() {
                                                                                    FFAppState().adminOfficeType = 'Личные данные';
                                                                                  });
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 6.0, 0.0),
                                                                                      child: Icon(
                                                                                        FFIcons.kicClose,
                                                                                        color: Color(0xFF1A1A1A),
                                                                                        size: 16.0,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      'Отменить',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: Color(0xFF1A1A1A),
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Form(
                                                                          key: _model
                                                                              .formKey,
                                                                          autovalidateMode:
                                                                              AutovalidateMode.disabled,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                    context: context,
                                                                                    allowPhoto: true,
                                                                                  );
                                                                                  if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                    setState(() => _model.isDataUploading = true);
                                                                                    var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                    var downloadUrls = <String>[];
                                                                                    try {
                                                                                      selectedUploadedFiles = selectedMedia
                                                                                          .map((m) => FFUploadedFile(
                                                                                                name: m.storagePath.split('/').last,
                                                                                                bytes: m.bytes,
                                                                                                height: m.dimensions?.height,
                                                                                                width: m.dimensions?.width,
                                                                                              ))
                                                                                          .toList();

                                                                                      downloadUrls = (await Future.wait(
                                                                                        selectedMedia.map(
                                                                                          (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                        ),
                                                                                      ))
                                                                                          .where((u) => u != null)
                                                                                          .map((u) => u!)
                                                                                          .toList();
                                                                                    } finally {
                                                                                      _model.isDataUploading = false;
                                                                                    }
                                                                                    if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                      setState(() {
                                                                                        _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                                                        _model.uploadedFileUrl = downloadUrls.first;
                                                                                      });
                                                                                    } else {
                                                                                      setState(() {});
                                                                                      return;
                                                                                    }
                                                                                  }
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    AuthUserStreamWidget(
                                                                                      builder: (context) => Container(
                                                                                        width: 80.0,
                                                                                        height: 80.0,
                                                                                        clipBehavior: Clip.antiAlias,
                                                                                        decoration: BoxDecoration(
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                        child: Image.network(
                                                                                          _model.uploadedFileUrl != null && _model.uploadedFileUrl != ''
                                                                                              ? _model.uploadedFileUrl
                                                                                              : valueOrDefault<String>(
                                                                                                  currentUserPhoto,
                                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/39tzmh1sizl4/Group_668.png',
                                                                                                ),
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        'Заменить фото',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 14.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => Container(
                                                                                    width: 356.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.editFIOController,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'ФИО',
                                                                                        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
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
                                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 16.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      validator: _model.editFIOControllerValidator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: AuthUserStreamWidget(
                                                                                  builder: (context) => Container(
                                                                                    width: 356.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.editPhoneController,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelText: 'Номер телефона',
                                                                                        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 12.0,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
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
                                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 16.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                      validator: _model.editPhoneControllerValidator.asValidator(context),
                                                                                      inputFormatters: [
                                                                                        _model.editPhoneMask
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
                                                                if (FFAppState()
                                                                        .adminOfficeType ==
                                                                    'Сотрудники')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            24.0,
                                                                            24.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              width: 288.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).gray2,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController3,
                                                                                        autofocus: true,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          hintText: 'Поиск',
                                                                                          hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: Color(0xFF8E8E8E),
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                          enabledBorder: InputBorder.none,
                                                                                          focusedBorder: InputBorder.none,
                                                                                          errorBorder: InputBorder.none,
                                                                                          focusedErrorBorder: InputBorder.none,
                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: Color(0xFF8E8E8E),
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        validator: _model.textController3Validator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                    Icon(
                                                                                      FFIcons.kicSearch,
                                                                                      color: FlutterFlowTheme.of(context).gray2,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  'admin_add_staff_1',
                                                                                  queryParams: {
                                                                                    'companyDocument': serializeParam(
                                                                                      containerCompanyDocumentRecord,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'companyDocument': containerCompanyDocumentRecord,
                                                                                  },
                                                                                );

                                                                                setState(() {
                                                                                  FFAppState().addStuffuserRef = null;
                                                                                });
                                                                              },
                                                                              text: 'Добавить',
                                                                              icon: Icon(
                                                                                FFIcons.kicPlus,
                                                                                size: 22.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: 157.0,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 16.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Text(
                                                                                          'ФИО',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).gray2,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.arrow_upward,
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            size: 12.0,
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
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).gray2,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Text(
                                                                                      'Должность',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: FlutterFlowTheme.of(context).gray2,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 2,
                                                                                    child: Text(
                                                                                      'Действие',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).gray2,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Divider(
                                                                              height: 1.0,
                                                                              thickness: 1.0,
                                                                              color: Color(0xFFEEEEEE),
                                                                            ),
                                                                            Builder(
                                                                              builder: (context) {
                                                                                final users = containerCompanyDocumentRecord!.companyUsers!.toList();
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
                                                                                              width: 50.0,
                                                                                              height: 50.0,
                                                                                              child: CircularProgressIndicator(
                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        final columnUserRecord = snapshot.data!;
                                                                                        return Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
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
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Roboto',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    flex: 4,
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        if (columnUserRecord.reference != currentUserReference)
                                                                                                          AdminEditStuffStatusWidget(
                                                                                                            key: Key('Keygb1_${usersIndex}_of_${users.length}'),
                                                                                                            user: columnUserRecord,
                                                                                                          ),
                                                                                                        if (columnUserRecord.reference == currentUserReference)
                                                                                                          Container(
                                                                                                            width: 100.0,
                                                                                                            height: 20.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  if (columnUserRecord.reference != currentUserReference)
                                                                                                    Expanded(
                                                                                                      flex: 2,
                                                                                                      child: InkWell(
                                                                                                        onTap: () async {
                                                                                                          final userUpdateData = {
                                                                                                            ...createUserRecordData(
                                                                                                              addedCompany: false,
                                                                                                            ),
                                                                                                            'role': FieldValue.delete(),
                                                                                                            'admin_status': FieldValue.delete(),
                                                                                                            'merchan_document': FieldValue.delete(),
                                                                                                          };
                                                                                                          await columnUserRecord.reference.update(userUpdateData);

                                                                                                          final companiesUpdateData = {
                                                                                                            'company_users': FieldValue.arrayRemove([columnUserRecord.reference]),
                                                                                                          };
                                                                                                          await scrollCompaniesRecord!.reference.update(companiesUpdateData);

                                                                                                          final companyDocumentUpdateData = {
                                                                                                            'company_users': FieldValue.arrayRemove([columnUserRecord.reference]),
                                                                                                          };
                                                                                                          await containerCompanyDocumentRecord!.reference.update(companyDocumentUpdateData);

                                                                                                          context.goNamed(
                                                                                                            'admin_office',
                                                                                                            queryParams: {
                                                                                                              'success': serializeParam(
                                                                                                                true,
                                                                                                                ParamType.bool,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        },
                                                                                                        child: Icon(
                                                                                                          FFIcons.kicDelete,
                                                                                                          color: FlutterFlowTheme.of(context).gray2,
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  if (columnUserRecord.reference == currentUserReference)
                                                                                                    Expanded(
                                                                                                      flex: 2,
                                                                                                      child: Icon(
                                                                                                        FFIcons.kicDelete,
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Divider(
                                                                                              height: 1.0,
                                                                                              thickness: 1.0,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              24.0,
                                                                              24.0,
                                                                              24.0),
                                                                          child:
                                                                              StreamBuilder<List<CompaniesRecord>>(
                                                                            stream:
                                                                                queryCompaniesRecord(
                                                                              queryBuilder: (companiesRecord) => companiesRecord.where('admin_created_by', isEqualTo: currentUserReference).where('status', isNotEqualTo: 'New'),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              List<CompaniesRecord> wrapCompaniesRecordList = snapshot.data!;
                                                                              return Wrap(
                                                                                spacing: 24.0,
                                                                                runSpacing: 24.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: List.generate(wrapCompaniesRecordList.length, (wrapIndex) {
                                                                                  final wrapCompaniesRecord = wrapCompaniesRecordList[wrapIndex];
                                                                                  return InkWell(
                                                                                    onTap: () async {
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().adminOfficeType = 'current автомойка';
                                                                                        FFAppState().adminOfficeCurrentCompany = wrapCompaniesRecord.reference;
                                                                                      });
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 312.0,
                                                                                      height: 138.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).gray2,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 56.0,
                                                                                                  height: 56.0,
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
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).starblue,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          wrapCompaniesRecord.name,
                                                                                                          'null',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              fontSize: 18.0,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            wrapCompaniesRecord.street,
                                                                                                            'null',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).gray1,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                                spacing: 0.0,
                                                                                                runSpacing: 0.0,
                                                                                                alignment: WrapAlignment.start,
                                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                direction: Axis.horizontal,
                                                                                                runAlignment: WrapAlignment.start,
                                                                                                verticalDirection: VerticalDirection.down,
                                                                                                clipBehavior: Clip.none,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'Город:',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).gray1,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            wrapCompaniesRecord.city,
                                                                                                            'null',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                                                                                                          child: Text(
                                                                                                            'Статус:',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).gray1,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          wrapCompaniesRecord.status!,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            24.0,
                                                                            0.0),
                                                                        child:
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
                                                                                22.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                157.0,
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Colors.white,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                if (FFAppState()
                                                                        .adminOfficeType ==
                                                                    'Акции')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            24.0,
                                                                            24.0,
                                                                            24.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              width: 288.0,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).gray2,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: TextFormField(
                                                                                        controller: _model.textController4,
                                                                                        autofocus: true,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          isDense: true,
                                                                                          hintText: 'Поиск',
                                                                                          hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: Color(0xFF8E8E8E),
                                                                                                fontWeight: FontWeight.normal,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                          enabledBorder: InputBorder.none,
                                                                                          focusedBorder: InputBorder.none,
                                                                                          errorBorder: InputBorder.none,
                                                                                          focusedErrorBorder: InputBorder.none,
                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 13.0),
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: Color(0xFF8E8E8E),
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                        validator: _model.textController4Validator.asValidator(context),
                                                                                      ),
                                                                                    ),
                                                                                    Icon(
                                                                                      FFIcons.kicSearch,
                                                                                      color: FlutterFlowTheme.of(context).gray2,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  barrierColor: Color(0x00000000),
                                                                                  enableDrag: false,
                                                                                  context: context,
                                                                                  builder: (bottomSheetContext) {
                                                                                    return GestureDetector(
                                                                                      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                        child: AdminAddSalesWidget(
                                                                                          company: scrollCompaniesRecord,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              text: 'Добавить',
                                                                              icon: Icon(
                                                                                FFIcons.kicPlus,
                                                                                size: 22.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                width: 157.0,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                child: Container(
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                                                                                            child: Text(
                                                                                              'Активные',
                                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: Colors.black,
                                                                                                    fontSize: 16.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Divider(
                                                                                            height: 1.0,
                                                                                            thickness: 1.0,
                                                                                            color: FlutterFlowTheme.of(context).drawer,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      collapsed: Container(),
                                                                                      expanded: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                                                                                        child: StreamBuilder<List<PromotionRecord>>(
                                                                                          stream: queryPromotionRecord(
                                                                                            parent: scrollCompaniesRecord!.reference,
                                                                                            queryBuilder: (promotionRecord) => promotionRecord.where('status', isEqualTo: 'Активно'),
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
                                                                                            List<PromotionRecord> wrapPromotionRecordList = snapshot.data!;
                                                                                            if (wrapPromotionRecordList.isEmpty) {
                                                                                              return AdminSalesActiveEmptyWidget();
                                                                                            }
                                                                                            return Wrap(
                                                                                              spacing: 24.0,
                                                                                              runSpacing: 24.0,
                                                                                              alignment: WrapAlignment.start,
                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: List.generate(wrapPromotionRecordList.length, (wrapIndex) {
                                                                                                final wrapPromotionRecord = wrapPromotionRecordList[wrapIndex];
                                                                                                return Container(
                                                                                                  width: 376.0,
                                                                                                  height: 312.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).gray4,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        height: 152.0,
                                                                                                        child: Stack(
                                                                                                          children: [
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                                bottomRight: Radius.circular(0.0),
                                                                                                                topLeft: Radius.circular(8.0),
                                                                                                                topRight: Radius.circular(8.0),
                                                                                                              ),
                                                                                                              child: Image.network(
                                                                                                                valueOrDefault<String>(
                                                                                                                  wrapPromotionRecord.img,
                                                                                                                  'https://picsum.photos/seed/421/600',
                                                                                                                ),
                                                                                                                width: double.infinity,
                                                                                                                height: 152.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                            if (wrapPromotionRecord.top ?? true)
                                                                                                              Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 8.0, 8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                                                        children: [
                                                                                                                          Icon(
                                                                                                                            FFIcons.kicFire,
                                                                                                                            color: FlutterFlowTheme.of(context).green,
                                                                                                                            size: 20.0,
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            'Топ',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                  color: FlutterFlowTheme.of(context).green,
                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              wrapPromotionRecord.title!,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontSize: 16.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                wrapPromotionRecord.subtitle!.maybeHandleOverflow(
                                                                                                                  maxChars: 50,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  InkWell(
                                                                                                                    onTap: () async {
                                                                                                                      final promotionUpdateData = createPromotionRecordData(
                                                                                                                        status: 'Архив',
                                                                                                                        moderation: false,
                                                                                                                        top: false,
                                                                                                                      );
                                                                                                                      await wrapPromotionRecord.reference.update(promotionUpdateData);
                                                                                                                    },
                                                                                                                    child: Text(
                                                                                                                      'Архивировать',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Inter',
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  FFButtonWidget(
                                                                                                                    onPressed: () async {
                                                                                                                      await showModalBottomSheet(
                                                                                                                        isScrollControlled: true,
                                                                                                                        backgroundColor: Colors.transparent,
                                                                                                                        barrierColor: Color(0x00000000),
                                                                                                                        enableDrag: false,
                                                                                                                        context: context,
                                                                                                                        builder: (bottomSheetContext) {
                                                                                                                          return GestureDetector(
                                                                                                                            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                            child: Padding(
                                                                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                              child: AdminSalesDetailsWidget(
                                                                                                                                promotion: wrapPromotionRecord.reference,
                                                                                                                                company: containerCompanyDocumentRecord!.reference,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ).then((value) => setState(() {}));
                                                                                                                    },
                                                                                                                    text: 'Подробнее',
                                                                                                                    options: FFButtonOptions(
                                                                                                                      width: 121.0,
                                                                                                                      height: 40.0,
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: 'Inter',
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 14.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                          ),
                                                                                                                      elevation: 0.0,
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Colors.transparent,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
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
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                child: Container(
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                                                                                            child: Text(
                                                                                              'Архивированные',
                                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: Colors.black,
                                                                                                    fontSize: 16.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Divider(
                                                                                            height: 1.0,
                                                                                            thickness: 1.0,
                                                                                            color: FlutterFlowTheme.of(context).drawer,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      collapsed: Container(),
                                                                                      expanded: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                                                                                        child: StreamBuilder<List<PromotionRecord>>(
                                                                                          stream: queryPromotionRecord(
                                                                                            parent: scrollCompaniesRecord!.reference,
                                                                                            queryBuilder: (promotionRecord) => promotionRecord.where('status', isEqualTo: 'Архив'),
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
                                                                                            List<PromotionRecord> wrapPromotionRecordList = snapshot.data!;
                                                                                            if (wrapPromotionRecordList.isEmpty) {
                                                                                              return AdminSalesArchiveEmptyWidget();
                                                                                            }
                                                                                            return Wrap(
                                                                                              spacing: 24.0,
                                                                                              runSpacing: 24.0,
                                                                                              alignment: WrapAlignment.start,
                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: List.generate(wrapPromotionRecordList.length, (wrapIndex) {
                                                                                                final wrapPromotionRecord = wrapPromotionRecordList[wrapIndex];
                                                                                                return Container(
                                                                                                  width: 376.0,
                                                                                                  height: 312.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).gray4,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        height: 152.0,
                                                                                                        child: Stack(
                                                                                                          children: [
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                                bottomRight: Radius.circular(0.0),
                                                                                                                topLeft: Radius.circular(8.0),
                                                                                                                topRight: Radius.circular(8.0),
                                                                                                              ),
                                                                                                              child: Image.network(
                                                                                                                valueOrDefault<String>(
                                                                                                                  wrapPromotionRecord.img,
                                                                                                                  'https://picsum.photos/seed/421/600',
                                                                                                                ),
                                                                                                                width: double.infinity,
                                                                                                                height: 152.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Container(
                                                                                                              width: double.infinity,
                                                                                                              height: double.infinity,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0x93BDBDBD),
                                                                                                                borderRadius: BorderRadius.only(
                                                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                                                  bottomRight: Radius.circular(0.0),
                                                                                                                  topLeft: Radius.circular(8.0),
                                                                                                                  topRight: Radius.circular(8.0),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              wrapPromotionRecord.title!,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontSize: 16.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                wrapPromotionRecord.subtitle!.maybeHandleOverflow(
                                                                                                                  maxChars: 50,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  InkWell(
                                                                                                                    onTap: () async {
                                                                                                                      final promotionUpdateData = createPromotionRecordData(
                                                                                                                        status: 'Активно',
                                                                                                                      );
                                                                                                                      await wrapPromotionRecord.reference.update(promotionUpdateData);
                                                                                                                    },
                                                                                                                    child: Text(
                                                                                                                      'Активировать',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Inter',
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  FFButtonWidget(
                                                                                                                    onPressed: () async {
                                                                                                                      await showModalBottomSheet(
                                                                                                                        isScrollControlled: true,
                                                                                                                        backgroundColor: Colors.transparent,
                                                                                                                        barrierColor: Color(0x00000000),
                                                                                                                        enableDrag: false,
                                                                                                                        context: context,
                                                                                                                        builder: (bottomSheetContext) {
                                                                                                                          return GestureDetector(
                                                                                                                            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                            child: Padding(
                                                                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                              child: AdminSalesDetailsWidget(
                                                                                                                                promotion: wrapPromotionRecord.reference,
                                                                                                                                company: containerCompanyDocumentRecord!.reference,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ).then((value) => setState(() {}));
                                                                                                                    },
                                                                                                                    text: 'Подробнее',
                                                                                                                    options: FFButtonOptions(
                                                                                                                      width: 121.0,
                                                                                                                      height: 40.0,
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: 'Inter',
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 14.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                          ),
                                                                                                                      elevation: 2.0,
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Colors.transparent,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
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
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                child: Container(
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                                                                                            child: Text(
                                                                                              'Очередь в топ',
                                                                                              style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: Colors.black,
                                                                                                    fontSize: 16.0,
                                                                                                    fontWeight: FontWeight.normal,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Divider(
                                                                                            height: 1.0,
                                                                                            thickness: 1.0,
                                                                                            color: FlutterFlowTheme.of(context).drawer,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      collapsed: Container(),
                                                                                      expanded: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                                                                                        child: StreamBuilder<List<PromotionRecord>>(
                                                                                          stream: queryPromotionRecord(
                                                                                            parent: scrollCompaniesRecord!.reference,
                                                                                            queryBuilder: (promotionRecord) => promotionRecord.where('status', isEqualTo: 'Активно').where('moderation', isEqualTo: true),
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
                                                                                            List<PromotionRecord> wrapPromotionRecordList = snapshot.data!;
                                                                                            if (wrapPromotionRecordList.isEmpty) {
                                                                                              return AdminSalesModerationEmptyWidget();
                                                                                            }
                                                                                            return Wrap(
                                                                                              spacing: 24.0,
                                                                                              runSpacing: 24.0,
                                                                                              alignment: WrapAlignment.start,
                                                                                              crossAxisAlignment: WrapCrossAlignment.start,
                                                                                              direction: Axis.horizontal,
                                                                                              runAlignment: WrapAlignment.start,
                                                                                              verticalDirection: VerticalDirection.down,
                                                                                              clipBehavior: Clip.none,
                                                                                              children: List.generate(wrapPromotionRecordList.length, (wrapIndex) {
                                                                                                final wrapPromotionRecord = wrapPromotionRecordList[wrapIndex];
                                                                                                return Container(
                                                                                                  width: 376.0,
                                                                                                  height: 312.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).gray4,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        height: 152.0,
                                                                                                        child: Stack(
                                                                                                          children: [
                                                                                                            ClipRRect(
                                                                                                              borderRadius: BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                                bottomRight: Radius.circular(0.0),
                                                                                                                topLeft: Radius.circular(8.0),
                                                                                                                topRight: Radius.circular(8.0),
                                                                                                              ),
                                                                                                              child: Image.network(
                                                                                                                valueOrDefault<String>(
                                                                                                                  wrapPromotionRecord.img,
                                                                                                                  'https://picsum.photos/seed/421/600',
                                                                                                                ),
                                                                                                                width: double.infinity,
                                                                                                                height: 152.0,
                                                                                                                fit: BoxFit.cover,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              wrapPromotionRecord.title!,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    fontSize: 16.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                wrapPromotionRecord.subtitle!.maybeHandleOverflow(
                                                                                                                  maxChars: 50,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  InkWell(
                                                                                                                    onTap: () async {
                                                                                                                      final promotionUpdateData = createPromotionRecordData(
                                                                                                                        status: 'Активно',
                                                                                                                      );
                                                                                                                      await wrapPromotionRecord.reference.update(promotionUpdateData);
                                                                                                                    },
                                                                                                                    child: Text(
                                                                                                                      'Отмена',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Inter',
                                                                                                                            color: FlutterFlowTheme.of(context).red1,
                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  FFButtonWidget(
                                                                                                                    onPressed: () async {
                                                                                                                      await showModalBottomSheet(
                                                                                                                        isScrollControlled: true,
                                                                                                                        backgroundColor: Colors.transparent,
                                                                                                                        barrierColor: Color(0x00000000),
                                                                                                                        enableDrag: false,
                                                                                                                        context: context,
                                                                                                                        builder: (bottomSheetContext) {
                                                                                                                          return GestureDetector(
                                                                                                                            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                                                            child: Padding(
                                                                                                                              padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                                              child: AdminSalesDetailsWidget(
                                                                                                                                promotion: wrapPromotionRecord.reference,
                                                                                                                                company: containerCompanyDocumentRecord!.reference,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ).then((value) => setState(() {}));
                                                                                                                    },
                                                                                                                    text: 'Подробнее',
                                                                                                                    options: FFButtonOptions(
                                                                                                                      width: 121.0,
                                                                                                                      height: 40.0,
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                            fontFamily: 'Inter',
                                                                                                                            color: Colors.white,
                                                                                                                            fontSize: 14.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                                          ),
                                                                                                                      elevation: 2.0,
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Colors.transparent,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
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
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final currentCompanyCompaniesRecord =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
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
                                                                      width:
                                                                          1224.0,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              24.0,
                                                                              24.0,
                                                                              24.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 56.0,
                                                                                    height: 56.0,
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
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).starblue,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 40.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          valueOrDefault<String>(
                                                                                            currentCompanyCompaniesRecord.name,
                                                                                            'null',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              currentCompanyCompaniesRecord.street,
                                                                                              'null',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).gray1,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 392.0,
                                                                                      height: 406.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: Color(0xFFEEEEEE),
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Основная информация',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 18.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                                                                                              child: Text(
                                                                                                'Наименование автомойки',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                currentCompanyCompaniesRecord.tooName,
                                                                                                'null',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 16.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                                                                                              child: Text(
                                                                                                'ФИО руководителя',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                currentCompanyCompaniesRecord.fioAdmin,
                                                                                                'null',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 16.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                                                                                              child: Text(
                                                                                                'Номер договора',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                currentCompanyCompaniesRecord.numDogovor,
                                                                                                'null',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 16.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                                                                                              child: Text(
                                                                                                'Дата заключения договора',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      fontSize: 14.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 16.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 760.0,
                                                                                            height: 144.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: Color(0xFFEEEEEE),
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Основная информация',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          fontSize: 18.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: 346.0,
                                                                                                            child: TextFormField(
                                                                                                              controller: _model.textController5 ??= TextEditingController(
                                                                                                                text: valueOrDefault<String>(
                                                                                                                  currentCompanyCompaniesRecord.binIin?.toString(),
                                                                                                                  'null',
                                                                                                                ),
                                                                                                              ),
                                                                                                              readOnly: true,
                                                                                                              obscureText: false,
                                                                                                              decoration: InputDecoration(
                                                                                                                labelText: 'БИН',
                                                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 12.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
                                                                                                                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 12.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
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
                                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 16.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                              validator: _model.textController5Validator.asValidator(context),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 346.0,
                                                                                                          child: TextFormField(
                                                                                                            controller: _model.textController6 ??= TextEditingController(
                                                                                                              text: valueOrDefault<String>(
                                                                                                                currentCompanyCompaniesRecord.iban,
                                                                                                                'null',
                                                                                                              ),
                                                                                                            ),
                                                                                                            readOnly: true,
                                                                                                            obscureText: false,
                                                                                                            decoration: InputDecoration(
                                                                                                              labelText: 'IBAN',
                                                                                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    fontSize: 12.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    fontSize: 12.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
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
                                                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Inter',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 16.0,
                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                ),
                                                                                                            validator: _model.textController6Validator.asValidator(context),
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 760.0,
                                                                                              height: 144.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                border: Border.all(
                                                                                                  color: Color(0xFFEEEEEE),
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Местоположение',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            fontSize: 18.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 346.0,
                                                                                                              child: TextFormField(
                                                                                                                controller: _model.textController7 ??= TextEditingController(
                                                                                                                  text: valueOrDefault<String>(
                                                                                                                    currentCompanyCompaniesRecord.iban,
                                                                                                                    'null',
                                                                                                                  ),
                                                                                                                ),
                                                                                                                readOnly: true,
                                                                                                                obscureText: false,
                                                                                                                decoration: InputDecoration(
                                                                                                                  labelText: 'Город',
                                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 12.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        fontSize: 12.0,
                                                                                                                        fontWeight: FontWeight.normal,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
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
                                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 16.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
                                                                                                                validator: _model.textController7Validator.asValidator(context),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            width: 346.0,
                                                                                                            child: TextFormField(
                                                                                                              controller: _model.textController8 ??= TextEditingController(
                                                                                                                text: valueOrDefault<String>(
                                                                                                                  currentCompanyCompaniesRecord.street,
                                                                                                                  'null',
                                                                                                                ),
                                                                                                              ),
                                                                                                              readOnly: true,
                                                                                                              obscureText: false,
                                                                                                              decoration: InputDecoration(
                                                                                                                labelText: 'Адрес',
                                                                                                                labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 12.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
                                                                                                                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Inter',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 12.0,
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                    ),
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
                                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Inter',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 16.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                              validator: _model.textController8Validator.asValidator(context),
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              24.0,
                                                                              24.0,
                                                                              24.0,
                                                                              24.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'Детали',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          fontSize: 18.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Icon(
                                                                                          FFIcons.kicEdit,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                      Text(
                                                                                        'Изменить',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontWeight: FontWeight.normal,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 29.0, 24.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 335.0,
                                                                                      height: 142.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).gray4,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Количество боксов',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 18.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: 346.0,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.textController9 ??= TextEditingController(
                                                                                                    text: valueOrDefault<String>(
                                                                                                      currentCompanyCompaniesRecord.countBox?.toString(),
                                                                                                      'null',
                                                                                                    ),
                                                                                                  ),
                                                                                                  readOnly: true,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).gray4,
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
                                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  validator: _model.textController9Validator.asValidator(context),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 29.0, 24.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 335.0,
                                                                                      height: 142.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).gray4,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Номер телефона',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 18.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: 346.0,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.textController10 ??= TextEditingController(
                                                                                                    text: valueOrDefault<String>(
                                                                                                      currentCompanyCompaniesRecord.phoneNum,
                                                                                                      'null',
                                                                                                    ),
                                                                                                  ),
                                                                                                  readOnly: true,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Inter',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                      borderSide: BorderSide(
                                                                                                        color: FlutterFlowTheme.of(context).gray4,
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
                                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                  keyboardType: TextInputType.phone,
                                                                                                  validator: _model.textController10Validator.asValidator(context),
                                                                                                  inputFormatters: [
                                                                                                    _model.textFieldMask8
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 29.0, 24.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 458.0,
                                                                                      height: 142.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).gray4,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'График работы',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 18.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 24.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 181.0,
                                                                                                    child: TextFormField(
                                                                                                      controller: _model.textController11 ??= TextEditingController(
                                                                                                        text: valueOrDefault<String>(
                                                                                                          currentCompanyCompaniesRecord.openTime,
                                                                                                          'null',
                                                                                                        ),
                                                                                                      ),
                                                                                                      readOnly: true,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        labelText: 'Начало работы',
                                                                                                        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                        enabledBorder: OutlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).gray4,
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
                                                                                                        contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Inter',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 16.0,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                      validator: _model.textController11Validator.asValidator(context),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: 181.0,
                                                                                                      child: TextFormField(
                                                                                                        controller: _model.textController12 ??= TextEditingController(
                                                                                                          text: valueOrDefault<String>(
                                                                                                            currentCompanyCompaniesRecord.closeTime,
                                                                                                            'null',
                                                                                                          ),
                                                                                                        ),
                                                                                                        readOnly: true,
                                                                                                        obscureText: false,
                                                                                                        decoration: InputDecoration(
                                                                                                          labelText: 'Конец работы',
                                                                                                          labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 12.0,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Inter',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 12.0,
                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                          enabledBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).gray4,
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
                                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 16.0,
                                                                                                              fontWeight: FontWeight.normal,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                        validator: _model.textController12Validator.asValidator(context),
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                100.0),
                                                                            child:
                                                                                Container(
                                                                              width: 704.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Услуги',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 18.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                        InkWell(
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              'admin_edit_company_services',
                                                                                              queryParams: {
                                                                                                'company': serializeParam(
                                                                                                  currentCompanyCompaniesRecord,
                                                                                                  ParamType.Document,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                              extra: <String, dynamic>{
                                                                                                'company': currentCompanyCompaniesRecord,
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                child: Icon(
                                                                                                  FFIcons.kicEdit,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ),
                                                                                              Text(
                                                                                                'Изменить',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().adminSelectServicesBody = 'Седан';
                                                                                                  });
                                                                                                  setState(() => _model.firestoreRequestCompleter = null);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 171.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().adminSelectServicesBody == 'Седан' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Седан',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().adminSelectServicesBody == 'Седан' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().adminSelectServicesBody = 'Хетчбэк';
                                                                                                  });
                                                                                                  setState(() => _model.firestoreRequestCompleter = null);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 171.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().adminSelectServicesBody == 'Хетчбэк' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Хетчбэк',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().adminSelectServicesBody == 'Хетчбэк' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().adminSelectServicesBody = 'Кроссовер';
                                                                                                  });
                                                                                                  setState(() => _model.firestoreRequestCompleter = null);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 171.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().adminSelectServicesBody == 'Кроссовер' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Кроссовер',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().adminSelectServicesBody == 'Кроссовер' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().adminSelectServicesBody = 'Внедорожник';
                                                                                                  });
                                                                                                  setState(() => _model.firestoreRequestCompleter = null);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 171.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().adminSelectServicesBody == 'Внедорожник' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Внедорожник',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().adminSelectServicesBody == 'Внедорожник' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().adminSelectServicesBody = 'Пикап';
                                                                                                  });
                                                                                                  setState(() => _model.firestoreRequestCompleter = null);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 171.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().adminSelectServicesBody == 'Пикап' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Пикап',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().adminSelectServicesBody == 'Пикап' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().adminSelectServicesBody = 'Минивен';
                                                                                                  });
                                                                                                  setState(() => _model.firestoreRequestCompleter = null);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 171.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().adminSelectServicesBody == 'Минивен' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Минивен',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().adminSelectServicesBody == 'Минивен' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().adminSelectServicesBody = 'Купе';
                                                                                                  });
                                                                                                  setState(() => _model.firestoreRequestCompleter = null);
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: 171.0,
                                                                                                  height: 40.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: valueOrDefault<Color>(
                                                                                                      FFAppState().adminSelectServicesBody == 'Купе' ? FlutterFlowTheme.of(context).gray4 : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                      topLeft: Radius.circular(8.0),
                                                                                                      topRight: Radius.circular(0.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Купе',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Inter',
                                                                                                              color: valueOrDefault<Color>(
                                                                                                                FFAppState().adminSelectServicesBody == 'Купе' ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                                                              ),
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Container(
                                                                                            width: 485.0,
                                                                                            height: 300.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(8.0),
                                                                                                bottomRight: Radius.circular(8.0),
                                                                                                topLeft: Radius.circular(0.0),
                                                                                                topRight: Radius.circular(8.0),
                                                                                              ),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).gray4,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                                                                                              child: FutureBuilder<List<CompanyServicesRecord>>(
                                                                                                future: (_model.firestoreRequestCompleter ??= Completer<List<CompanyServicesRecord>>()
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
                                                                                                        width: 50.0,
                                                                                                        height: 50.0,
                                                                                                        child: CircularProgressIndicator(
                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  List<CompanyServicesRecord> listViewCompanyServicesRecordList = snapshot.data!;
                                                                                                  return RefreshIndicator(
                                                                                                    onRefresh: () async {
                                                                                                      setState(() => _model.firestoreRequestCompleter = null);
                                                                                                      await _model.waitForFirestoreRequestCompleted();
                                                                                                    },
                                                                                                    child: ListView.builder(
                                                                                                      padding: EdgeInsets.zero,
                                                                                                      scrollDirection: Axis.vertical,
                                                                                                      itemCount: listViewCompanyServicesRecordList.length,
                                                                                                      itemBuilder: (context, listViewIndex) {
                                                                                                        final listViewCompanyServicesRecord = listViewCompanyServicesRecordList[listViewIndex];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                flex: 4,
                                                                                                                child: Text(
                                                                                                                  listViewCompanyServicesRecord.name!,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  '${listViewCompanyServicesRecord.price?.toString()}₸',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 496.0,
                                                                                  height: 208.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
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
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    fontSize: 18.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                  child: Icon(
                                                                                                    FFIcons.kicEdit,
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  'Изменить',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Inter',
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontWeight: FontWeight.normal,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            height: 113.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).gray4,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  currentCompanyCompaniesRecord.conveniences,
                                                                                                  'null',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontSize: 16.0,
                                                                                                      fontWeight: FontWeight.normal,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                          if (!(scrollCompaniesRecord !=
                                                  null) ||
                                              (scrollCompaniesRecord!.status ==
                                                  'new'))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 32.0,
                                                                0.0, 24.0),
                                                    child: Text(
                                                      'Кабинет',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 24.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 1224.0,
                                                    height: 294.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      62.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 48.0,
                                                            height: 48.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              FFIcons
                                                                  .kicVisitors,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Регистрация компании',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Введите данные компании и \nпройдите модерацию.',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
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
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      25.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  CompaniesRecord>>(
                                                            stream:
                                                                queryCompaniesRecord(
                                                              queryBuilder: (companiesRecord) => companiesRecord
                                                                  .where(
                                                                      'admin_created_by',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'new'),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<CompaniesRecord>
                                                                  containerCompaniesRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final containerCompaniesRecord =
                                                                  containerCompaniesRecordList
                                                                          .isNotEmpty
                                                                      ? containerCompaniesRecordList
                                                                          .first
                                                                      : null;
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                          context
                                                                              .pushNamed(
                                                                            'admin_add_company_1',
                                                                            queryParams:
                                                                                {
                                                                              'company': serializeParam(
                                                                                containerCompaniesRecord!.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                            extra: <String,
                                                                                dynamic>{
                                                                              kTransitionInfoKey: TransitionInfo(
                                                                                hasTransition: true,
                                                                                transitionType: PageTransitionType.fade,
                                                                                duration: Duration(milliseconds: 0),
                                                                              ),
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Text(
                                                                              'Зарегестрировать кампанию',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                          final companiesCreateData =
                                                                              createCompaniesRecordData(
                                                                            status:
                                                                                'new',
                                                                            adminCreatedBy:
                                                                                currentUserReference,
                                                                          );
                                                                          var companiesRecordReference = CompaniesRecord
                                                                              .collection
                                                                              .doc();
                                                                          await companiesRecordReference
                                                                              .set(companiesCreateData);
                                                                          _model.addCompany = CompaniesRecord.getDocumentFromData(
                                                                              companiesCreateData,
                                                                              companiesRecordReference);

                                                                          context
                                                                              .pushNamed(
                                                                            'admin_add_company_1',
                                                                            queryParams:
                                                                                {
                                                                              'company': serializeParam(
                                                                                _model.addCompany!.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Text(
                                                                              'Зарегестрировать кампанию',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 16.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  if (FFAppState().adminOfficeType == 'Редактировать данные')
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: double.infinity,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16.0,
                              color: Color(0x4DDEDEDE),
                              offset: Offset(0.0, -4.0),
                            )
                          ],
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: 1224.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.uploadedFileUrl != null &&
                                      _model.uploadedFileUrl != '') {
                                    final userUpdateData1 =
                                        createUserRecordData(
                                      displayName:
                                          _model.editFIOController.text,
                                      phoneNumber:
                                          _model.editPhoneController.text,
                                      photoUrl: _model.uploadedFileUrl,
                                    );
                                    await currentUserReference!
                                        .update(userUpdateData1);
                                  } else {
                                    final userUpdateData2 =
                                        createUserRecordData(
                                      displayName:
                                          _model.editFIOController.text,
                                      phoneNumber:
                                          _model.editPhoneController.text,
                                    );
                                    await currentUserReference!
                                        .update(userUpdateData2);
                                  }

                                  FFAppState().update(() {
                                    FFAppState().adminOfficeType =
                                        'Личные данные';
                                  });
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
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  );
                                },
                                text: 'Сохранить',
                                options: FFButtonOptions(
                                  width: 185.0,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              wrapWithModel(
                model: _model.adminAppBarInfoModel,
                updateCallback: () => setState(() {}),
                child: AdminAppBarInfoWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

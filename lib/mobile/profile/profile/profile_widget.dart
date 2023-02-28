import '/auth/auth_util.dart';
import '/components/add_city/add_city_widget.dart';
import '/components/log_out/log_out_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      endDrawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 42, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('edit_profile');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/tsybuq71uj0t/Avatars_48x48.png',
                                  ),
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<String>(
                                          currentUserDisplayName,
                                          'Имя не указано',
                                        ),
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
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault<String>(
                                        functions.phoneNum(currentPhoneNumber),
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            color: Color(0xFF9CA3AF),
                                            fontSize: 12,
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
                        Icon(
                          FFIcons.kicArrowsButtonLeft,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: FlutterFlowTheme.of(context).gray4,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: AddCityWidget(),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.kicMapIc,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Text(
                            'Город',
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: AuthUserStreamWidget(
                            builder: (context) => Text(
                              valueOrDefault<String>(
                                valueOrDefault(
                                    currentUserDocument?.countryText, ''),
                                'Не выбрано',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: Color(0xFF9CA3AF),
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('Favorites_Car_Washes');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.kproperty1unsaved,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
                          child: Text(
                            'Избранные',
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
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        FFIcons.kicShower,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 22,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Text(
                          'Добавить автомойку',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: Icon(
                          FFIcons.kicNotification,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 22,
                        ),
                      ),
                      Expanded(
                        child: SwitchListTile(
                          value: _model.switchListTileValue2 ??= true,
                          onChanged: (newValue) async {
                            setState(
                                () => _model.switchListTileValue2 = newValue!);
                          },
                          title: Text(
                            'Уведомления',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title3Family,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .title3Family),
                                ),
                          ),
                          tileColor: Colors.white,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('About_company');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.kicWorld,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Text(
                            'О компании',
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
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      context.pushNamed('Terms_of_Use');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          FFIcons.kicTermscond,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 22,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Text(
                            ' Условия пользования',
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
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        color: FlutterFlowTheme.of(context).gray4,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 30),
                        child: InkWell(
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: LogOutWidget(),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                FFIcons.kicExit,
                                color: Color(0xFFE20000),
                                size: 22,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Text(
                                  'Выйти',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontWeight: FontWeight.w500,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: SelectionArea(
                        child: Text(
                      'Профиль',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    )),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                valueOrDefault<String>(
                                  currentUserPhoto,
                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/tsybuq71uj0t/Avatars_48x48.png',
                                ),
                                width: 48,
                                height: 48,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault<String>(
                                        currentUserDisplayName,
                                        'Имя не указано',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family),
                                          ),
                                    ),
                                  ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    valueOrDefault<String>(
                                      functions.phoneNum(currentPhoneNumber),
                                      '-',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: Color(0xFF9CA3AF),
                                          fontSize: 12,
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
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: SelectionArea(
                        child: Text(
                      'Общее',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF707070),
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 22, 0, 14),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed(
                          'edit_profile',
                          queryParams: {
                            'page': serializeParam(
                              'Личные данные',
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kicAccount,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'Личные данные',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            FFIcons.kicArrowsButtonLeft,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).gray4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 14),
                    child: InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: AddCityWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kicMapIc,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Text(
                              'Город',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  valueOrDefault<String>(
                                    valueOrDefault(
                                        currentUserDocument?.countryText, ''),
                                    'Не выбрано',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: Color(0xFF9CA3AF),
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            FFIcons.kicArrowsButtonLeft,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).gray4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: SelectionArea(
                        child: Text(
                      'Дополнительно',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF707070),
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 22, 0, 14),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('Favorites_Car_Washes');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kproperty1unsaved,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
                              child: Text(
                                'Избранные',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            FFIcons.kicArrowsButtonLeft,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).gray4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 14),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('About_company');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kicWorld,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'О компании',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            FFIcons.kicArrowsButtonLeft,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).gray4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: SelectionArea(
                        child: Text(
                      'Настройки',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            color: Color(0xFF707070),
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    )),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Icon(
                            FFIcons.kicNotification,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                        ),
                        Expanded(
                          child: SwitchListTile(
                            value: _model.switchListTileValue1 ??= true,
                            onChanged: (newValue) async {
                              setState(() =>
                                  _model.switchListTileValue1 = newValue!);
                            },
                            title: Text(
                              'Уведомления',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .title3Family,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .title3Family),
                                      ),
                            ),
                            tileColor: Colors.white,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).gray4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 14),
                    child: InkWell(
                      onTap: () async {
                        context.pushNamed('Terms_of_Use');
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kicLock,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'Политика конфиденциальности',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ),
                          Icon(
                            FFIcons.kicArrowsButtonLeft,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).gray4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 45),
                    child: InkWell(
                      onTap: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: LogOutWidget(),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.kicExit,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 22,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'Выйти',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

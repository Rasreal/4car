import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class AboutCompanyWidget extends StatefulWidget {
  const AboutCompanyWidget({Key? key}) : super(key: key);

  @override
  _AboutCompanyWidgetState createState() => _AboutCompanyWidgetState();
}

class _AboutCompanyWidgetState extends State<AboutCompanyWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {

    _unfocusNode.dispose();
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 48,
                        icon: Icon(
                          FFIcons.kicBack,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 24,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                      Text(
                        'О компании',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                          FlutterFlowTheme.of(context).bodyText1Family,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 48,
                        icon: Icon(
                          FFIcons.kicBack,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Forcar - запись в автомойки в несколько кликов БЕСПЛАТНО\n\nЭкономим ваше время\n- В приложении можно выбрать мойку, посмотреть какие есть услуги и удобства. Например, есть ли кофе и комната ожидания, сколько стоит мойка и где она расположена на карте\n\nЦеним качество\n- Читайте отзывы отзывы от людей, которые уже помыли свои машины.\nДобавили рейтинг, чтобы легче было выбирать хорошие мойки (плохие стараемся удалять)\n\nВыгодные предложения\n- Автомойки публикуют акции, скидки и специальные предложения.\nВыбирайте подходящие\n\nБесплатная запись\n- Чтобы записаться на мойку - не нужно платить. Это бесплатный казахстанский сервис.',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 22, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kicInsta,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Text(
                                      'Instagram',
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
                                ],
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      FFIcons.kicLinkedin,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Text(
                                        'LinkedIn',
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
      ),
    );
  }
}

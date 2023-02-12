import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terms_of_use_model.dart';
export 'terms_of_use_model.dart';

class TermsOfUseWidget extends StatefulWidget {
  const TermsOfUseWidget({Key? key}) : super(key: key);

  @override
  _TermsOfUseWidgetState createState() => _TermsOfUseWidgetState();
}

class _TermsOfUseWidgetState extends State<TermsOfUseWidget> {
  late TermsOfUseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsOfUseModel());

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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                  child: Row(
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
                        ' Условия пользования',
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Условия пользования',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Text(
                          'Если Вы еще не достигли требуемого возраста для управления аккаунтом Google, то можете использовать его только с разрешения родителя или законного представителя. Для этого родителю или законному представителю нужно прочитать эти условия вместе с Вами.\n\nЕсли Вы являетесь родителем или законным представителем ребенка и позволяете ему использовать сервисы Google, настоящие условия относятся к Вам и Вы несете ответственность за действия ребенка в наших сервисах.\n\nДля некоторых сервисов Google установлены особые возрастные ограничения. Они указаны в дополнительных правилах и условиях использования отдельных сервисов.',
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Text(
                          'Предоставляем широкий выбор полезных сервисов',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 30),
                        child: Text(
                          'Мы предоставляем широкий спектр сервисов, для которых действуют настоящие условия, в том числе:\nприложения и сайты (например, Поиск и Карты);\nплатформы (например, Google Покупки);\nинтегрированные сервисы (например, встроенные Карты в приложениях или на сайтах других компаний);\nустройства (например, Google Nest).\nМногие из этих сервисов содержат контент, который Вы можете воспроизводить онлайн или с которым можете взаимодействовать.\n\nВсе наши сервисы работают совместно, чтобы Вам было легче переключаться между задачами. Например, если для мероприятия в Календаре указан адрес, Вы можете нажать на этот адрес и увидеть в Картах маршрут до этого места.\n\nМы постоянно разрабатываем новые технологии и функции для улучшения наших сервисов. Например, мы используем системы искусственного интеллекта и машинное обучение, чтобы предоставлять пользователям возможности мгновенного перевода, а также лучше обнаруживать и блокировать спам и вредоносное ПО. В рамках непрерывного совершенствования мы иногда добавляем или удаляем некоторые функции, расширяем или сужаем ограничения по использованию наших сервисов, а также запускаем новые сервисы или прекращаем поддержку старых. Если для работы сервиса необходимо скачать программное обеспечение, оно может автоматически обновляться на Вашем устройстве при появлении очередной его версии или внедрении новой функции. В некоторых сервисах можно настраивать параметры автоматического обновления.',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

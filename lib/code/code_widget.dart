import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class CodeWidget extends StatefulWidget {
  const CodeWidget({
    Key? key,
    this.phone,
  }) : super(key: key);

  final String? phone;

  @override
  _CodeWidgetState createState() => _CodeWidgetState();
}

class _CodeWidgetState extends State<CodeWidget> with TickerProviderStateMixin {

  TextEditingController? pinCodeController;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 90.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 90.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 600.ms,
          begin: 1,
          end: 0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().update(() {
        FFAppState().signINcode = false;
      });
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
      anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(flex: 2),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 36),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 48,
                          icon: Icon(
                            Icons.chevron_left_outlined,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 24,
                          ),
                          onPressed: () async {
                            context.goNamed('Sign_in');
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Text(
                      'Введите код',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                        FlutterFlowTheme.of(context).bodyText1Family,
                        fontSize: 24,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Text(
                      'Мы отправим на ваш номер сообщение с 6-ти значным кодом, введите его',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                        FlutterFlowTheme.of(context).bodyText1Family,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                    ),
                  ),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily:
                      FlutterFlowTheme.of(context).subtitle2Family,
                      color: FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).subtitle2Family),
                    ),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    enableActiveFill: false,
                    autoFocus: true,
                    showCursor: true,
                    cursorColor: FlutterFlowTheme.of(context).primaryColor,
                    obscureText: false,
                    hintCharacter: '●',
                    pinTheme: PinTheme(
                      fieldHeight: 48,
                      fieldWidth: 40,
                      borderWidth: 2,
                      borderRadius: BorderRadius.circular(8),
                      shape: PinCodeFieldShape.box,
                      activeColor: FlutterFlowTheme.of(context).secondaryText,
                      inactiveColor: FlutterFlowTheme.of(context).secondaryText,
                      selectedColor: FlutterFlowTheme.of(context).secondaryText,
                      activeFillColor:
                      FlutterFlowTheme.of(context).secondaryText,
                      inactiveFillColor:
                      FlutterFlowTheme.of(context).secondaryText,
                      selectedFillColor:
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    controller: pinCodeController,
                    onChanged: (_) => {},
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Не получили код?',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .bodyText1Family,
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .bodyText1Family),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              final phoneNumberVal = widget.phone;
                              if (phoneNumberVal == null ||
                                  phoneNumberVal.isEmpty ||
                                  !phoneNumberVal.startsWith('+')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Phone Number is required and has to start with +.'),
                                  ),
                                );
                                return;
                              }
                              await beginPhoneAuth(
                                context: context,
                                phoneNumber: phoneNumberVal,
                                onCodeSent: () async {
                                  context.goNamedAuth(
                                    'code',
                                    mounted,
                                    queryParams: {
                                      'phone': serializeParam(
                                        widget.phone,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    ignoreRedirect: true,
                                  );
                                },
                              );
                            },
                            child: Text(
                              ' Отправить код заново',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                color: FlutterFlowTheme.of(context)
                                    .primaryColor,
                                fontSize: 12,
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
                  FFButtonWidget(
                    onPressed: () async {
                      GoRouter.of(context).prepareAuthEvent();
                      final smsCodeVal = pinCodeController!.text;
                      if (smsCodeVal == null || smsCodeVal.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Enter SMS verification code.'),
                          ),
                        );
                        return;
                      }
                      final phoneVerifiedUser = await verifySmsCode(
                        context: context,
                        smsCode: smsCodeVal,
                      );
                      if (phoneVerifiedUser == null) {
                        return;
                      }

                      if (animationsMap['columnOnActionTriggerAnimation'] !=
                          null) {
                        await animationsMap['columnOnActionTriggerAnimation']!
                            .controller
                            .forward(from: 0.0);
                      }

                      context.goNamedAuth('HomePage', mounted);
                    },
                    text: 'Ввести код',
                    options: FFButtonOptions(
                      width: 130,
                      height: 48,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: valueOrDefault<Color>(
                        pinCodeController!.text != null &&
                            pinCodeController!.text != ''
                            ? FlutterFlowTheme.of(context).primaryColor
                            : FlutterFlowTheme.of(context).starblue,
                        FlutterFlowTheme.of(context).starblue,
                      ),
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                        fontFamily:
                        FlutterFlowTheme.of(context).subtitle2Family,
                        color: Colors.white,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).subtitle2Family),
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Spacer(flex: 4),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color(0x67000000),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 200,
                      height: 160,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20,
                            buttonSize: 60,
                            fillColor:
                            FlutterFlowTheme.of(context).primaryColor,
                            icon: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Text(
                              'Добро пожаловать!',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 16,
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
                ),
              ],
            ).animateOnActionTrigger(
              animationsMap['columnOnActionTriggerAnimation']!,
            ),
          ],
        ),
      ),
    );
  }
}

import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_out_model.dart';
export 'log_out_model.dart';

class LogOutWidget extends StatefulWidget {
  const LogOutWidget({Key? key}) : super(key: key);

  @override
  _LogOutWidgetState createState() => _LogOutWidgetState();
}

class _LogOutWidgetState extends State<LogOutWidget> {
  late LogOutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogOutModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 270,
        height: 119,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 2),
              child: Text(
                'Выйти с аккаунта?',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
              child: Text(
                'Вы точно хотите выйти из аккаунта?',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontSize: 13,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Container(
                width: 270,
                height: 0.5,
                decoration: BoxDecoration(
                  color: Color(0x5C3C3C43),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0, 1),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await signOut();

                          context.goNamedAuth('admin_sign_in_email', mounted);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Выйти',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context).red1,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 0.5,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0x5C3C3C43),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Отмена',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
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
          ],
        ),
      ),
    );
  }
}

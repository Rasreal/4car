import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_reset_password_model.dart';
export 'admin_reset_password_model.dart';

class AdminResetPasswordWidget extends StatefulWidget {
  const AdminResetPasswordWidget({
    Key? key,
    this.emaill,
  }) : super(key: key);

  final String? emaill;

  @override
  _AdminResetPasswordWidgetState createState() =>
      _AdminResetPasswordWidgetState();
}

class _AdminResetPasswordWidgetState extends State<AdminResetPasswordWidget> {
  late AdminResetPasswordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminResetPasswordModel());

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
        width: 476,
        height: 220,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(60, 0, 60, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                child: Text(
                  'Письмо отправлено',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        fontSize: 22,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Text(
                  'На вашу почту ${widget.emaill} отправлено письмо с ссылкой на смену пароля.',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: 'Закрыть',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Inter',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

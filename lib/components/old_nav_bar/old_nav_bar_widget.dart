import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'old_nav_bar_model.dart';
export 'old_nav_bar_model.dart';

class OldNavBarWidget extends StatefulWidget {
  const OldNavBarWidget({Key? key}) : super(key: key);

  @override
  _OldNavBarWidgetState createState() => _OldNavBarWidgetState();
}

class _OldNavBarWidgetState extends State<OldNavBarWidget> {
  late OldNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OldNavBarModel());

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
      alignment: AlignmentDirectional(0, 1),
      child: Container(
        width: double.infinity,
        height: 85,
        decoration: BoxDecoration(
          color: Color(0xFFF1F1F1),
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              color: Color(0x4D000000),
              offset: Offset(0, -0.5),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                    child: Icon(
                      FFIcons.kicHome,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                  Text(
                    'Главная',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed(
                    'My_notes',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                      child: Icon(
                        FFIcons.kicZapisi,
                        color: FlutterFlowTheme.of(context).gray2,
                        size: 24,
                      ),
                    ),
                    Text(
                      'Мои записи',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).gray2,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  Scaffold.of(context).openEndDrawer();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 6),
                      child: Icon(
                        FFIcons.kicBurger,
                        color: FlutterFlowTheme.of(context).gray2,
                        size: 24,
                      ),
                    ),
                    Text(
                      'Меню',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).gray2,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
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
  }
}

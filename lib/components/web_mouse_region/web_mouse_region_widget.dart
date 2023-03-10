import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'web_mouse_region_model.dart';
export 'web_mouse_region_model.dart';

class WebMouseRegionWidget extends StatefulWidget {
  const WebMouseRegionWidget({
    Key? key,
    this.message,
    this.nnnnn,
  }) : super(key: key);

  final String? message;
  final String? nnnnn;

  @override
  _WebMouseRegionWidgetState createState() => _WebMouseRegionWidgetState();
}

class _WebMouseRegionWidgetState extends State<WebMouseRegionWidget> {
  late WebMouseRegionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebMouseRegionModel());

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

    return Container(
      width: 249.0,
      height: 94.0,
      child: Stack(
        children: [
          Container(
            width: 249.0,
            height: 82.8,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8.0,
                  color: Color(0x13000000),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Text(
                widget.message!,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Image.asset(
              'assets/images/triangle.png',
              width: 28.0,
              height: 13.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

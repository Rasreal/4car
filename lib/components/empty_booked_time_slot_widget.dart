import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmptyBookedTimeSlotWidget extends StatefulWidget {
  const EmptyBookedTimeSlotWidget({Key? key}) : super(key: key);

  @override
  _EmptyBookedTimeSlotWidgetState createState() =>
      _EmptyBookedTimeSlotWidgetState();
}

class _EmptyBookedTimeSlotWidgetState extends State<EmptyBookedTimeSlotWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: Text(
        'Нет свободных времен',
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              fontWeight: FontWeight.w500,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
            ),
      ),
    );
  }
}

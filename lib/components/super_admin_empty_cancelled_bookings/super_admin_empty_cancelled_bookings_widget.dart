import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'super_admin_empty_cancelled_bookings_model.dart';
export 'super_admin_empty_cancelled_bookings_model.dart';

class SuperAdminEmptyCancelledBookingsWidget extends StatefulWidget {
  const SuperAdminEmptyCancelledBookingsWidget({Key? key}) : super(key: key);

  @override
  _SuperAdminEmptyCancelledBookingsWidgetState createState() =>
      _SuperAdminEmptyCancelledBookingsWidgetState();
}

class _SuperAdminEmptyCancelledBookingsWidgetState
    extends State<SuperAdminEmptyCancelledBookingsWidget> {
  late SuperAdminEmptyCancelledBookingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => SuperAdminEmptyCancelledBookingsModel());

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
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Image.asset(
                'assets/images/cancelled_bookings.png',
                width: 48.0,
                height: 48.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Text(
                'Пока нет отмененных записей',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyText1Family),
                    ),
              ),
            ),
            Text(
              'Можно будет прочитать\nинформацию о записи и\nкомментарий.',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).gray2,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyText1Family),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

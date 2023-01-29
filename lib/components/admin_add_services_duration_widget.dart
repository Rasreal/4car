import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddServicesDurationWidget extends StatefulWidget {
  const AdminAddServicesDurationWidget({
    Key? key,
    this.service,
  }) : super(key: key);

  final DocumentReference? service;

  @override
  _AdminAddServicesDurationWidgetState createState() =>
      _AdminAddServicesDurationWidgetState();
}

class _AdminAddServicesDurationWidgetState
    extends State<AdminAddServicesDurationWidget> {
  String? dropDownValue;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 90,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
        ),
      ),
      child: FlutterFlowDropDown<String>(
        initialOption: dropDownValue ??= '15 мин',
        options: FFAppState().adminForCarServicesDuration.toList(),
        onChanged: (val) async {
          setState(() => dropDownValue = val);
          logFirebaseEvent('ADMIN_ADD_SERVICES_DURATION_DropDown_10t');
          logFirebaseEvent('DropDown_backend_call');

          final companyServicesUpdateData = createCompanyServicesRecordData(
            duration: functions.durationToInt(dropDownValue!),
          );
          await widget.service!.update(companyServicesUpdateData);
        },
        width: 40,
        height: 50,
        textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).text3,
              fontWeight: FontWeight.normal,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
            ),
        fillColor: Colors.white,
        elevation: 0,
        borderColor: FlutterFlowTheme.of(context).gray3,
        borderWidth: 0,
        borderRadius: 8,
        margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
        hidesUnderline: true,
      ),
    );
  }
}

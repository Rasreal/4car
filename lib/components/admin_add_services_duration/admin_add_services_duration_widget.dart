import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_add_services_duration_model.dart';
export 'admin_add_services_duration_model.dart';

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
  late AdminAddServicesDurationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAddServicesDurationModel());

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
      width: 90.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
        ),
      ),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownController ??= FormFieldController<String>(
          _model.dropDownValue ??= '15 мин',
        ),
        options: FFAppState().adminForCarServicesDuration.toList(),
        onChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          final companyServicesUpdateData = createCompanyServicesRecordData(
            duration: functions.durationToInt(_model.dropDownValue!),
          );
          await widget.service!.update(companyServicesUpdateData);
        },
        width: 40.0,
        height: 50.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).text3,
              fontWeight: FontWeight.normal,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
        fillColor: Colors.white,
        elevation: 0.0,
        borderColor: FlutterFlowTheme.of(context).gray3,
        borderWidth: 0.0,
        borderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
        hidesUnderline: true,
        isSearchable: false,
      ),
    );
  }
}

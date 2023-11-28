import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'duration_model.dart';
export 'duration_model.dart';

class DurationWidget extends StatefulWidget {
  const DurationWidget({
    Key? key,
    this.services,
  }) : super(key: key);

  final CompanyServicesRecord? services;

  @override
  _DurationWidgetState createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget> {
  late DurationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DurationModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 55.0, 0.0),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??= valueOrDefault<String>(
            widget.services?.durationName,
            '0 мин',
          ),
        ),
        options: FFAppState().adminForCarServicesDuration,
        onChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          await widget.services!.reference
              .update(createCompanyServicesRecordData(
            duration: valueOrDefault<int>(
              functions.durationToInt(valueOrDefault<String>(
                _model.dropDownValue,
                '0',
              )),
              0,
            ),
            durationName: _model.dropDownValue,
          ));
        },
        width: 124.0,
        height: 40.0,
        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Inter',
              color: FlutterFlowTheme.of(context).text3,
              fontWeight: FontWeight.normal,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
        hintText: '0 мин',
        fillColor: Colors.white,
        elevation: 0.0,
        borderColor: FlutterFlowTheme.of(context).gray3,
        borderWidth: 0.0,
        borderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
        hidesUnderline: true,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }
}

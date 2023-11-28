import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_edit_stuff_status_model.dart';
export 'admin_edit_stuff_status_model.dart';

class AdminEditStuffStatusWidget extends StatefulWidget {
  const AdminEditStuffStatusWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final UserRecord? user;

  @override
  _AdminEditStuffStatusWidgetState createState() =>
      _AdminEditStuffStatusWidgetState();
}

class _AdminEditStuffStatusWidgetState
    extends State<AdminEditStuffStatusWidget> {
  late AdminEditStuffStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminEditStuffStatusModel());

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

    return FlutterFlowDropDown<String>(
      controller: _model.dropDown667ValueController ??=
          FormFieldController<String>(
        _model.dropDown667Value ??= widget.user?.adminStatus,
      ),
      options: ['Активен', 'Не активен'],
      onChanged: (val) async {
        setState(() => _model.dropDown667Value = val);
        await widget.user!.reference.update(createUserRecordData(
          adminStatus: _model.dropDown667Value,
        ));
      },
      width: 180.0,
      height: 50.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Roboto',
            color: () {
              if (widget.user?.adminStatus == 'Не активен') {
                return Color(0xFFE20000);
              } else if (widget.user?.adminStatus == 'Активен') {
                return FlutterFlowTheme.of(context).green;
              } else {
                return FlutterFlowTheme.of(context).primaryText;
              }
            }(),
            fontWeight: FontWeight.normal,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
          ),
      icon: Icon(
        FFIcons.kicArrowsButtonDown,
        size: 15.0,
      ),
      fillColor: Colors.white,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 0.0,
      margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
      hidesUnderline: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}

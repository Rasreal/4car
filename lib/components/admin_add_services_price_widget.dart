import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_add_services_price_model.dart';
export 'admin_add_services_price_model.dart';

class AdminAddServicesPriceWidget extends StatefulWidget {
  const AdminAddServicesPriceWidget({
    Key? key,
    this.service,
  }) : super(key: key);

  final CompanyServicesRecord? service;

  @override
  _AdminAddServicesPriceWidgetState createState() =>
      _AdminAddServicesPriceWidgetState();
}

class _AdminAddServicesPriceWidgetState
    extends State<AdminAddServicesPriceWidget> {
  late AdminAddServicesPriceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminAddServicesPriceModel());

    _model.textController =
        TextEditingController(text: widget.service!.price?.toString());
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 89,
      height: 40,
      decoration: BoxDecoration(),
      child: Container(
        width: 89,
        child: TextFormField(
          controller: _model.textController,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController',
            Duration(milliseconds: 1000),
            () async {
              final companyServicesUpdateData = createCompanyServicesRecordData(
                price: double.tryParse(_model.textController.text),
              );
              await widget.service!.reference.update(companyServicesUpdateData);
            },
          ),
          autofocus: true,
          obscureText: false,
          decoration: InputDecoration(
            labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Inter',
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyText1Family),
                ),
            hintText: '0 тг',
            hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                  fontFamily: 'Inter',
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyText2Family),
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).gray3,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).gray3,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).red1,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).red1,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).primaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Inter',
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyText1Family),
              ),
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}

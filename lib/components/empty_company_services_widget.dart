import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EmptyCompanyServicesWidget extends StatefulWidget {
  const EmptyCompanyServicesWidget({
    Key? key,
    this.company,
    this.name,
    this.carBody,
  }) : super(key: key);

  final DocumentReference? company;
  final String? name;
  final String? carBody;

  @override
  _EmptyCompanyServicesWidgetState createState() =>
      _EmptyCompanyServicesWidgetState();
}

class _EmptyCompanyServicesWidgetState
    extends State<EmptyCompanyServicesWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: InkWell(
              onTap: () async {
                logFirebaseEvent('EMPTY_COMPANY_SERVICES_Row_xgzkbxwq_ON_T');
                logFirebaseEvent('Row_backend_call');

                final companyServicesCreateData =
                    createCompanyServicesRecordData(
                  name: widget.name,
                  carBody: widget.carBody,
                );
                await CompanyServicesRecord.createDoc(widget.company!)
                    .set(companyServicesCreateData);
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: Color(0xFFB1B1B1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                    child: Text(
                      widget.name!,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Inter',
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

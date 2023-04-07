import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_services_model.dart';
export 'empty_services_model.dart';

class EmptyServicesWidget extends StatefulWidget {
  const EmptyServicesWidget({Key? key}) : super(key: key);

  @override
  _EmptyServicesWidgetState createState() => _EmptyServicesWidgetState();
}

class _EmptyServicesWidgetState extends State<EmptyServicesWidget> {
  late EmptyServicesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyServicesModel());

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

    return Text(
      'Нет услуг на данный тип кузова.',
      style: FlutterFlowTheme.of(context).bodyMedium,
    );
  }
}

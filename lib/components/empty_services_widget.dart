import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class EmptyServicesWidget extends StatefulWidget {
  const EmptyServicesWidget({Key? key}) : super(key: key);

  @override
  _EmptyServicesWidgetState createState() => _EmptyServicesWidgetState();
}

class _EmptyServicesWidgetState extends State<EmptyServicesWidget> {

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      'Нет услуг на данный тип кузова.',
      style: FlutterFlowTheme.of(context).bodyText1,
    );
  }
}
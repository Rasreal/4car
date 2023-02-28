import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'w_e_b_filter_date_model.dart';
export 'w_e_b_filter_date_model.dart';

class WEBFilterDateWidget extends StatefulWidget {
  const WEBFilterDateWidget({Key? key}) : super(key: key);

  @override
  _WEBFilterDateWidgetState createState() => _WEBFilterDateWidgetState();
}

class _WEBFilterDateWidgetState extends State<WEBFilterDateWidget> {
  late WEBFilterDateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WEBFilterDateModel());

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

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 461,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          width: 500,
          height: 400,
          child: custom_widgets.RangeCalendarContainer(
            width: 500,
            height: 400,
            widthCalendar: 250.0,
            heightCalendar: 300.0,
            bottomsheetClose: () async {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

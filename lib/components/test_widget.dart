import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late TestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());

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

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 500,
        height: 500,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).gray1,
        ),
        child: FlutterFlowCalendar(
          color: FlutterFlowTheme.of(context).primaryColor,
          weekFormat: false,
          weekStartsMonday: true,
          initialDate: getCurrentTimestamp,
          rowHeight: 40,
          onChange: (DateTimeRange? newSelectedDate) {
            setState(() => _model.calendarSelectedDay = newSelectedDate);
          },
          titleStyle: TextStyle(),
          dayOfWeekStyle: TextStyle(),
          dateStyle: TextStyle(),
          selectedDateStyle: TextStyle(),
          inactiveDateStyle: TextStyle(),
          locale: FFLocalizations.of(context).languageCode,
        ),
      ),
    );
  }
}

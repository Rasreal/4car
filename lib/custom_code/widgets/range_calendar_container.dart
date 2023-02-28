// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
class RangeCalendarContainer extends StatefulWidget {
  const RangeCalendarContainer({
    Key? key,
    this.width,
    this.height,
    required this.bottomsheetClose,
    required this.widthCalendar,
    required this.heightCalendar,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() bottomsheetClose;
  final double widthCalendar;
  final double heightCalendar;
  @override
  _RangeCalendarContainerState createState() => _RangeCalendarContainerState();
}

class _RangeCalendarContainerState extends State<RangeCalendarContainer> {
  List<DateTime> rangeForCancel = [];
  List<String> nameForCancel = [];

  double wid = 461;
  double hei = 461;

  double widCal = 461;
  double heiCal = 461;
  Future<dynamic> Function()? func;
  @override
  void initState() {
    super.initState();
    wid = widget.width!;
    hei = widget.height!;
    widCal = widget.widthCalendar!;
    heiCal = widget.heightCalendar!;
    func = widget.bottomsheetClose;
    FFAppState().webFilterDayName = FFAppState().webListNames.isNotEmpty
        ? FFAppState().webListNames.last
        : 'Сегодня';
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: wid! ?? 461,
        height: hei,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                FFAppState().webFilterDayName = 'Сегодня';
                                nameForCancel
                                    .add(FFAppState().webFilterDayName);
                                var ab = DateTime.now();
                                var ab2 = DateTime.now();
                                ab = DateTime(
                                    ab.year, ab.month, ab.day, 23, 59, 59, 4);
                                ab2 = DateTime(
                                    ab2.year, ab2.month, ab2.day, 0, 0, 0, 1);
                                rangeDatePickerValueWithDefaultValue = [
                                  ab,
                                  ab2
                                ];
                                rangeForCancel.add(ab);
                                rangeForCancel.add(ab2);
                              });
                            },
                            child: Text(
                              'Сегодня',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FFAppState().webFilterDayName ==
                                            'Сегодня'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                var now = new DateTime.now();

                                var now_1w = now.subtract(Duration(days: 1));
                                now_1w = DateTime(now_1w.year, now_1w.month,
                                    now_1w.day, 0, 0, 0, 1);
                                rangeDatePickerValueWithDefaultValue = [
                                  now_1w,
                                  now
                                ];
                                FFAppState().webFilterDayName = 'Вчера';
                                rangeForCancel.add(now_1w);
                                rangeForCancel.add(now);
                                nameForCancel
                                    .add(FFAppState().webFilterDayName);
                              });
                            },
                            child: Text(
                              'Вчера',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color:
                                        FFAppState().webFilterDayName == 'Вчера'
                                            ? FlutterFlowTheme.of(context)
                                                .primaryColor
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                var now = new DateTime.now();
                                var now_1w = now.subtract(Duration(days: 7));
                                now_1w = DateTime(now_1w.year, now_1w.month,
                                    now_1w.day, 0, 0, 0, 1);
                                rangeDatePickerValueWithDefaultValue = [
                                  now_1w,
                                  now
                                ];
                                FFAppState().webFilterDayName =
                                    'Последние 7 дней';
                                nameForCancel
                                    .add(FFAppState().webFilterDayName);
                                rangeForCancel.add(now_1w);
                                rangeForCancel.add(now);
                              });
                            },
                            child: Text(
                              'Последние 7 дней',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FFAppState().webFilterDayName ==
                                            'Последние 7 дней'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                var now = new DateTime.now();

                                var now_1m = new DateTime(
                                    now.year, now.month - 1, now.day, 0, 0, 0);
                                rangeDatePickerValueWithDefaultValue = [
                                  now_1m,
                                  now
                                ];
                                FFAppState().webFilterDayName =
                                    'Последние 30 дней';
                                nameForCancel
                                    .add(FFAppState().webFilterDayName);
                                rangeForCancel.add(now_1m);
                                rangeForCancel.add(now);
                              });
                            },
                            child: Text(
                              'Последние 30 дней',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FFAppState().webFilterDayName ==
                                            'Последние 30 дней'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                var now = new DateTime.now();
                                var now_1w = now.subtract(Duration(days: 7));
                                var now_1m = new DateTime(
                                    now.year, now.month - 1, now.day);
                                rangeDatePickerValueWithDefaultValue = [
                                  now_1m,
                                  now
                                ];
                                rangeForCancel.add(now_1m);
                                rangeForCancel.add(now);
                                FFAppState().webFilterDayName =
                                    'Отчетный месяц';
                                nameForCancel
                                    .add(FFAppState().webFilterDayName);
                              });
                            },
                            child: Text(
                              'Отчетный месяц',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FFAppState().webFilterDayName ==
                                            'Отчетный месяц'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                var now = new DateTime.now();
                                var now_1w = now.subtract(Duration(days: 7));
                                var now_1y = new DateTime(
                                    now.year - 1, now.month, now.day);
                                rangeDatePickerValueWithDefaultValue = [
                                  now_1y,
                                  now
                                ];
                                rangeForCancel.add(now_1y);
                                rangeForCancel.add(now);
                                FFAppState().webFilterDayName = 'Год';
                                nameForCancel
                                    .add(FFAppState().webFilterDayName);
                              });
                            },
                            child: Text(
                              'Год',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color:
                                        FFAppState().webFilterDayName == 'Год'
                                            ? FlutterFlowTheme.of(context)
                                                .primaryColor
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                var now = new DateTime.now();
                                var now_1w = new DateTime(
                                    now.year - 30, now.month - 1, now.day);
                                var now_1m = new DateTime(
                                    now.year, now.month - 1, now.day);
                                rangeDatePickerValueWithDefaultValue = [];
                                FFAppState().webFilterDayName = 'За все время';
                                rangeForCancel.add(now_1w);
                                rangeForCancel.add(now);
                                rangeDatePickerValueWithDefaultValue = [
                                  now_1w,
                                  now
                                ];
                                nameForCancel
                                    .add(FFAppState().webFilterDayName);
                              });
                            },
                            child: Text(
                              'За все время',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FFAppState().webFilterDayName ==
                                                null ||
                                            FFAppState().webFilterDayName == ''
                                        ? FlutterFlowTheme.of(context)
                                            .primaryColor
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 316,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: FlutterFlowTheme.of(context).gray4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 16),
                    child: Container(
                      child: RangeCalendar(
                        width: widCal,
                        height: heiCal,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: FlutterFlowTheme.of(context).gray4,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        getValueText(
                          config.calendarType,
                          rangeDatePickerValueWithDefaultValue,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              color: FlutterFlowTheme.of(context).gray2,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          if (rangeForCancel.length % 2 == 0 &&
                              rangeForCancel.length > 1) {
                            rangeDatePickerValueWithDefaultValue = [];
                            int a = rangeForCancel.length - 1;

                            rangeDatePickerValueWithDefaultValue
                                .add(rangeForCancel[a - 3]);
                            rangeDatePickerValueWithDefaultValue
                                .add(rangeForCancel[a - 2]);

                            rangeForCancel.removeAt(a);
                            rangeForCancel.removeAt(a - 1);
                          }
                          nameForCancel.removeLast();
                          if (nameForCancel.length >= 1) {
                            int a = nameForCancel.length - 1;
                            FFAppState().webFilterDayName = nameForCancel[a];
                          } else
                            FFAppState().webFilterDayName = 'Сегодня';

                          FFAppState().webListNames.addAll(nameForCancel);
                          print('Button pressed ...');

                          setState(() {});
                          widget.bottomsheetClose();
                        },
                        text: 'Отмена',
                        options: FFButtonOptions(
                          width: 84,
                          height: 32,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle2Family,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle2Family),
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                        DateTime a = rangeDatePickerValueWithDefaultValue[0]!;
                        DateTime bbb = rangeDatePickerValueWithDefaultValue[1]!;
                        if (a.isAfter(bbb) &&
                            (rangeDatePickerValueWithDefaultValue[1] != null &&
                                rangeDatePickerValueWithDefaultValue[0] !=
                                    null)) {
                          FFAppState().WEBFilterEndDate = a;
                          FFAppState().WEBFilterStartDate = bbb;
                        } else {
                          FFAppState().WEBFilterEndDate = bbb;
                          FFAppState().WEBFilterStartDate = a;
                        }
                        FFAppState().webListNames.addAll(nameForCancel);
                        setState(() {});
                        widget.bottomsheetClose();
                        FFAppState().webFilterDayName =
                            FFAppState().webFilterDayName;
                        func;
                      },
                      text: 'Выбрать',
                      options: FFButtonOptions(
                        width: 84,
                        height: 32,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).subtitle2Family,
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).subtitle2Family),
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<DateTime?> rangeDatePickerValueWithDefaultValue = [DateTime.now()];
String getValueText(
  CalendarDatePicker2Type datePickerType,
  List<DateTime?> values,
) {
  var valueText = (values.isNotEmpty ? values[0] : null)
      .toString()
      .replaceAll('00:00:00.000', '');

  if (datePickerType == CalendarDatePicker2Type.multi) {
    valueText = values.isNotEmpty
        ? values
            .map((v) => v.toString().replaceAll('00:00:00.000', ''))
            .join(', ')
        : 'null';
  } else if (datePickerType == CalendarDatePicker2Type.range) {
    if (values.isNotEmpty) {
      String startDate = values[0].toString().replaceAll('00:00:00.000', '');
      //final starDate2 = DateFormat.dMM.format(now);
      String endDate = values.length > 1
          ? values[1].toString().replaceAll('00:00:00.000', '')
          : 'null';
      if (startDate != 'null' && startDate.length > 12)
        startDate = startDate.substring(0, startDate.length - 12);
      if (endDate != 'null' && endDate.length > 12)
        endDate = endDate.substring(0, endDate.length - 12);
      valueText = '$startDate до $endDate';
    } else {
      return '';
    }
  }

  return valueText;
}

final config = CalendarDatePicker2Config(
  calendarType: CalendarDatePicker2Type.range,
  selectedDayHighlightColor: Colors.blue,
  weekdayLabelTextStyle: const TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.normal,
  ),
  controlsTextStyle: const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  ),
);

class RangeCalendar extends StatefulWidget {
  const RangeCalendar({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _RangeCalendarState createState() => _RangeCalendarState();
}

class _RangeCalendarState extends State<RangeCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: _buildDefaultRangeDatePickerWithValue(),
    );
  }

  Widget _buildDefaultRangeDatePickerWithValue() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        CalendarDatePicker2(
          config: config,
          initialValue: rangeDatePickerValueWithDefaultValue,
          onValueChanged: (values) {
            setState(() => rangeDatePickerValueWithDefaultValue = values);
            DateTime a = rangeDatePickerValueWithDefaultValue[0]!;
            DateTime bbb = rangeDatePickerValueWithDefaultValue[1]!;
            if (rangeDatePickerValueWithDefaultValue[1] == null &&
                rangeDatePickerValueWithDefaultValue[0] != null) {
              if (a.isBefore(DateTime.now())) {
                FFAppState().WEBFilterStartDate = a;
                FFAppState().WEBFilterEndDate = DateTime.now();
              } else {
                FFAppState().WEBFilterStartDate = DateTime.now();
                ;
                FFAppState().WEBFilterEndDate = a;
              }
            }
            if (a.isAfter(bbb) &&
                (rangeDatePickerValueWithDefaultValue[1] != null &&
                    rangeDatePickerValueWithDefaultValue[0] != null)) {
              FFAppState().WEBFilterEndDate = a;
              FFAppState().WEBFilterStartDate = bbb;
            } else {
              FFAppState().WEBFilterEndDate = bbb;
              FFAppState().WEBFilterStartDate = a;
            }
            setState(() {});
          },
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

class FFButtonOptions {
  const FFButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
    this.hoverColor,
    this.hoverBorderSide,
    this.hoverTextColor,
    this.hoverElevation,
  });

  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Color? hoverColor;
  final BorderSide? hoverBorderSide;
  final Color? hoverTextColor;
  final double? hoverElevation;
}

class FFButtonWidget extends StatefulWidget {
  const FFButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconData,
    required this.options,
    this.showLoadingIndicator = true,
  }) : super(key: key);

  final String text;
  final Widget? icon;
  final IconData? iconData;
  final Function()? onPressed;
  final FFButtonOptions options;
  final bool showLoadingIndicator;

  @override
  State<FFButtonWidget> createState() => _FFButtonWidgetState();
}

class _FFButtonWidgetState extends State<FFButtonWidget> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Widget textWidget = loading
        ? Center(
            child: Container(
              width: 23,
              height: 23,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  widget.options.textStyle!.color ?? Colors.white,
                ),
              ),
            ),
          )
        : AutoSizeText(
            widget.text,
            style: widget.options.textStyle?.withoutColor(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );

    final onPressed = widget.onPressed != null
        ? (widget.showLoadingIndicator
            ? () async {
                if (loading) {
                  return;
                }
                setState(() => loading = true);
                try {
                  await widget.onPressed!();
                } finally {
                  if (mounted) {
                    setState(() => loading = false);
                  }
                }
              }
            : () => widget.onPressed!())
        : null;

    ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) {
          if (states.contains(MaterialState.hovered) &&
              widget.options.hoverBorderSide != null) {
            return RoundedRectangleBorder(
              borderRadius:
                  widget.options.borderRadius ?? BorderRadius.circular(8),
              side: widget.options.hoverBorderSide!,
            );
          }
          return RoundedRectangleBorder(
            borderRadius:
                widget.options.borderRadius ?? BorderRadius.circular(8),
            side: widget.options.borderSide ?? BorderSide.none,
          );
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return widget.options.disabledTextColor ?? Colors.white;
          }
          if (states.contains(MaterialState.hovered) &&
              widget.options.hoverTextColor != null) {
            return widget.options.hoverTextColor;
          }
          return widget.options.textStyle?.color ?? Colors.white;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return widget.options.disabledColor;
          }
          if (states.contains(MaterialState.hovered) &&
              widget.options.hoverColor != null) {
            return widget.options.hoverColor;
          }
          return widget.options.color;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.pressed)) {
          return widget.options.splashColor;
        }
        return null;
      }),
      padding: MaterialStateProperty.all(widget.options.padding ??
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0)),
      elevation: MaterialStateProperty.resolveWith<double>(
        (states) {
          if (states.contains(MaterialState.hovered) &&
              widget.options.hoverElevation != null) {
            return widget.options.hoverElevation!;
          }
          return widget.options.elevation ?? 0.0;
        },
      ),
    );

    if (widget.icon != null || widget.iconData != null) {
      return Container(
        height: widget.options.height,
        width: widget.options.width,
        child: ElevatedButton.icon(
          icon: Padding(
            padding: widget.options.iconPadding ?? EdgeInsets.zero,
            child: widget.icon ??
                FaIcon(
                  widget.iconData,
                  size: widget.options.iconSize,
                  color: widget.options.iconColor ??
                      widget.options.textStyle!.color,
                ),
          ),
          label: textWidget,
          onPressed: onPressed,
          style: style,
        ),
      );
    }

    return Container(
      height: widget.options.height,
      width: widget.options.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: textWidget,
      ),
    );
  }
}

extension _WithoutColorExtension on TextStyle {
  TextStyle withoutColor() => TextStyle(
        inherit: inherit,
        color: null,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        textBaseline: textBaseline,
        height: height,
        leadingDistribution: leadingDistribution,
        locale: locale,
        foreground: foreground,
        background: background,
        shadows: shadows,
        fontFeatures: fontFeatures,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
        debugLabel: debugLabel,
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        // The _package field is private so unfortunately we can't set it here,
        // but it's almost always unset anyway.
        // package: _package,
        overflow: overflow,
      );
}

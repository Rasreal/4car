import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_booked_time_slot_widget.dart';
import '../components/select_services_widget.dart';
import '../components/success_widget.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminNewBookingRecordWidget extends StatefulWidget {
  const AdminNewBookingRecordWidget({
    Key? key,
    this.company,
  }) : super(key: key);

  final CompaniesRecord? company;

  @override
  _AdminNewBookingRecordWidgetState createState() =>
      _AdminNewBookingRecordWidgetState();
}

class _AdminNewBookingRecordWidgetState
    extends State<AdminNewBookingRecordWidget> {
  BookingsRecord? booking;
  DateTime? datePicked;
  TextEditingController? textController1;
  TextEditingController? textController3;
  final textFieldKey2 = GlobalKey();
  TextEditingController? textController2;
  String? textFieldSelectedOption2;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 479,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Новая запись',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText1Family,
                          fontSize: 20,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText1Family),
                        ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FFIcons.kicClose,
                      color: FlutterFlowTheme.of(context).gray2,
                      size: 24,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'Имя гостя',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: TextFormField(
                  controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Имя',
                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyText2Family,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyText2Family),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).gray2,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).gray2,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'Дата записи',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: InkWell(
                  onTap: () async {
                    if (kIsWeb) {
                      final _datePickedDate = await showDatePicker(
                        context: context,
                        initialDate: getCurrentTimestamp,
                        firstDate: getCurrentTimestamp,
                        lastDate: DateTime(2050),
                      );

                      if (_datePickedDate != null) {
                        setState(
                          () => datePicked = DateTime(
                            _datePickedDate.year,
                            _datePickedDate.month,
                            _datePickedDate.day,
                          ),
                        );
                      }
                    } else {
                      await DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        onConfirm: (date) {
                          setState(() => datePicked = date);
                        },
                        currentTime: getCurrentTimestamp,
                        minTime: getCurrentTimestamp,
                        locale: LocaleType.values.firstWhere(
                          (l) =>
                              l.name ==
                              FFLocalizations.of(context).languageCode,
                          orElse: () => LocaleType.en,
                        ),
                      );
                    }

                    FFAppState().update(() {
                      FFAppState().adminSelectBookingDate = datePicked;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).gray2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  'd/M/y',
                                  FFAppState().adminSelectBookingDate,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'null',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          ),
                          Icon(
                            FFIcons.kicCalendar,
                            color: FlutterFlowTheme.of(context).gray2,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'Время',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FutureBuilder<List<ForcarTimesRecord>>(
                  future: queryForcarTimesRecordOnce(
                    queryBuilder: (forcarTimesRecord) =>
                        forcarTimesRecord.orderBy('time_order'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<ForcarTimesRecord> wrapForcarTimesRecordList =
                        snapshot.data!;
                    if (wrapForcarTimesRecordList.isEmpty) {
                      return Center(
                        child: EmptyBookedTimeSlotWidget(),
                      );
                    }
                    return Wrap(
                      spacing: 0,
                      runSpacing: 0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(wrapForcarTimesRecordList.length,
                          (wrapIndex) {
                        final wrapForcarTimesRecord =
                            wrapForcarTimesRecordList[wrapIndex];
                        return Visibility(
                          visible: (functions.comparisonTime(
                                      getCurrentTimestamp,
                                      wrapForcarTimesRecord.timeOrder!,
                                      FFAppState().adminSelectBookingDate!) ==
                                  true) &&
                              (wrapForcarTimesRecord.timeOrder! >=
                                  widget.company!.openTimeOrder!) &&
                              (wrapForcarTimesRecord.timeOrder! <=
                                  widget.company!.closedTimeOrder!),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 16, 16),
                            child: StreamBuilder<List<BookingsRecord>>(
                              stream: queryBookingsRecord(
                                queryBuilder: (bookingsRecord) => bookingsRecord
                                    .where('time_name',
                                        isEqualTo:
                                            wrapForcarTimesRecord.timeName != ''
                                                ? wrapForcarTimesRecord.timeName
                                                : null)
                                    .where('time_order',
                                        isEqualTo:
                                            wrapForcarTimesRecord.timeOrder)
                                    .where('booked_date',
                                        isEqualTo:
                                            FFAppState().adminSelectBookingDate)
                                    .where('booked_company',
                                        isEqualTo: widget.company!.reference)
                                    .where('cancelled', isEqualTo: false),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<BookingsRecord>
                                    containerBookingsRecordList =
                                    snapshot.data!;
                                return InkWell(
                                  onTap: () async {
                                    if (containerBookingsRecordList.length <
                                        widget.company!.countBox!) {
                                      if (FFAppState().selectedTimeSlot ==
                                          wrapForcarTimesRecord.reference) {
                                        FFAppState().update(() {
                                          FFAppState().selectedTimeSlot = null;
                                          FFAppState().price = 0;
                                          FFAppState().selectedServices = [];
                                        });
                                      } else {
                                        FFAppState().update(() {
                                          FFAppState().selectedTimeSlot =
                                              wrapForcarTimesRecord.reference;
                                          FFAppState().selectedServices = [];
                                          FFAppState().price = 0;
                                          FFAppState()
                                              .selectedServicesDuration = 0;
                                          FFAppState().bookedTimes = [];
                                        });
                                        FFAppState().update(() {
                                          FFAppState().addToBookedTimes(
                                              wrapForcarTimesRecord.timeOrder!);
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 67,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: () {
                                        if (containerBookingsRecordList
                                                .length >=
                                            widget.company!.countBox!) {
                                          return FlutterFlowTheme.of(context)
                                              .secondaryBackground;
                                        } else if (FFAppState()
                                                .selectedTimeSlot ==
                                            wrapForcarTimesRecord.reference) {
                                          return FlutterFlowTheme.of(context)
                                              .primaryColor;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: () {
                                          if (containerBookingsRecordList
                                                  .length >=
                                              widget.company!.countBox!) {
                                            return FlutterFlowTheme.of(context)
                                                .gray3;
                                          } else if (FFAppState()
                                                  .selectedTimeSlot ==
                                              wrapForcarTimesRecord.reference) {
                                            return FlutterFlowTheme.of(context)
                                                .primaryColor;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .primaryColor;
                                          }
                                        }(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          wrapForcarTimesRecord.timeName,
                                          '---',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color: () {
                                                if (containerBookingsRecordList
                                                        .length >=
                                                    widget.company!.countBox!) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .gray3;
                                                } else if (FFAppState()
                                                        .selectedTimeSlot ==
                                                    wrapForcarTimesRecord
                                                        .reference) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor;
                                                }
                                              }(),
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'Кузов и номер машины',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                        child: Autocomplete<String>(
                          initialValue: TextEditingValue(),
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return [
                              'Седан',
                              'Хэтчбек',
                              'Универсал ',
                              'Кроссовер',
                              'Джип',
                              'Пикап',
                              'Минивен',
                              'Микроавтобус'
                            ].where((option) {
                              final lowercaseOption = option.toLowerCase();
                              return lowercaseOption.contains(
                                  textEditingValue.text.toLowerCase());
                            });
                          },
                          optionsViewBuilder: (context, onSelected, options) {
                            return AutocompleteOptionsList(
                              textFieldKey: textFieldKey2,
                              textController: textController2!,
                              options: options.toList(),
                              onSelected: onSelected,
                              textStyle: FlutterFlowTheme.of(context).bodyText1,
                              textHighlightStyle: TextStyle(),
                              elevation: 4,
                              optionBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              optionHighlightColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              maxHeight: 200,
                            );
                          },
                          onSelected: (String selection) {
                            setState(
                                () => textFieldSelectedOption2 = selection);
                            FocusScope.of(context).unfocus();
                          },
                          fieldViewBuilder: (
                            context,
                            textEditingController,
                            focusNode,
                            onEditingComplete,
                          ) {
                            textController2 = textEditingController;
                            return TextFormField(
                              key: textFieldKey2,
                              controller: textEditingController,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Седан',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).gray2,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).gray2,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: textController3,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '345YDS02',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText2Family,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText2Family),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).gray2,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).gray2,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyText1Family,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodyText1Family),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'Услуги',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyText1Family,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyText1Family),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: InkWell(
                  onTap: () async {
                    if (FFAppState().selectedTimeSlot != null) {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: SelectServicesWidget(
                              company: widget.company!.reference,
                              carBody: textFieldSelectedOption2,
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    } else {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Выберите время для записи'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).gray2,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (FFAppState().selectedServices.length == null)
                            Text(
                              'Комплексная мойка',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyText1Family,
                                    color: FlutterFlowTheme.of(context).gray2,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyText1Family),
                                  ),
                            ),
                          if (FFAppState().selectedServices.length != null)
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      functions.listStringToString(
                                          FFAppState()
                                              .bookingSelectedServicesName
                                              .toList(),
                                          30),
                                      '0',
                                    ).maybeHandleOverflow(maxChars: 80),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          Icon(
                            FFIcons.kicArrowsButtonDown,
                            color: FlutterFlowTheme.of(context).gray2,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (FFAppState().selectedTimeSlot != null)
                StreamBuilder<ForcarTimesRecord>(
                  stream: ForcarTimesRecord.getDocument(
                      FFAppState().selectedTimeSlot!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    final columnForcarTimesRecord = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Сумма: ${valueOrDefault<String>(
                                    FFAppState().price.toString(),
                                    '0',
                                  )}тг',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1Family),
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (FFAppState().selectedServicesDuration <=
                                      60)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        '${valueOrDefault<String>(
                                          columnForcarTimesRecord.timeName,
                                          '0',
                                        )} - ${valueOrDefault<String>(
                                          functions
                                              .addTimeOrder(
                                                  columnForcarTimesRecord
                                                      .timeOrder,
                                                  1)
                                              .toString(),
                                          '0',
                                        )}:00',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                      ),
                                    ),
                                  if ((FFAppState().selectedServicesDuration >
                                          60) &&
                                      (FFAppState().selectedServicesDuration <=
                                          120))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            columnForcarTimesRecord.timeName,
                                            '0',
                                          )} - ${valueOrDefault<String>(
                                            functions
                                                .addTimeOrder(
                                                    columnForcarTimesRecord
                                                        .timeOrder,
                                                    2)
                                                .toString(),
                                            '0',
                                          )}:00',
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                      ),
                                    ),
                                  if ((FFAppState().selectedServicesDuration >
                                          120) &&
                                      (FFAppState().selectedServicesDuration <=
                                          180))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        '${valueOrDefault<String>(
                                          columnForcarTimesRecord.timeName,
                                          '0',
                                        )} - ${valueOrDefault<String>(
                                          functions
                                              .addTimeOrder(
                                                  columnForcarTimesRecord
                                                      .timeOrder,
                                                  3)
                                              .toString(),
                                          '0',
                                        )}:00',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                      ),
                                    ),
                                  if ((FFAppState().selectedServicesDuration >
                                          180) &&
                                      (FFAppState().selectedServicesDuration <=
                                          240))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Text(
                                        '${valueOrDefault<String>(
                                          columnForcarTimesRecord.timeName,
                                          '0',
                                        )} - ${valueOrDefault<String>(
                                          functions
                                              .addTimeOrder(
                                                  columnForcarTimesRecord
                                                      .timeOrder,
                                                  4)
                                              .toString(),
                                          '0',
                                        )}:00',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().update(() {
                                FFAppState().bookedTimes = functions
                                    .listSelectedTimesOrder(
                                        FFAppState().selectedServicesDuration,
                                        columnForcarTimesRecord.timeOrder!)
                                    .toList();
                                FFAppState().selectedServices = [];
                              });

                              final bookingsCreateData = {
                                ...createBookingsRecordData(
                                  bookedCompany: widget.company!.reference,
                                  timeName: columnForcarTimesRecord.timeName,
                                  timeOrder: columnForcarTimesRecord.timeOrder,
                                  status: 'Забронировано',
                                  bookedDate: datePicked,
                                  totalPrice: FFAppState().price,
                                  id: valueOrDefault<String>(
                                    functions.idGenerator(valueOrDefault<int>(
                                      random_data.randomInteger(
                                          100000, 999000000),
                                      0,
                                    )),
                                    '0',
                                  ),
                                  carBody: textFieldSelectedOption2,
                                  carName: textController3!.text,
                                  bookedCompanyDocument:
                                      widget.company!.companyDocument,
                                  bookedDateString: dateTimeFormat(
                                    'd/M/y',
                                    datePicked,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  createdByAdmin: true,
                                ),
                                'selected_company_services':
                                    FFAppState().selectedServices,
                                'selected_times_order':
                                    FFAppState().bookedTimes,
                                'selected_company_services_name':
                                    FFAppState().bookingSelectedServicesName,
                              };
                              var bookingsRecordReference =
                                  BookingsRecord.collection.doc();
                              await bookingsRecordReference
                                  .set(bookingsCreateData);
                              booking = BookingsRecord.getDocumentFromData(
                                  bookingsCreateData, bookingsRecordReference);
                              Navigator.pop(context);
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: SuccessWidget(
                                      message: 'Запись добавлена',
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));

                              setState(() {});
                            },
                            text: 'Записаться',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .subtitle2Family,
                                    color: Colors.white,
                                    fontSize: 16,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .subtitle2Family),
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

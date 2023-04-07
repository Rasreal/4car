import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_select_services/admin_select_services_widget.dart';
import '/components/empty_booked_time_slot/empty_booked_time_slot_widget.dart';
import '/components/success/success_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'admin_new_booking_record_model.dart';
export 'admin_new_booking_record_model.dart';

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
  late AdminNewBookingRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminNewBookingRecordModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
    _model.textController3 ??= TextEditingController();
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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 479.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
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
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 20.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      FFIcons.kicClose,
                      color: FlutterFlowTheme.of(context).gray2,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  'Имя гостя',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Имя',
                    hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodySmallFamily,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodySmallFamily),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).gray2,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                  validator:
                      _model.textController1Validator.asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  'Дата записи',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    final _datePickedDate = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: getCurrentTimestamp,
                      lastDate: DateTime(2050),
                    );

                    if (_datePickedDate != null) {
                      setState(() {
                        _model.datePicked = DateTime(
                          _datePickedDate.year,
                          _datePickedDate.month,
                          _datePickedDate.day,
                        );
                      });
                    }
                    FFAppState().update(() {
                      FFAppState().adminSelectBookingDate = _model.datePicked;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).gray2,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                                'Выбрать',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Icon(
                            FFIcons.kicCalendar,
                            color: FlutterFlowTheme.of(context).gray2,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  'Время',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
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
                      spacing: 0.0,
                      runSpacing: 0.0,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 16.0),
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
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
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
                                    width: 67.0,
                                    height: 32.0,
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
                                              .primary;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .primaryBackground;
                                        }
                                      }(),
                                      borderRadius: BorderRadius.circular(8.0),
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
                                                .primary;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .primary;
                                          }
                                        }(),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          wrapForcarTimesRecord.timeName,
                                          '---',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
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
                                                      .primary;
                                                }
                                              }(),
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  'Кузов и номер машины',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                        child: Autocomplete<String>(
                          initialValue: TextEditingValue(),
                          optionsBuilder: (textEditingValue) {
                            if (textEditingValue.text == '') {
                              return const Iterable<String>.empty();
                            }
                            return [
                              'Седан',
                              'Хэтчбэк',
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
                              textFieldKey: _model.textFieldKey2,
                              textController: _model.textController2!,
                              options: options.toList(),
                              onSelected: onSelected,
                              textStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              textHighlightStyle: TextStyle(),
                              elevation: 4.0,
                              optionBackgroundColor:
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              optionHighlightColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              maxHeight: 200.0,
                            );
                          },
                          onSelected: (String selection) {
                            setState(() =>
                                _model.textFieldSelectedOption2 = selection);
                            FocusScope.of(context).unfocus();
                          },
                          fieldViewBuilder: (
                            context,
                            textEditingController,
                            focusNode,
                            onEditingComplete,
                          ) {
                            _model.textController2 = textEditingController;
                            return TextFormField(
                              key: _model.textFieldKey2,
                              controller: textEditingController,
                              focusNode: focusNode,
                              onEditingComplete: onEditingComplete,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController2',
                                Duration(milliseconds: 2000),
                                () async {
                                  FFAppState().update(() {
                                    FFAppState().selectedServices = [];
                                    FFAppState().price = 0;
                                    FFAppState().bookingSelectedServicesName =
                                        [];
                                  });
                                },
                              ),
                              onFieldSubmitted: (_) async {
                                FFAppState().update(() {
                                  FFAppState().selectedServices = [];
                                  FFAppState().price = 0;
                                  FFAppState().bookingSelectedServicesName = [];
                                });
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Седан',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodySmallFamily,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).gray2,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              validator: _model.textController2Validator
                                  .asValidator(context),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _model.textController3,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '345YDS02',
                          hintStyle: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodySmallFamily,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodySmallFamily),
                              ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).gray2,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontWeight: FontWeight.normal,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        validator: _model.textController3Validator
                            .asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Text(
                  'Услуги',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: InkWell(
                  onTap: () async {
                    if (FFAppState().selectedTimeSlot != null) {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Color(0x00000000),
                        context: context,
                        builder: (bottomSheetContext) {
                          return Padding(
                            padding:
                                MediaQuery.of(bottomSheetContext).viewInsets,
                            child: AdminSelectServicesWidget(
                              company: widget.company!.reference,
                              carBody: _model.textController2.text,
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
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).gray2,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (FFAppState().selectedServices.length == null)
                            Text(
                              'Комплексная мойка',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context).gray2,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
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
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          Icon(
                            FFIcons.kicArrowsButtonDown,
                            color: FlutterFlowTheme.of(context).gray2,
                            size: 24.0,
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
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    final columnForcarTimesRecord = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 0.0),
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
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
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
                                          0.0, 8.0, 0.0, 0.0),
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
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  if ((FFAppState().selectedServicesDuration >
                                          60) &&
                                      (FFAppState().selectedServicesDuration <=
                                          120))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
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
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  if ((FFAppState().selectedServicesDuration >
                                          120) &&
                                      (FFAppState().selectedServicesDuration <=
                                          180))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
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
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                  if ((FFAppState().selectedServicesDuration >
                                          180) &&
                                      (FFAppState().selectedServicesDuration <=
                                          240))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
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
                                            .bodySmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily),
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
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
                              if (FFAppState().adminSelectBookingDate != null) {
                                final bookingsCreateData = {
                                  ...createBookingsRecordData(
                                    bookedCompany: widget.company!.reference,
                                    timeName: columnForcarTimesRecord.timeName,
                                    timeOrder:
                                        columnForcarTimesRecord.timeOrder,
                                    status: 'Забронировано',
                                    bookedDate:
                                        FFAppState().adminSelectBookingDate,
                                    totalPrice: FFAppState().price,
                                    id: valueOrDefault<String>(
                                      functions.idGenerator(valueOrDefault<int>(
                                        random_data.randomInteger(
                                            100000, 999000000),
                                        0,
                                      )),
                                      '0',
                                    ),
                                    carBody: _model.textFieldSelectedOption2,
                                    carName: _model.textController3.text,
                                    bookedCompanyDocument:
                                        widget.company!.companyDocument,
                                    bookedDateString: dateTimeFormat(
                                      'd/M/y',
                                      FFAppState().adminSelectBookingDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    createdByAdmin: true,
                                    createdAdminUserName:
                                        _model.textController1.text,
                                    cancelled: false,
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
                                _model.booking =
                                    BookingsRecord.getDocumentFromData(
                                        bookingsCreateData,
                                        bookingsRecordReference);
                                Navigator.pop(context);
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Color(0x00000000),
                                  enableDrag: false,
                                  context: context,
                                  builder: (bottomSheetContext) {
                                    return Padding(
                                      padding: MediaQuery.of(bottomSheetContext)
                                          .viewInsets,
                                      child: SuccessWidget(
                                        message: 'Запись добавлена',
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));

                                FFAppState().update(() {
                                  FFAppState().adminSelectBookingDate = null;
                                });
                              }

                              setState(() {});
                            },
                            text: 'Записаться',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
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

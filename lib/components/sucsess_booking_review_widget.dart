import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/car_wash_company_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class SucsessBookingReviewWidget extends StatefulWidget {
  const SucsessBookingReviewWidget({
    Key? key,
    this.booking,
  }) : super(key: key);

  final DocumentReference? booking;

  @override
  _SucsessBookingReviewWidgetState createState() =>
      _SucsessBookingReviewWidgetState();
}

class _SucsessBookingReviewWidgetState
    extends State<SucsessBookingReviewWidget> {

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните форму';
    }

    return null;
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();

    textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 600,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: FutureBuilder<BookingsRecord>(
        future: BookingsRecord.getDocumentOnce(widget.booking!),
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
          final columnBookingsRecord = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: StreamBuilder<CompaniesRecord>(
                  stream: CompaniesRecord.getDocument(
                      columnBookingsRecord.bookedCompany!),
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
                    final columnCompaniesRecord = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 4, 0, 16),
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Text(
                            'Как прошла ваша мойка?',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyText1Family,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyText1Family),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: FlutterFlowTheme.of(context).gray3,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                        MediaQuery.of(context).viewInsets,
                                        child: CarWashCompanyWidget(
                                          currentCompanyLink:
                                          columnCompaniesRecord.reference,
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              columnCompaniesRecord.logo,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/e4car-dch9vg/assets/mq76tomaqbk1/4car.png',
                                            ),
                                          ).image,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 6),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 0, 4, 0),
                                                    child: Text(
                                                      columnCompaniesRecord
                                                          .name!,
                                                      style:
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1Family,
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                            .containsKey(
                                                            FlutterFlowTheme.of(context)
                                                                .bodyText1Family),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 6,
                                                    height: 6,
                                                    decoration: BoxDecoration(
                                                      color:
                                                      valueOrDefault<Color>(
                                                        functions.closedOpened(
                                                            getCurrentTimestamp,
                                                            columnCompaniesRecord
                                                                .openTimeOrder!,
                                                            columnCompaniesRecord
                                                                .closedTimeOrder!) ==
                                                            true
                                                            ? FlutterFlowTheme
                                                            .of(context)
                                                            .primaryColor
                                                            : FlutterFlowTheme
                                                            .of(context)
                                                            .red1,
                                                        Colors.white,
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 4),
                                              child: RatingBarIndicator(
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primaryColor,
                                                    ),
                                                direction: Axis.horizontal,
                                                rating: valueOrDefault<double>(
                                                  functions.averageRating(
                                                      columnCompaniesRecord
                                                          .rating!
                                                          .toList()),
                                                  0.0,
                                                ),
                                                unratedColor: Color(0xFF9E9E9E),
                                                itemCount: 5,
                                                itemSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      FFIcons.kicArrowsButtonLeft,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 24,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Длительность:',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1Family,
                                                  color: FlutterFlowTheme
                                                      .of(context)
                                                      .gray2,
                                                  useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                      .containsKey(
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText1Family),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    '${columnBookingsRecord.duration?.toString()} мин',
                                                    '0 мин',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText1Family,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                        .containsKey(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1Family),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Стоимость:',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily:
                                                  FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1Family,
                                                  color: FlutterFlowTheme
                                                      .of(context)
                                                      .gray2,
                                                  useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                      .containsKey(
                                                      FlutterFlowTheme.of(
                                                          context)
                                                          .bodyText1Family),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 0, 0, 0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    '${columnBookingsRecord.totalPrice?.toString()} ₸',
                                                    '0 ₸',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                      context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    FlutterFlowTheme.of(
                                                        context)
                                                        .bodyText1Family,
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                        .containsKey(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .bodyText1Family),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Text(
                          'Оставьте отзыв об автомойке, это\nпоможет другим при выборе.',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 20, 0, 16),
                            child: RatingBar.builder(
                              onRatingUpdate: (newValue) => setState(
                                      () => ratingBarValue2 = newValue),
                              itemBuilder: (context, index) => Icon(
                                FFIcons.kicSmallStar14x14,
                                color:
                                FlutterFlowTheme.of(context).primaryColor,
                              ),
                              direction: Axis.horizontal,
                              initialRating: ratingBarValue2 ??= 0,
                              unratedColor:
                              FlutterFlowTheme.of(context).starblue,
                              itemCount: 5,
                              itemSize: 30,
                              glowColor:
                              FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: FlutterFlowTheme.of(context).gray3,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 14, 0, 0),
                          child: Text(
                            'Напишите нам',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodyText1Family,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey(FlutterFlowTheme.of(context)
                                  .bodyText1Family),
                            ),
                          ),
                        ),
                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: TextFormField(
                              controller: textController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'textController',
                                Duration(milliseconds: 200),
                                    () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Написать...',
                                hintStyle:
                                FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).gray2,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,

                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (ratingBarValue2! >= 1.0) {
                                if (formKey.currentState == null ||
                                    !formKey.currentState!.validate()) {
                                  return;
                                }

                                final commentsCreateData =
                                createCommentsRecordData(
                                  comment: textController!.text,
                                  createdBy: currentUserReference,
                                  createdAt: getCurrentTimestamp,
                                  company: columnCompaniesRecord.reference,
                                  rating: ratingBarValue2,
                                  bookedComment: true,
                                  bookingDoc: widget.booking,
                                  obrobotanFilter: 'Не обработан',
                                );
                                await CommentsRecord.createDoc(
                                    columnCompaniesRecord.reference)
                                    .set(commentsCreateData);

                                final userUpdateData = createUserRecordData(
                                  lastBookingBoolean: false,
                                );
                                await currentUserReference!
                                    .update(userUpdateData);

                                final companiesUpdateData = {
                                  'rating': FieldValue.arrayUnion(
                                      [ratingBarValue2]),
                                };
                                await columnCompaniesRecord.reference
                                    .update(companiesUpdateData);
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Поставьте рейтинг',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                );
                              }
                            },
                            text: 'Готово',
                            options: FFButtonOptions(
                              width: 130,
                              height: 48,
                              color: valueOrDefault<Color>(
                                (textController!.text != null &&
                                    textController!.text != '') &&
                                    (ratingBarValue2! >= 1.0)
                                    ? FlutterFlowTheme.of(context).primaryColor
                                    : FlutterFlowTheme.of(context).starblue,
                                FlutterFlowTheme.of(context).starblue,
                              ),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
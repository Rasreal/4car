import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/admin_app_bar_info_widget.dart';
import '/components/admin_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'admin_add_company1_widget.dart' show AdminAddCompany1Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddCompany1Model extends FlutterFlowModel<AdminAddCompany1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for company_name widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for city widget.
  final cityKey = GlobalKey();
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? citySelectedOption;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for gis widget.
  FocusNode? gisFocusNode;
  TextEditingController? gisController;
  String? Function(BuildContext, String?)? gisControllerValidator;
  // State field(s) for yandex widget.
  FocusNode? yandexFocusNode;
  TextEditingController? yandexController;
  String? Function(BuildContext, String?)? yandexControllerValidator;
  // State field(s) for google widget.
  FocusNode? googleFocusNode;
  TextEditingController? googleController;
  String? Function(BuildContext, String?)? googleControllerValidator;
  // State field(s) for count_box widget.
  FocusNode? countBoxFocusNode;
  TextEditingController? countBoxController;
  String? Function(BuildContext, String?)? countBoxControllerValidator;
  // State field(s) for open widget.
  String? openValue;
  FormFieldController<String>? openValueController;
  // State field(s) for close widget.
  String? closeValue;
  FormFieldController<String>? closeValueController;
  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    unfocusNode.dispose();
    adminAppBarModel.dispose();
    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    cityFocusNode?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();

    gisFocusNode?.dispose();
    gisController?.dispose();

    yandexFocusNode?.dispose();
    yandexController?.dispose();

    googleFocusNode?.dispose();
    googleController?.dispose();

    countBoxFocusNode?.dispose();
    countBoxController?.dispose();

    adminAppBarInfoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

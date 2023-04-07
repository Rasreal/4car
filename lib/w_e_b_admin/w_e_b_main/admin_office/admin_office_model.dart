import '/auth/auth_util.dart';
import '/auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/admin_add_sales/admin_add_sales_widget.dart';
import '/components/admin_app_bar/admin_app_bar_widget.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/components/admin_edit_stuff_status_widget.dart';
import '/components/admin_reset_password/admin_reset_password_widget.dart';
import '/components/admin_sales_active_empty/admin_sales_active_empty_widget.dart';
import '/components/admin_sales_archive_empty/admin_sales_archive_empty_widget.dart';
import '/components/admin_sales_details/admin_sales_details_widget.dart';
import '/components/admin_sales_moderation_empty/admin_sales_moderation_empty_widget.dart';
import '/components/success/success_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdminOfficeModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for editFIO widget.
  TextEditingController? editFIOController;
  String? Function(BuildContext, String?)? editFIOControllerValidator;
  String? _editFIOControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'ФИО не заполнено';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for editPhone widget.
  TextEditingController? editPhoneController;
  final editPhoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? editPhoneControllerValidator;
  String? _editPhoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Номер телефона не заполнено';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController10;
  final textFieldMask8 = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? textController10Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  // State field(s) for TextField widget.
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  Completer<List<CompanyServicesRecord>>? firestoreRequestCompleter;
  // Stores action output result for [Backend Call - Create Document] action in docNotExists widget.
  CompaniesRecord? addCompany;
  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
    editFIOControllerValidator = _editFIOControllerValidator;
    editPhoneControllerValidator = _editPhoneControllerValidator;
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    adminAppBarModel.dispose();
    emailController?.dispose();
    editFIOController?.dispose();
    editPhoneController?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    textController7?.dispose();
    textController8?.dispose();
    textController9?.dispose();
    textController10?.dispose();
    textController11?.dispose();
    textController12?.dispose();
    adminAppBarInfoModel.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

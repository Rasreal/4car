import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/admin_app_bar_info_widget.dart';
import '/components/admin_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'admin_add_company4_widget.dart' show AdminAddCompany4Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdminAddCompany4Model extends FlutterFlowModel<AdminAddCompany4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for TOO widget.
  FocusNode? tooFocusNode;
  TextEditingController? tooController;
  String? Function(BuildContext, String?)? tooControllerValidator;
  // State field(s) for BIN widget.
  FocusNode? binFocusNode;
  TextEditingController? binController;
  final binMask = MaskTextInputFormatter(mask: '############');
  String? Function(BuildContext, String?)? binControllerValidator;
  // State field(s) for IBAN widget.
  FocusNode? ibanFocusNode;
  TextEditingController? ibanController;
  String? Function(BuildContext, String?)? ibanControllerValidator;
  // State field(s) for FIO_admin widget.
  FocusNode? fIOAdminFocusNode;
  TextEditingController? fIOAdminController;
  String? Function(BuildContext, String?)? fIOAdminControllerValidator;
  // State field(s) for num_dogovor widget.
  FocusNode? numDogovorFocusNode;
  TextEditingController? numDogovorController;
  final numDogovorMask = MaskTextInputFormatter(mask: '№########');
  String? Function(BuildContext, String?)? numDogovorControllerValidator;
  // State field(s) for phone_num widget.
  FocusNode? phoneNumFocusNode;
  TextEditingController? phoneNumController;
  final phoneNumMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNumControllerValidator;
  DateTime? datePicked;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
    tooFocusNode?.dispose();
    tooController?.dispose();

    binFocusNode?.dispose();
    binController?.dispose();

    ibanFocusNode?.dispose();
    ibanController?.dispose();

    fIOAdminFocusNode?.dispose();
    fIOAdminController?.dispose();

    numDogovorFocusNode?.dispose();
    numDogovorController?.dispose();

    phoneNumFocusNode?.dispose();
    phoneNumController?.dispose();

    adminAppBarInfoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

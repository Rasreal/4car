import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/admin_app_bar/admin_app_bar_widget.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdminAddCompany4Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for TOO widget.
  TextEditingController? tooController;
  String? Function(BuildContext, String?)? tooControllerValidator;
  // State field(s) for BIN widget.
  TextEditingController? binController;
  final binMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? binControllerValidator;
  // State field(s) for IBAN widget.
  TextEditingController? ibanController;
  final ibanMask = MaskTextInputFormatter(mask: 'AA## AAAA #### #### ####');
  String? Function(BuildContext, String?)? ibanControllerValidator;
  // State field(s) for FIO_admin widget.
  TextEditingController? fIOAdminController;
  String? Function(BuildContext, String?)? fIOAdminControllerValidator;
  // State field(s) for num_dogovor widget.
  TextEditingController? numDogovorController;
  final numDogovorMask = MaskTextInputFormatter(mask: '№########');
  String? Function(BuildContext, String?)? numDogovorControllerValidator;
  // State field(s) for phone_num widget.
  TextEditingController? phoneNumController;
  final phoneNumMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNumControllerValidator;
  DateTime? datePicked;
  bool isMediaUploading = false;
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
    adminAppBarModel.dispose();
    tooController?.dispose();
    binController?.dispose();
    ibanController?.dispose();
    fIOAdminController?.dispose();
    numDogovorController?.dispose();
    phoneNumController?.dispose();
    adminAppBarInfoModel.dispose();
  }

  /// Additional helper methods are added here.

}

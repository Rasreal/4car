import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_app_bar/admin_app_bar_widget.dart';
import '/components/admin_app_bar_info/admin_app_bar_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdminAddStaff3Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for FIO widget.
  TextEditingController? fioController;
  String? Function(BuildContext, String?)? fioControllerValidator;
  String? _fioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Запоните поле!';
    }

    return null;
  }

  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Запоните поле!';
    }

    return null;
  }

  // State field(s) for phone widget.
  TextEditingController? phoneController;
  final phoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneControllerValidator;
  String? _phoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
    fioControllerValidator = _fioControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    phoneControllerValidator = _phoneControllerValidator;
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    adminAppBarModel.dispose();
    fioController?.dispose();
    emailController?.dispose();
    phoneController?.dispose();
    adminAppBarInfoModel.dispose();
  }

  /// Additional helper methods are added here.

}

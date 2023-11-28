import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'admin_sign_up_email_widget.dart' show AdminSignUpEmailWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdminSignUpEmailModel extends FlutterFlowModel<AdminSignUpEmailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for FIO widget.
  FocusNode? fioFocusNode;
  TextEditingController? fioController;
  String? Function(BuildContext, String?)? fioControllerValidator;
  String? _fioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните поле';
    }

    return null;
  }

  // State field(s) for Phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  final phoneMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneControllerValidator;
  String? _phoneControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните поле';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните поле';
    }

    return null;
  }

  // State field(s) for TextField111 widget.
  FocusNode? textField111FocusNode;
  TextEditingController? textField111Controller;
  late bool textField111Visibility;
  String? Function(BuildContext, String?)? textField111ControllerValidator;
  String? _textField111ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните поле';
    }

    return null;
  }

  // State field(s) for TextField222 widget.
  FocusNode? textField222FocusNode;
  TextEditingController? textField222Controller;
  late bool textField222Visibility;
  String? Function(BuildContext, String?)? textField222ControllerValidator;
  String? _textField222ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните поле';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fioControllerValidator = _fioControllerValidator;
    phoneControllerValidator = _phoneControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    textField111Visibility = false;
    textField111ControllerValidator = _textField111ControllerValidator;
    textField222Visibility = false;
    textField222ControllerValidator = _textField222ControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    fioFocusNode?.dispose();
    fioController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    textField111FocusNode?.dispose();
    textField111Controller?.dispose();

    textField222FocusNode?.dispose();
    textField222Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

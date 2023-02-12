import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AdminSignUpEmailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FIO widget.
  TextEditingController? fioController;
  String? Function(BuildContext, String?)? fioControllerValidator;
  String? _fioControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните поле';
    }

    return null;
  }

  // State field(s) for Phone widget.
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
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните поле';
    }

    return null;
  }

  // State field(s) for TextField111 widget.
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
    fioController?.dispose();
    phoneController?.dispose();
    emailController?.dispose();
    textField111Controller?.dispose();
    textField222Controller?.dispose();
  }

  /// Additional helper methods are added here.

}

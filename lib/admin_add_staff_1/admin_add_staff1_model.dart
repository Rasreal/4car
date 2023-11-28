import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_app_bar_info_widget.dart';
import '/components/admin_app_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'admin_add_staff1_widget.dart' show AdminAddStaff1Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdminAddStaff1Model extends FlutterFlowModel<AdminAddStaff1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for adminAppBar component.
  late AdminAppBarModel adminAppBarModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Заполните поле';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Model for adminAppBarInfo component.
  late AdminAppBarInfoModel adminAppBarInfoModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adminAppBarModel = createModel(context, () => AdminAppBarModel());
    emailControllerValidator = _emailControllerValidator;
    adminAppBarInfoModel = createModel(context, () => AdminAppBarInfoModel());
  }

  void dispose() {
    unfocusNode.dispose();
    adminAppBarModel.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    adminAppBarInfoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

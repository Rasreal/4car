// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future<String?> getUid(
  String email,
  String password,
) async {
  final user = await createAccountWithEmail(
    email,
    password,
  );
  if (user == null) {
    return null;
  }

  String uid1 = user.uid;

  return uid1;
  // Add your function code here!
}

Future<User?> createAccountWithEmail(String email, String password) async {
  final createAccountFunc = () => FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email.trim(), password: password);
  return signInOrCreateAccount(createAccountFunc, 'EMAIL');
}

Future<User?> signInOrCreateAccount(
  Future<UserCredential?> Function() signInFunc,
  String authProvider,
) async {
  try {
    final userCredential = await signInFunc();
    if (userCredential?.user != null) {
      //await maybeCreateUser(userCredential!.user!);
    }
    return userCredential?.user;
  } on FirebaseAuthException catch (e) {
    return null;
  }
}

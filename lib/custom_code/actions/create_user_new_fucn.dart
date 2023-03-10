// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

import 'package:firebase_auth/firebase_auth.dart';

Future<DocumentReference?> createUserNewFucn(
  String email,
  String password,
) async {
  // Add your function code here!

  UserCredential result = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
  User user = result.user!;

  DocumentReference? returnCode;
  try {
    returnCode = FirebaseFirestore.instance.collection('user').doc(user.uid);

    return returnCode;
  } catch (e) {
    print("Error: ");
    return null;
  }

  //return user.uid;
}

Future<DocumentReference?> getDocRef(String? UserId) async {
  // Add your function code here
}

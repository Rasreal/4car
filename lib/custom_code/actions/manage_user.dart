// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<DocumentReference?> manageUser(
  // Parameters
  String emailAddress, //Email from Widget State
  String password, //Password from Widget State
  String randomDocGen, //Random String (min 10 max 25 - upper/lowe/digits)
  DocumentReference company,
) async {
  //Create the return msg
  String returnmsg = 'Success';
  //created time variable
  DateTime createdTime = DateTime.now();
  //Create the secondary app to create the users
  FirebaseApp app = await Firebase.initializeApp(
      name: randomDocGen, options: Firebase.app().options);

  try {
    //Create the user with the email & password provided
    UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(
            email: emailAddress, password: password);

    // Set the UID generated to a variable so we can use it later
    String? uid = userCredential.user?.uid;
    //var userRef = userCredential.user?.reference;
    // Check if UID is not empy
    if (uid != null) {
      //Get collection reference to create our new user document
      final CollectionReference<Map<String, dynamic>> usersRef =
          FirebaseFirestore.instance.collection('users');

      //Create new user document with the parameters we have (you can add more parameters and just add here the extra)
      usersRef.doc(uid).set({
        'uid': uid,
        'email': emailAddress,
        'created_time': createdTime,
        'createdByAdminCompanyRef': company,
      });

      var b = FirebaseFirestore.instance.collection('users').doc(uid);
      DocumentReference ab = b;
      return b;
    } else {
      //return "Error while creating the UID";
    }
  } on FirebaseAuthException catch (e) {
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

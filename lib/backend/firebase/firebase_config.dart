import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAOoGU_UPECFi98sxuR83rQYtzzYImXv5s",
            authDomain: "carmain-7a68b.firebaseapp.com",
            projectId: "carmain-7a68b",
            storageBucket: "carmain-7a68b.appspot.com",
            messagingSenderId: "91139422644",
            appId: "1:91139422644:web:81d8a83682c049b0f4dae1",
            measurementId: "G-HYZNDNM84Y"));
  } else {
    await Firebase.initializeApp();
  }
}

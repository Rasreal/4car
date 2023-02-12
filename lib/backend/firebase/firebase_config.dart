import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAec2zvbFkPz90kZbXAvNXzjY46ZIJv97Q",
            authDomain: "forcar-last.firebaseapp.com",
            projectId: "forcar-last",
            storageBucket: "forcar-last.appspot.com",
            messagingSenderId: "539047140274",
            appId: "1:539047140274:web:277c5f6dca726d65eee2ab",
            measurementId: "G-2ZSK3DBP6W"));
  } else {
    await Firebase.initializeApp();
  }
}

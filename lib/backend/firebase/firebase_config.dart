import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDiK_IhXbjp00IS3IlNzhcDjKBfWj_8-sk",
            authDomain: "diamentdelivery-s9l4hs.firebaseapp.com",
            projectId: "diamentdelivery-s9l4hs",
            storageBucket: "diamentdelivery-s9l4hs.appspot.com",
            messagingSenderId: "512570552946",
            appId: "1:512570552946:web:4845fe506ec009911448eb",
            measurementId: "G-ZZPQCK0EPQ"));
  } else {
    await Firebase.initializeApp();
  }
}

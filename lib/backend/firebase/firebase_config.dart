import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDrQS7zJ1SM1hhlilrF_LTvUFYgO1iW33Y",
            authDomain: "casa-qr.firebaseapp.com",
            projectId: "casa-qr",
            storageBucket: "casa-qr.appspot.com",
            messagingSenderId: "500945510511",
            appId: "1:500945510511:web:224d062f1c635148c66d9a",
            measurementId: "G-B2B9W7JT3E"));
  } else {
    await Firebase.initializeApp();
  }
}

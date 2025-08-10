import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

void checkLoginUser() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      if (kDebugMode) {
        print('User is signed in!');
      }
    }
  });
}

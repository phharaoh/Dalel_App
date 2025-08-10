import 'package:flutter/material.dart';
import 'package:dalel/firebase_options.dart';
import 'package:dalel/core/app/dalel_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dalel/core/cache/cache_helper.dart';
import 'package:dalel/core/functions/check_user.dart';
import 'package:dalel/core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();

  checkLoginUser();
  await getIt<CacheHelper>().init();
  runApp(const Dalel());
}

import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/di/dependency_injection.dart';
import 'package:flutter_complete_application/core/helpers/extensions.dart';
import 'package:flutter_complete_application/core/networking/api_constants.dart';
import 'package:flutter_complete_application/core/routing/app_router.dart';
import 'package:flutter_complete_application/core/services/pref_keys.dart';
import 'package:flutter_complete_application/core/services/shared_prefs.dart';
import 'package:flutter_complete_application/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  // to fix hidden text bug in screenutil package

  WidgetsFlutterBinding.ensureInitialized();
   Future.wait([
    ScreenUtil.ensureScreenSize(),
    SharedPref.preferences.instantiatePreferences(),
    checkIfUserIsLoggedIn(),
  ]);
  // just an example to test flavors
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}

Future<void> checkIfUserIsLoggedIn() async {
  String? token = await SharedPref.preferences.getSecureString(
    SharedPrefKeys.userToken,
  );
  if (!token.isNullOrEmpty) {
    isLogin = true;
  } else {
    isLogin = false;
  }
}

// dart run build_runner build --delete-conflicting-outputs

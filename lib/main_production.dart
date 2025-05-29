import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_application/core/di/dependency_injection.dart';
import 'package:flutter_complete_application/core/routing/app_router.dart';
import 'package:flutter_complete_application/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  // to fix hidden text bug in screenutil package
  await ScreenUtil.ensureScreenSize();
  // just an example to test flavors
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.teal,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.yellow,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}


// dart run build_runner build --delete-conflicting-outputs
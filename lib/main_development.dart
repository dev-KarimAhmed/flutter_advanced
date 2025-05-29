import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/di/dependency_injection.dart';
import 'package:flutter_complete_application/core/routing/app_router.dart';
import 'package:flutter_complete_application/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}


// dart run build_runner build --delete-conflicting-outputs
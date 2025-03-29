import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart' show ColorsManger;
import 'package:flutter_complete_application/core/theme/font_weight.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: Colors.black,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManger.mainBlue,
  );
  static TextStyle font13GreyRegular = TextStyle(
    fontSize: 13.sp,
    fontWeight:  FontWeightHelper.regular,
    color: ColorsManger.grey,
  );
  static TextStyle font16Whitew500 = TextStyle(
    fontSize: 16.sp,
    fontWeight:  FontWeightHelper.medium,
    color: Colors.white,
  );
  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight:  FontWeightHelper.medium,
    color: ColorsManger.darkBlue,
  );
}

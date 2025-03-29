import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart'
    show ColorsManger;
import 'package:flutter_complete_application/core/theme/font_style.dart'
    show TextStyles;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: ColorsManger.mainBlue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        isDense: true,
        fillColor: ColorsManger.babyWhite,
        filled: true,
        hintStyle: TextStyles.font13GreyRegular,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManger.mainBlue, width: 1.3),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManger.lighterGrey, width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManger.grey),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

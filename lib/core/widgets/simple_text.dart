import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimplTextButton extends StatelessWidget {
  const SimplTextButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.font24Black700Weight.copyWith(
          color: ColorsManger.mainBlue,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class LogoAndName extends StatelessWidget {
  const LogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/logo.svg'),
        SizedBox(width: 10.w),
        Text('Docdoc', style: TextStyles.font24Black700Weight),
      ],
    );
  }
}

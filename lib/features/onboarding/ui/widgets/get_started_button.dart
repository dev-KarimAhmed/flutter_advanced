import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart'
    show ColorsManger;
import 'package:flutter_complete_application/core/theme/font_style.dart'
    show TextStyles;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: ColorsManger.mainBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        onPressed: () {},
        child: Text('Get Started', style: TextStyles.font16Whitew500),
      ),
    );
  }
}

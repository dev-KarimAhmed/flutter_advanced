import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Doctors Speciality',
          style: TextStyles.font14DarkBlueMedium.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(
          'See All',
          style: TextStyles.font13GreyRegular.copyWith(
            fontSize: 12.sp,
            color: ColorsManger.mainBlue,
          ),
        ),
      ],
    );
  }
}
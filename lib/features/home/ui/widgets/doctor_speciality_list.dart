import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class DoctorsSpecialityListView extends StatelessWidget {
  const DoctorsSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManger.mainBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                verticalSpace(8),
                Text(
                  'Karim',
                  style: TextStyles.font13GreyRegular.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
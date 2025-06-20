import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Omar!',
              style: TextStyles.font32BlueBold.copyWith(
                fontSize: 18.sp,
              ),
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font13GreyRegular.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        const Spacer(),
        // CircleAvatar(
        //   radius: 24.0,
        //   backgroundColor: ColorsManger.lighterGrey,
        //   child: SvgPicture.asset(
        //     'assets/svgs/notifications.svg',
        //   ),
        // )
      ],
    );
  }
}
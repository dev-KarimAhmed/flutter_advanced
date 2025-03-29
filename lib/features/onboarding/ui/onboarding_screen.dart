import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_complete_application/features/onboarding/ui/widgets/logo_and_name.dart'
    show LogoAndName;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctor_image_and_text.dart' show DoctorImageAndText;
import 'widgets/get_started_button.dart' show GetStartedButton;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LogoAndName(),
                verticalSpace(8),
                DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        style: TextStyles.font13GreyRegular,
                      ),
                      verticalSpace(8),
                      GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

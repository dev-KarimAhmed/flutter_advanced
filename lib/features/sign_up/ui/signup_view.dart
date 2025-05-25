import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_complete_application/core/theme/font_weight.dart';
import 'package:flutter_complete_application/core/widgets/simple_text.dart';
import 'package:flutter_complete_application/features/sign_up/ui/widgets/register_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create Account", style: TextStyles.font32BlueBold),
                verticalSpace(8),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: TextStyles.font13GreyRegular,
                ),
                verticalSpace(36),
                RegisterForm(),
               
                verticalSpace(32),
                SizedBox(
                  width: double.infinity,
                  height: 52.h,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      backgroundColor: ColorsManger.mainBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    onPressed: () {
                      
                    },
                    child: Text("Sign Up", style: TextStyles.font16Whitew500),
                  ),
                ),
                verticalSpace(36),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "By logging in, you agree to our ",
                        style: TextStyles.font13GreyRegular.copyWith(
                          fontSize: 14.sp,
                          height: 1.4,
                        ),
                      ),
                      TextSpan(
                        text: "Terms & Conditions ",
                        style: TextStyles.font24Black700Weight.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeightHelper.regular,
                          height: 1.4,
                        ),
                      ),
                      TextSpan(
                        text: "and ",
                        style: TextStyles.font13GreyRegular.copyWith(
                          fontSize: 14.sp,
                          height: 1.4,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyles.font24Black700Weight.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeightHelper.regular,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyles.font13GreyRegular.copyWith(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    SimplTextButton(text: "Log In", onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


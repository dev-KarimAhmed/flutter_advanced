import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/core/helpers/extensions.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/routing/routes.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart'
    show TextStyles;
import 'package:flutter_complete_application/core/theme/font_weight.dart';
import 'package:flutter_complete_application/core/widgets/simple_text.dart';
import 'package:flutter_complete_application/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_application/features/login/ui/widgets/email_and_password.dart';
import 'package:flutter_complete_application/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Text("Welcome Back", style: TextStyles.font32BlueBold),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font13GreyRegular,
                ),
                verticalSpace(36),
                EmailAndPassword(),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: SimplTextButton(
                    text: "Forgot Password?",
                    onPressed: () {},
                  ),
                ),
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
                      context.read<LoginCubit>().login();
                    },
                    child: Text("Login", style: TextStyles.font16Whitew500),
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
                      "Don't have an account?",
                      style: TextStyles.font13GreyRegular.copyWith(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    SimplTextButton(text: "Sign Up", onPressed: ()=> context.pushNamed(Routes.signupScreen)),
                  ],
                ),
                LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

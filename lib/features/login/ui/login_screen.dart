import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart'
    show TextStyles;
import 'package:flutter_complete_application/core/theme/font_weight.dart';
import 'package:flutter_complete_application/core/widgets/app_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  AppTextField(
                    hintText: "Email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  verticalSpace(16),
                  AppTextField(
                    hintText: "Password",
                    controller: _emailController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  verticalSpace(16),
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
                      onPressed: () {},
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
                        "Already have an account yet?",
                        style: TextStyles.font13GreyRegular.copyWith(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                      SimplTextButton(text: "Sign Up", onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SimplTextButton extends StatelessWidget {
  const SimplTextButton({super.key, this.onPressed, required this.text});
  final VoidCallback? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        overlayColor: ColorsManger.mainBlue,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyles.font32BlueBold.copyWith(
          fontWeight: FontWeightHelper.regular,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}

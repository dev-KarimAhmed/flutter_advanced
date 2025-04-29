import 'package:flutter/material.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/theme/colors_manger.dart';
import 'package:flutter_complete_application/core/theme/font_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasSpecialCharacters;
  final bool hasUppercase;
  final bool hasNumber;
  final bool isValidLength;
  final bool hasLowercase;
  const PasswordValidations({
    super.key,
    required this.hasSpecialCharacters,
    required this.hasUppercase,
    required this.hasNumber,
    required this.isValidLength,
    required this.hasLowercase,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationText(
          'Password should be at least 8 characters long',
          isValidLength,
        ),
        verticalSpace(2),
        buildValidationText(
          'Password should have at least one uppercase letter',
          hasUppercase,
        ),
        verticalSpace(2),
        buildValidationText(
          'Password should have at least one lowercase letter',
          hasLowercase,
        ),
        verticalSpace(2),
        buildValidationText(
          'Password should have at least one number',
          hasNumber,
        ),
        verticalSpace(2),
        buildValidationText(
          'Password should have at least one special character',
          hasSpecialCharacters,
        ),
      ],
    );
  }

  Widget buildValidationText(String text, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check : Icons.close,
          color: isValid ? Colors.green : ColorsManger.grey,
          size: 11.sp,
        ),
        horizontalSpace(4),
        Text(
          text,
          style: TextStyles.font13GreyRegular.copyWith(
            fontSize: 11.sp,
            color: isValid ? Colors.green : ColorsManger.grey,
            decoration: isValid ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/core/helpers/regex.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/widgets/app_text_field.dart';
import 'package:flutter_complete_application/features/login/ui/widgets/password_validations.dart';
import 'package:flutter_complete_application/features/sign_up/logic/cubit/signup_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmation;
  late TextEditingController _phoneController;

  bool hasSpecialCharacters = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool isValidLength = false;
  bool hasLowercase = false;

  @override
  void initState() {
    _emailController = context.read<SignupCubit>().emailController;
    _passwordController = context.read<SignupCubit>().passwordController;
    _passwordConfirmation = context.read<SignupCubit>().passwordConfirmController;
    _phoneController = context.read<SignupCubit>().phoneController;
    setupPasswordControllersListeners();
    super.initState();
  }

  void setupPasswordControllersListeners() {
    _passwordController.addListener(() {
      setState(() {
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          _passwordController.text,
        );
        hasUppercase = AppRegex.hasUpperCase(_passwordController.text);
        hasNumber = AppRegex.hasNumber(_passwordController.text);
        isValidLength = AppRegex.hasMinLength(_passwordController.text);
        hasLowercase = AppRegex.hasLowerCase(_passwordController.text);
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextField(
            hintText: "Email",
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppTextField(
            hintText: "Phone number",
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneValid(value)) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppTextField(
            hintText: "Password",
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppTextField(
            hintText: "Password Confirmation",
            controller: _passwordConfirmation,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (_passwordController.text != _passwordConfirmation.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          verticalSpace(16),
          PasswordValidations(
            hasSpecialCharacters: hasSpecialCharacters,
            hasUppercase: hasUppercase,
            hasNumber: hasNumber,
            isValidLength: isValidLength,
            hasLowercase: hasLowercase,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/core/helpers/regex.dart';
import 'package:flutter_complete_application/core/helpers/spacing.dart';
import 'package:flutter_complete_application/core/widgets/app_text_field.dart';
import 'package:flutter_complete_application/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_application/features/login/ui/widgets/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool hasSpecialCharacters = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool isValidLength = false;
  bool hasLowercase = false;

  @override
  void initState() {
    _emailController = context.read<LoginCubit>().emailController;
    _passwordController = context.read<LoginCubit>().passwordController;
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
      key: context.read<LoginCubit>().formKey,
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
            hintText: "Password",
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/features/sign_up/data/models/signup_request_body.dart';
import 'package:flutter_complete_application/features/sign_up/data/repos/signup_repo.dart';
import 'package:flutter_complete_application/features/sign_up/logic/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit(this._signupRepo) : super(SignupCubitState.initial());
  final SignupRepo _signupRepo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void signup() async {
    if (formKey.currentState!.validate()) {
      emit(SignupCubitState.loading());
      final response = await _signupRepo.signup(SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: passwordConfirmController.text,
        phone: phoneController.text,
        gender: "1",
      ));
      response.fold((failure) => emit(SignupCubitState.error( failure.errMessage)), (response) => emit(SignupCubitState.success(response)));
    }
  }
}

import 'package:flutter_complete_application/features/sign_up/data/models/signup_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupCubitState with _$SignupCubitState {
  const factory SignupCubitState.initial() = _Initial;
  const factory SignupCubitState.loading() = _Loading;
  const factory SignupCubitState.success(SignupResponse signupResponse) = _Success;
  const factory SignupCubitState.error(String message) = _Error;
}

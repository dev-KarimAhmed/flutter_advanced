import 'package:flutter_complete_application/features/sign_up/data/models/signup_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupCubitState<T> with _$SignupCubitState<T> {
  const factory SignupCubitState.initial() = _Initial;
  const factory SignupCubitState.loading() = Loading;
  const factory SignupCubitState.success(SignupResponse signupResponse) = Success;
  const factory SignupCubitState.error(String message) = Error;
}

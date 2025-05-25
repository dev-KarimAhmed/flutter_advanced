import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
class SignupCubitState with _$SignupCubitState {
  const factory SignupCubitState.initial() = _Initial;
}

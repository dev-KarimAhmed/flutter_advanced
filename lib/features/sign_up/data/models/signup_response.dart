
import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String? message;
  final bool? status;
  final int? code;
@JsonKey(name: 'data')
  final UserData? userData;

  SignupResponse({required this.message, required this.status, required this.code, required this.userData});

  factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String? token;
  final String? username;

  UserData({required this.token, required this.username});

  factory UserData.fromJson(Map<String , dynamic> json) => _$UserDataFromJson(json);
}

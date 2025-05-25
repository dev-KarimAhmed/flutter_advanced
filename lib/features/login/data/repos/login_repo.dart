import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_complete_application/core/networking/api_error_handler.dart';
// import 'package:flutter_complete_application/core/networking/api_result.dart';
import 'package:flutter_complete_application/core/networking/api_service.dart';
import 'package:flutter_complete_application/core/networking/dio_error.dart';
import 'package:flutter_complete_application/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_application/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<Either<DioFailure , LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
    final response=  await _apiService.login(loginRequestBody);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        
      return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}

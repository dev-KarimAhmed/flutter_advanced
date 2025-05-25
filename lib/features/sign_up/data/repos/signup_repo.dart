import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_complete_application/core/networking/api_service.dart';
import 'package:flutter_complete_application/core/networking/dio_error.dart';
import 'package:flutter_complete_application/features/sign_up/data/models/signup_response.dart';

import '../models/signup_request_body.dart';

class SignupRepo {
 final  ApiService _apiService;

  SignupRepo(this._apiService);
  Future<Either<DioFailure , SignupResponse>> signup(SignupRequestBody signupRequestBody) async {
    try {
     SignupResponse response = await _apiService.signup(signupRequestBody);
     return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}

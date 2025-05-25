import 'package:flutter_complete_application/core/networking/api_error_handler.dart';
import 'package:flutter_complete_application/core/networking/api_result.dart';
import 'package:flutter_complete_application/core/networking/api_service.dart';
import 'package:flutter_complete_application/features/sign_up/data/models/signup_response.dart';

import '../models/signup_request_body.dart';

class SignupRepo {
 final  ApiService _apiService;

  SignupRepo(this._apiService);
  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody) async {
    try {
     SignupResponse response = await _apiService.signup(signupRequestBody);
     return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

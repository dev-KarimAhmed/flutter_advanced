import 'package:dio/dio.dart';
import 'package:flutter_complete_application/core/networking/api_constants.dart';
import 'package:flutter_complete_application/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_application/features/login/data/models/login_response.dart';
import 'package:flutter_complete_application/features/sign_up/data/models/signup_request_body.dart';
import 'package:flutter_complete_application/features/sign_up/data/models/signup_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart'; // the generated file by retrofit(_ApiService)

// Retrofit api request
// all the api request will be handled here

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Login
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  // Signup
  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);
}

import 'package:dio/dio.dart';
import 'package:flutter_complete_application/core/networking/api_constants.dart';
import 'package:flutter_complete_application/features/home/data/api/home_endpoints.dart';
import 'package:flutter_complete_application/features/home/data/models/specialization_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)

abstract class HomeApiService {
  factory HomeApiService(Dio dio) => _HomeApiService(dio);

  @GET(HomeEndpoints.allSpecialities)
  Future<SpecializationResponseModel> getAllSpecialities();
}
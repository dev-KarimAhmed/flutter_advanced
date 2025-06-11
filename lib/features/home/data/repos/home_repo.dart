import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_complete_application/core/networking/dio_error.dart';
import 'package:flutter_complete_application/features/home/data/api/home_service.dart';
import 'package:flutter_complete_application/features/home/data/models/specialization_response_model.dart';

class GetAllSpecializationRepo {
  final HomeApiService _homeApiService;

  GetAllSpecializationRepo(this._homeApiService);
  Future<Either<DioFailure, SpecializationResponseModel>>
  getAllSpecialization()async {
    try {
   final  SpecializationResponseModel result = await _homeApiService.getAllSpecialities();
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      } else {
        return left(ServerError(e.toString()));
      }
    }
  }
}

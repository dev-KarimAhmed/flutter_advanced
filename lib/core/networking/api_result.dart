
import 'package:flutter_complete_application/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';


// model alternater between success and failure (alternative of Either class)
// _$ApiResult should conatin when method and whenOrNull (it static file but you generate it by freezed)
@Freezed()
abstract class ApiResult<T> with _$ApiResult<T> {
 const factory ApiResult.success(T data) = Success<T>;
 const factory ApiResult.failure(ErrorHandler error) = Failure<T>;
}
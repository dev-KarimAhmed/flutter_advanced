import 'package:json_annotation/json_annotation.dart';

part 'specialization_response_model.g.dart';

@JsonSerializable()
class SpecializationResponseModel {
  @JsonKey(name: "data")
  final List<SpecializationModel>? specializations;

  SpecializationResponseModel({this.specializations});

  factory SpecializationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationResponseModelFromJson(json);
}

@JsonSerializable()
class SpecializationModel {
  final String? name;
  final int? id;
  @JsonKey(name: "doctors")
  List<DoctorModel>? doctorsList;

  SpecializationModel({this.name, this.id, this.doctorsList});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);
}

@JsonSerializable()
class DoctorModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? degree;
  final String? gender;
  @JsonKey(name : "appoint_price")
  final int? price;


  DoctorModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.photo,
      this.degree,
      this.gender,
      this.price});

      factory DoctorModel.fromJson(Map<String,dynamic> json) => _$DoctorModelFromJson(json);

}

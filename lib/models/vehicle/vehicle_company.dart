import 'package:json_annotation/json_annotation.dart';

part 'vehicle_company.g.dart';

@JsonSerializable()
class VehicleCompany {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "logo")
  String logo;


  VehicleCompany(this.id, this.name, this.logo);

  factory VehicleCompany.fromJson(Map<String, dynamic> json) => _$VehicleCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleCompanyToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'vehicle_type.g.dart';

@JsonSerializable()
class VehicleType {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "typeName")
  String typeName;


  VehicleType(this.id, this.typeName);

  factory VehicleType.fromJson(Map<String, dynamic> json) => _$VehicleTypeFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleTypeToJson(this);
}

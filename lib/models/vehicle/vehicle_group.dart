import 'package:json_annotation/json_annotation.dart';

part 'vehicle_group.g.dart';

@JsonSerializable()
class VehicleGroup {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "capacity")
  int capacity;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "logo")
  String logo;

  @JsonKey(name: "image")
  String image;


  VehicleGroup(this.id, this.capacity, this.name, this.logo, this.image);

  factory VehicleGroup.fromJson(Map<String, dynamic> json) => _$VehicleGroupFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleGroupToJson(this);
}

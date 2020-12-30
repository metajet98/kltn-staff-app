import 'package:staff_maintenance_app/models/user/user.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle_group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "user")
  User user;

  @JsonKey(name: "userId")
  int userId;

  @JsonKey(name: "vehicleGroup")
  VehicleGroup vehicleGroup;

  @JsonKey(name: "vehicleGroupId")
  int vehicleGroupId;

  @JsonKey(name: "chassisNumber")
  String chassisNumber;

  @JsonKey(name: "engineNumber")
  String engineNumber;

  @JsonKey(name: "plateNumber")
  String plateNumber;

  @JsonKey(name: "color")
  String color;

  Vehicle(
      {this.id,
      this.user,
      this.userId,
      this.vehicleGroup,
      this.vehicleGroupId,
      this.chassisNumber,
      this.engineNumber,
      this.plateNumber,
      this.color,
      this.name});

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}

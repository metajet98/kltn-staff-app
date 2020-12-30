// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return Vehicle(
    id: json['id'] as int,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    userId: json['userId'] as int,
    vehicleGroup: json['vehicleGroup'] == null
        ? null
        : VehicleGroup.fromJson(json['vehicleGroup'] as Map<String, dynamic>),
    vehicleGroupId: json['vehicleGroupId'] as int,
    chassisNumber: json['chassisNumber'] as String,
    engineNumber: json['engineNumber'] as String,
    plateNumber: json['plateNumber'] as String,
    color: json['color'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user': instance.user,
      'userId': instance.userId,
      'vehicleGroup': instance.vehicleGroup,
      'vehicleGroupId': instance.vehicleGroupId,
      'chassisNumber': instance.chassisNumber,
      'engineNumber': instance.engineNumber,
      'plateNumber': instance.plateNumber,
      'color': instance.color,
    };

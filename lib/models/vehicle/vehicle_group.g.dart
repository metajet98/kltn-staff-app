// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleGroup _$VehicleGroupFromJson(Map<String, dynamic> json) {
  return VehicleGroup(
    json['id'] as int,
    json['capacity'] as int,
    json['name'] as String,
    json['logo'] as String,
    json['image'] as String,
  );
}

Map<String, dynamic> _$VehicleGroupToJson(VehicleGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'capacity': instance.capacity,
      'name': instance.name,
      'logo': instance.logo,
      'image': instance.image,
    };

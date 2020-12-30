// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleCompany _$VehicleCompanyFromJson(Map<String, dynamic> json) {
  return VehicleCompany(
    json['id'] as int,
    json['name'] as String,
    json['logo'] as String,
  );
}

Map<String, dynamic> _$VehicleCompanyToJson(VehicleCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };

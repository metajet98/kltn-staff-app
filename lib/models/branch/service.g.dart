// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    laborCost: json['laborCost'] as int,
    sparePartPrice: json['sparePartPrice'] as int,
    serviceId: json['serviceId'] as int,
    warrantyOdo: json['warrantyOdo'] as int,
    warrantyPeriod: json['warrantyPeriod'] as int,
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'laborCost': instance.laborCost,
      'sparePartPrice': instance.sparePartPrice,
      'serviceId': instance.serviceId,
      'warrantyPeriod': instance.warrantyPeriod,
      'warrantyOdo': instance.warrantyOdo,
    };

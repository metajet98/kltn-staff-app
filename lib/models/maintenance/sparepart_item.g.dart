// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparepart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparePartItem _$SparePartItemFromJson(Map<String, dynamic> json) {
  return SparePartItem(
    id: json['id'] as int,
    description: json['description'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SparePartItemToJson(SparePartItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'name': instance.name,
    };

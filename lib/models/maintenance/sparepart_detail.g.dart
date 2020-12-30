// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparepart_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparePartDetail _$SparePartDetailFromJson(Map<String, dynamic> json) {
  return SparePartDetail(
    id: json['id'] as int,
    maintenanceId: json['maintenanceId'] as int,
    statusId: json['statusId'] as int,
    sparePartItemId: json['sparePartItemId'] as int,
    sparePartItem: json['sparePartItem'] == null
        ? null
        : SparePartItem.fromJson(json['sparePartItem'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : Status.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SparePartDetailToJson(SparePartDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'maintenanceId': instance.maintenanceId,
      'statusId': instance.statusId,
      'sparePartItemId': instance.sparePartItemId,
      'sparePartItem': instance.sparePartItem,
      'status': instance.status,
    };

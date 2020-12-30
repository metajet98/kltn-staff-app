// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillDetail _$BillDetailFromJson(Map<String, dynamic> json) {
  return BillDetail(
    id: json['id'] as int,
    branchServicePriceId: json['branchServicePriceId'] as int,
    quantity: json['quantity'] as int,
    totalPrice: json['totalPrice'] as int,
    maintenanceId: json['maintenanceId'] as int,
    sparePartPrice: json['sparePartPrice'] as int,
    laborCost: json['laborCost'] as int,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$BillDetailToJson(BillDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branchServicePriceId': instance.branchServicePriceId,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'maintenanceId': instance.maintenanceId,
      'sparePartPrice': instance.sparePartPrice,
      'laborCost': instance.laborCost,
      'title': instance.title,
    };

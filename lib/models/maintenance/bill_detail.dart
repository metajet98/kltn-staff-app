import 'package:staff_maintenance_app/models/user/user.dart';
import 'package:staff_maintenance_app/models/vehicle/vehicle_group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bill_detail.g.dart';

@JsonSerializable()
class BillDetail {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "branchServicePriceId")
  int branchServicePriceId;

  @JsonKey(name: "quantity")
  int quantity;

  @JsonKey(name: "totalPrice")
  int totalPrice;

  @JsonKey(name: "maintenanceId")
  int maintenanceId;

  @JsonKey(name: "sparePartPrice")
  int sparePartPrice;

  @JsonKey(name: "laborCost")
  int laborCost;

  @JsonKey(name: "title")
  String title;

  BillDetail(
      {this.id,
      this.branchServicePriceId,
      this.quantity,
      this.totalPrice,
      this.maintenanceId,
      this.sparePartPrice,
      this.laborCost,
      this.title});

  factory BillDetail.fromJson(Map<String, dynamic> json) => _$BillDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BillDetailToJson(this);
}

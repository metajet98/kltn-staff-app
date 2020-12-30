import 'package:staff_maintenance_app/models/maintenance/sparepart_item.dart';
import 'package:staff_maintenance_app/models/maintenance/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sparepart_detail.g.dart';

@JsonSerializable()
class SparePartDetail {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "maintenanceId")
  int maintenanceId;

  @JsonKey(name: "statusId")
  int statusId;

  @JsonKey(name: "sparePartItemId")
  int sparePartItemId;

  @JsonKey(name: "sparePartItem")
  SparePartItem sparePartItem;

  @JsonKey(name: "status")
  Status status;


  SparePartDetail({this.id, this.maintenanceId, this.statusId, this.sparePartItemId, this.sparePartItem, this.status});

  factory SparePartDetail.fromJson(Map<String, dynamic> json) => _$SparePartDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SparePartDetailToJson(this);
}

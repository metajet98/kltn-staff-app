import 'package:staff_maintenance_app/models/maintenance/sparepart_item.dart';
import 'package:staff_maintenance_app/models/maintenance/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable()
class Schedule {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "userVehicleId")
  int userVehicleId;

  @JsonKey(name: "date")
  DateTime date;

  @JsonKey(name: "odometer")
  int odometer;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "content")
  String content;

  Schedule({this.id, this.userVehicleId, this.date, this.odometer, this.title, this.content});

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

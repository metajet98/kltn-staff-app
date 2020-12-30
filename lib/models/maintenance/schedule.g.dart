// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
    id: json['id'] as int,
    userVehicleId: json['userVehicleId'] as int,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    odometer: json['odometer'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'userVehicleId': instance.userVehicleId,
      'date': instance.date?.toIso8601String(),
      'odometer': instance.odometer,
      'title': instance.title,
      'content': instance.content,
    };

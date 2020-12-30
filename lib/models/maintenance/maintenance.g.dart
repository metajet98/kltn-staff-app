// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Maintenance _$MaintenanceFromJson(Map<String, dynamic> json) {
  return Maintenance(
    id: json['id'] as int,
    userVehicleId: json['userVehicleId'] as int,
    userVehicle: json['userVehicle'] == null
        ? null
        : Vehicle.fromJson(json['userVehicle'] as Map<String, dynamic>),
    notes: json['notes'] as String,
    maintenanceStaffId: json['maintenanceStaffId'] as int,
    maintenanceStaff: json['maintenanceStaff'] == null
        ? null
        : User.fromJson(json['maintenanceStaff'] as Map<String, dynamic>),
    receptionStaffId: json['receptionStaffId'] as int,
    receptionStaff: json['receptionStaff'] == null
        ? null
        : User.fromJson(json['receptionStaff'] as Map<String, dynamic>),
    odometer: json['odometer'] as int,
    branch: json['branch'] == null
        ? null
        : Branch.fromJson(json['branch'] as Map<String, dynamic>),
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    modifyDate: json['modifyDate'] == null
        ? null
        : DateTime.parse(json['modifyDate'] as String),
    motorWash: json['motorWash'] as int,
    sparepartBack: json['sparepartBack'] as bool,
    title: json['title'] as String,
    status: json['status'] as int,
    maintenanceSchedule: (json['maintenanceSchedule'] as List)
        ?.map((e) =>
            e == null ? null : Schedule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    sparePartCheckDetail: (json['sparepartCheckDetail'] as List)
        ?.map((e) => e == null
            ? null
            : SparePartDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    maintenanceBillDetail: (json['maintenanceBillDetail'] as List)
        ?.map((e) =>
            e == null ? null : BillDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MaintenanceToJson(Maintenance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userVehicleId': instance.userVehicleId,
      'userVehicle': instance.userVehicle,
      'notes': instance.notes,
      'maintenanceStaffId': instance.maintenanceStaffId,
      'maintenanceStaff': instance.maintenanceStaff,
      'receptionStaffId': instance.receptionStaffId,
      'receptionStaff': instance.receptionStaff,
      'odometer': instance.odometer,
      'branch': instance.branch,
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifyDate': instance.modifyDate?.toIso8601String(),
      'maintenanceBillDetail': instance.maintenanceBillDetail,
      'sparepartCheckDetail': instance.sparePartCheckDetail,
      'maintenanceSchedule': instance.maintenanceSchedule,
      'motorWash': instance.motorWash,
      'sparepartBack': instance.sparepartBack,
      'title': instance.title,
      'status': instance.status,
    };

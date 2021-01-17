// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    fullName: json['fullName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
    address: json['address'] as String,
    birthday: json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
    createdDate: json['createdDate'] == null
        ? null
        : DateTime.parse(json['createdDate'] as String),
    modifyDate: json['modifyDate'] == null
        ? null
        : DateTime.parse(json['modifyDate'] as String),
    role: json['role'] as String,
    branch: json['branch'] == null
        ? null
        : Branch.fromJson(json['branch'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'birthday': instance.birthday?.toIso8601String(),
      'createdDate': instance.createdDate?.toIso8601String(),
      'modifyDate': instance.modifyDate?.toIso8601String(),
      'role': instance.role,
      'branch': instance.branch,
    };

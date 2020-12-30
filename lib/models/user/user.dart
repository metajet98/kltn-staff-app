import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "fullName")
  String fullName;

  @JsonKey(name: "phoneNumber")
  String phoneNumber;

  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "address")
  String address;

  @JsonKey(name: "birthday")
  DateTime birthday;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  @JsonKey(name: "modifyDate")
  DateTime modifyDate;

  @JsonKey(name: "role")
  String role;

  User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.address,
    this.birthday,
    this.createdDate,
    this.modifyDate,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

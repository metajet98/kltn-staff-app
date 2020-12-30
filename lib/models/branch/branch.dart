import 'package:json_annotation/json_annotation.dart';

part 'branch.g.dart';

@JsonSerializable()
class Branch {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "address")
  String address;

  @JsonKey(name: "latitude")
  double latitude;

  @JsonKey(name: "longitude")
  double longitude;

  @JsonKey(name: "logo")
  String logo;

  @JsonKey(name: "createdDate")
  DateTime createdDate;

  @JsonKey(name: "modifyDate")
  DateTime modifyDate;

  Branch(
      {this.id, this.name, this.address, this.latitude, this.longitude, this.logo, this.createdDate, this.modifyDate});

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}

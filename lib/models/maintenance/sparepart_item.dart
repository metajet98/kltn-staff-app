import 'package:json_annotation/json_annotation.dart';

part 'sparepart_item.g.dart';

@JsonSerializable()
class SparePartItem {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "name")
  String name;

  SparePartItem({this.id, this.description, this.name});

  factory SparePartItem.fromJson(Map<String, dynamic> json) => _$SparePartItemFromJson(json);

  Map<String, dynamic> toJson() => _$SparePartItemToJson(this);
}

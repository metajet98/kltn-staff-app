import 'package:json_annotation/json_annotation.dart';

part 'service.g.dart';

@JsonSerializable()
class Service {
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "description")
  String description;

  @JsonKey(name: "laborCost")
  int laborCost;

  @JsonKey(name: "sparePartPrice")
  int sparePartPrice;

  @JsonKey(name: "serviceId")
  int serviceId;


  Service({this.id, this.name, this.description, this.laborCost, this.sparePartPrice, this.serviceId});

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

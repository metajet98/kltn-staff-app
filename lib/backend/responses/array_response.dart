import 'package:json_annotation/json_annotation.dart';
import 'package:staff_maintenance_app/converters/generic_type_converter.dart';

part 'array_response.g.dart';

@JsonSerializable()
class ArrayResponse<T> {
  @JsonKey(name: "data")
  @GenericTypeConverter()
  List<T> data;
  @JsonKey(name: "message")
  String message;
  @JsonKey(name: "statusCode")
  int statusCode;
  @JsonKey(name: "isSuccess")
  bool isSuccess;
  @JsonKey(name: "trace_log")
  dynamic traceLog;

  ArrayResponse(this.data, this.message, this.statusCode, this.isSuccess, this.traceLog);

  factory ArrayResponse.fromJson(Map<String, dynamic> json) => _$ArrayResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => _$ArrayResponseToJson(this);
}

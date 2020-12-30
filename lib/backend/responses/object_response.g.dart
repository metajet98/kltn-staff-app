// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectResponse<T> _$ObjectResponseFromJson<T>(Map<String, dynamic> json) {
  return ObjectResponse<T>(
    GenericTypeConverter<T>().fromJson(json['data']),
    json['message'] as String,
    json['statusCode'] as int,
    json['isSuccess'] as bool,
    json['trace_log'],
  );
}

Map<String, dynamic> _$ObjectResponseToJson<T>(ObjectResponse<T> instance) =>
    <String, dynamic>{
      'data': GenericTypeConverter<T>().toJson(instance.data),
      'message': instance.message,
      'statusCode': instance.statusCode,
      'isSuccess': instance.isSuccess,
      'trace_log': instance.traceLog,
    };

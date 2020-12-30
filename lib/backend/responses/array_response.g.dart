// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'array_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArrayResponse<T> _$ArrayResponseFromJson<T>(Map<String, dynamic> json) {
  return ArrayResponse<T>(
    (json['data'] as List)?.map(GenericTypeConverter<T>().fromJson)?.toList(),
    json['message'] as String,
    json['statusCode'] as int,
    json['isSuccess'] as bool,
    json['trace_log'],
  );
}

Map<String, dynamic> _$ArrayResponseToJson<T>(ArrayResponse<T> instance) =>
    <String, dynamic>{
      'data': instance.data?.map(GenericTypeConverter<T>().toJson)?.toList(),
      'message': instance.message,
      'statusCode': instance.statusCode,
      'isSuccess': instance.isSuccess,
      'trace_log': instance.traceLog,
    };

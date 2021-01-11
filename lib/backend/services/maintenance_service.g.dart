// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MaintenanceService implements MaintenanceService {
  _MaintenanceService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.0.100:5001/api/maintenance';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ArrayResponse<Maintenance>> getAllMaintenance(
      {userVehicleId, staffId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'userVehicleId': userVehicleId,
      r'staffId': staffId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArrayResponse<Maintenance>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<Maintenance>> getMaintenance({maintenanceId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/$maintenanceId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<Maintenance>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<Maintenance>> createMaintenance({params}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<Maintenance>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<Maintenance>> startMaintenance({maintenanceId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$maintenanceId/start',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<Maintenance>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<void>> finishMaintenance({maintenanceId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$maintenanceId/finish',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<void>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<void>> updateCheckList({maintenanceId, params}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$maintenanceId/check',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<void>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<void>> addBill({maintenanceId, params}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$maintenanceId/bill',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<void>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<void>> addSchedule({maintenanceId, params}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$maintenanceId/schedule',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<void>.fromJson(_result.data);
    return value;
  }
}

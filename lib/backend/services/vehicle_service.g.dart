// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _VehicleService implements VehicleService {
  _VehicleService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.0.101:5001/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ArrayResponse<VehicleCompany>> getVehicleCompanies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/vehicle-company',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArrayResponse<VehicleCompany>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ArrayResponse<VehicleType>> getVehicleTypes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/vehicle-type',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArrayResponse<VehicleType>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ArrayResponse<VehicleGroup>> getVehicleGroups() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/vehicle-group',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArrayResponse<VehicleGroup>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<void>> createUserVehicle({params}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(params ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/user-vehicle',
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
  Future<ArrayResponse<Vehicle>> getUserVehicles({plateNumber}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'PlateNumber': plateNumber};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/user-vehicle',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArrayResponse<Vehicle>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ObjectResponse<Vehicle>> getUserVehicle(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/user-vehicle/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<Vehicle>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ArrayResponse<SparePartItem>> getVehicleSpareParts(groupId) async {
    ArgumentError.checkNotNull(groupId, 'groupId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/vehicle-group/$groupId/spare-part',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArrayResponse<SparePartItem>.fromJson(_result.data);
    return value;
  }

  @override
  Future<ArrayResponse<Status>> getStatuses() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/spare-part/status',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArrayResponse<Status>.fromJson(_result.data);
    return value;
  }
}

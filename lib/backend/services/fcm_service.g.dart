// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _FcmService implements FcmService {
  _FcmService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.0.101:5001/api/fcm';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<void> register({token, platform}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {'token': token, 'platform': platform};
    _data.removeWhere((k, v) => v == null);
    await _dio.request<void>('/register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  Future<void> unregister({token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {'token': token};
    _data.removeWhere((k, v) => v == null);
    await _dio.request<void>('/unregister',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }
}

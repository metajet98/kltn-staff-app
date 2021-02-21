// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UtilsService implements UtilsService {
  _UtilsService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.0.101:5001/api/utils';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ObjectResponse<dynamic>> uploadImage({file}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (file != null) {
      _data.files.add(MapEntry(
          'file',
          MultipartFile.fromFileSync(file.path,
              filename: file.path.split(Platform.pathSeparator).last)));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/image',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ObjectResponse<dynamic>.fromJson(_result.data);
    return value;
  }
}

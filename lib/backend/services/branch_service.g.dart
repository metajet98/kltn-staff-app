// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BranchService implements BranchService {
  _BranchService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://192.168.0.101:5001/api/branch';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ArrayResponse<Service>> getBranchServices(
      {branchId, vehicleGroupId}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'vehicleGroupId': vehicleGroupId
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/$branchId/price',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ArrayResponse<Service>.fromJson(_result.data);
    return value;
  }
}

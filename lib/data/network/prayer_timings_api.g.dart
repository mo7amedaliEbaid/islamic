// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_timings_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PrayerTimingsServiceClient implements PrayerTimingsServiceClient {
  _PrayerTimingsServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.aladhan.com/v1/timingsByCity/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PrayerTimingsResponse> getPrayerTimings(
    String date,
    String city,
    String country,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PrayerTimingsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '${date}?city=${city}&country=${country}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PrayerTimingsResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

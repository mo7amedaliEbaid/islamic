

import '../../../di/di.dart';
import '../../network/prayer_timings_api.dart';
import '../../responses/prayer_timings/prayer_timings_response.dart';

abstract class RemoteDataSource {
  Future<PrayerTimingsResponse> getPrayerTimings(
    String date,
    String city,
    String country,
  );
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final PrayerTimingsServiceClient _prayerTimingsServiceClient =
      instance<PrayerTimingsServiceClient>();

  @override
  Future<PrayerTimingsResponse> getPrayerTimings(
      String date, String city, String country) async {
    return await _prayerTimingsServiceClient.getPrayerTimings(
      date,
      city,
      country,
    );
  }
}

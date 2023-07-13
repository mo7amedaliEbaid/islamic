part of 'prayer_timings_cubit.dart';

abstract class PrayerTimingsState {
  const PrayerTimingsState();
}

class PrayerTimesInitialState extends PrayerTimingsState {}

class GetConnectionLoadingState extends PrayerTimingsState {}

class GetConnectionSuccessState extends PrayerTimingsState {}

class GetConnectionErrorState extends PrayerTimingsState {
  final String error;

  const GetConnectionErrorState(this.error);
}

class GetLocationLoadingState extends PrayerTimingsState {}

class GetLocationSuccessState extends PrayerTimingsState {}

class GetLocationErrorState extends PrayerTimingsState {
  final String error;

  const GetLocationErrorState(this.error);
}

class GetPrayerTimesLoadingState extends PrayerTimingsState {}

class GetPrayerTimesSuccessState extends PrayerTimingsState {
  final PrayerTimingsModel prayerTimingsModel;

  GetPrayerTimesSuccessState(this.prayerTimingsModel);
}

class GetPrayerTimesErrorState extends PrayerTimingsState {
  final String error;

  const GetPrayerTimesErrorState(this.error);
}

class GetTimingsListState extends PrayerTimingsState {}

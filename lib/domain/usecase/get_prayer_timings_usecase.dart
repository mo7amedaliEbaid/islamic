import 'package:dartz/dartz.dart';

import 'package:equatable/equatable.dart';

import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../models/prayer_timings/prayer_timings_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GetPrayerTimingsUseCase
    implements
        BaseUseCase<GetPrayerTimingsUseCaseUseCaseInput, PrayerTimingsModel> {
  final Repository _repository = instance<Repository>();

  GetPrayerTimingsUseCase();

  @override
  Future<Either<Failure, PrayerTimingsModel>> call(
      GetPrayerTimingsUseCaseUseCaseInput input) async {
    return await _repository.getPrayerTimings(
        input.date, input.city, input.country);
  }
}

class GetPrayerTimingsUseCaseUseCaseInput extends Equatable {
  final String date;
  final String city;
  final String country;

  const GetPrayerTimingsUseCaseUseCaseInput({
    required this.date,
    required this.city,
    required this.country,
  });

  @override
  List<Object> get props => [
        date,
        city,
        country,
      ];

  GetPrayerTimingsUseCaseUseCaseInput copyWith({
    String? date,
    String? city,
    String? country,
  }) {
    return GetPrayerTimingsUseCaseUseCaseInput(
      date: date ?? this.date,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }
}

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as location_package;

import '../../../../../app/utils/constants.dart';
import '../../../../../di/di.dart';
import '../../../../../data/network/network_info.dart';
import '../../../../../domain/models/prayer_timings/prayer_timings_model.dart';
import '../../../../../domain/usecase/get_prayer_timings_usecase.dart';
import '../../../../../app/resources/resources.dart';

part 'prayer_timings_state.dart';

class PrayerTimingsCubit extends Cubit<PrayerTimingsState> {
  final GetPrayerTimingsUseCase _getPrayerTimingsUseCase =
      instance<GetPrayerTimingsUseCase>();
  final NetworkInfo networkInfo = instance<NetworkInfo>();

  PrayerTimingsCubit() : super(PrayerTimesInitialState());

  static PrayerTimingsCubit get(context) => BlocProvider.of(context);

  bool isConnected = false;

  Future<void> isNetworkConnected() async {
    emit(GetConnectionLoadingState());
    await networkInfo.isConnected.then((value) {
      isConnected = value;
      emit(GetConnectionSuccessState());
    }).catchError((error) {
      emit(GetConnectionErrorState(error.toString()));
    });
  }

  location_package.Location location = location_package.Location();

  PrayerTimingsModel prayerTimingsModel =
      const PrayerTimingsModel(code: 0, status: "", data: null);

  // (String, String) recordLocation = ("", "");

  Future<void> getLocation() async {
    emit(GetLocationLoadingState());

    bool serviceEnabled;
    location_package.PermissionStatus permissionGranted;
    location_package.LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        recordLocation =
            (AppStrings.enableLocation.tr(), AppStrings.enableLocation.tr());
        emit(GetLocationErrorState(AppStrings.enableLocation.tr()));
        // return (AppStrings.enableLocation.tr(), AppStrings.enableLocation.tr());
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == location_package.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != location_package.PermissionStatus.granted) {
        emit(GetLocationErrorState(
            AppStrings.giveLocationAccessPermission.tr()));
        recordLocation = (
          AppStrings.giveLocationAccessPermission.tr(),
          AppStrings.giveLocationAccessPermission.tr()
        );
      }
    }

    locationData = await location.getLocation();

    List<Placemark> placeMarks = await placemarkFromCoordinates(
        locationData.latitude!, locationData.longitude!);

    if (placeMarks.isNotEmpty) {
      recordLocation = (
        placeMarks[0].subAdministrativeArea.toString(),
        placeMarks[0].country.toString()
      );
      emit(GetLocationSuccessState());
    } else {
      recordLocation =
          (AppStrings.noLocationFound.tr(), AppStrings.noLocationFound.tr());
      emit(GetLocationErrorState(AppStrings.noLocationFound.tr()));
    }
  }

  Future<void> getPrayerTimings() async {
    emit(GetPrayerTimesLoadingState());
    if (recordLocation.$1 == "" || recordLocation.$2 == "") {
      await getLocation();
    }
    DateTime dateNow = DateTime.now();
    var formatter = DateFormat("dd-MM-yyy");
    String formattedDate = formatter.format(dateNow);
    final result =
        await _getPrayerTimingsUseCase(GetPrayerTimingsUseCaseUseCaseInput(
      date: formattedDate,
      city: recordLocation.$1,
      country: recordLocation.$2,
    ));
    result.fold((l) {
      prayerTimingsModel =
          PrayerTimingsModel(code: l.code!, status: l.message, data: null);
      emit(GetPrayerTimesErrorState(l.message));
    }, (r) {
      prayerTimingsModel = r;
      emit(GetPrayerTimesSuccessState(r));
    });
    // return prayerTimingsModel;
  }
}

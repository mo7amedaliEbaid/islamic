import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as location_package;

import '../../../app/utils/app_prefs.dart';
import '../../../app/utils/constants.dart';
import '../../../di/di.dart';
import '../../../../../app/resources/resources.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppPreferences _preferences = instance<AppPreferences>();

  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = Constants.quranIndex;

  void changeBotNavIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBotNavIndexState());
  }

  bool darkModeOn(BuildContext context) {
    final currentThemeMode = _preferences.getAppTheme();
    return currentThemeMode == ThemeMode.dark;
  }

  void changeAppTheme(BuildContext context) {
    _preferences.changeAppTheme();
    Phoenix.rebirth(context);
    emit(HomeChangeAppThemeState());
  }

  void changeAppLanguage(BuildContext context) {
    _preferences.changeAppLanguage();
    Phoenix.rebirth(context);
    emit(HomeChangeAppLanguageState());
  }

  bool isPageBookMarked(int quranPageNumber) {
    return _preferences.isPageBookMarked(quranPageNumber);
  }

  Future<bool> isThereABookMarked() async {
    await _preferences
        .isThereABookMarked()
        .then((value) => isThereABookMarkedPage = value);
    emit(CheckQuranBookMarkPageState());
    return isThereABookMarkedPage;
  }

  Future<void> bookMarkPage(int quranPageNumber) async {
    if (!isPageBookMarked(quranPageNumber)) {
      _preferences.bookMarkPage(quranPageNumber);
    } else {
      _preferences.removeBookMarkPage();
    }
    await isThereABookMarked();
    emit(QuranBookMarkPageState());
  }

  int? bookMarkedPage;

  int? getBookMarkPage() {
    bookMarkedPage = _preferences.getBookMarkedPage();
    emit(GetQuranBookMarkPageState());
    return bookMarkedPage;
  }

  location_package.Location location = location_package.Location();

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
}

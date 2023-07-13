part of 'custom_adhkar_cubit.dart';

abstract class CustomAdhkarState {
  const CustomAdhkarState();
}

class CustomAdhkarInitial extends CustomAdhkarState {}

class ChangeBotSheetState extends CustomAdhkarState {}

class GetAllCustomAdhkarLoadingState extends CustomAdhkarState {}

class GetAllCustomAdhkarSuccessState extends CustomAdhkarState {}

class GetAllCustomAdhkarErrorState extends CustomAdhkarState {
  final String error;

  const GetAllCustomAdhkarErrorState(this.error);
}

class InsertNewDhikrLoadingState extends CustomAdhkarState {}

class InsertNewDhikrSuccessState extends CustomAdhkarState {}

class InsertNewDhikrErrorState extends CustomAdhkarState {
  final String error;

  const InsertNewDhikrErrorState(this.error);
}

class UpdateCustomDhikrLoadingState extends CustomAdhkarState {}

class UpdateCustomDhikrSuccessState extends CustomAdhkarState {}

class UpdateCustomDhikrErrorState extends CustomAdhkarState {
  final String error;

  const UpdateCustomDhikrErrorState(this.error);
}

class DelAllCustomAdhkarLoadingState extends CustomAdhkarState {}

class DelAllCustomAdhkarSuccessState extends CustomAdhkarState {}

class DelAllCustomAdhkarErrorState extends CustomAdhkarState {
  final String error;

  const DelAllCustomAdhkarErrorState(this.error);
}

class DelCustomDhikrByDhikrTextLoadingState extends CustomAdhkarState {}

class DelCustomDhikrByDhikrTextSuccessState extends CustomAdhkarState {}

class DelCustomDhikrByDhikrTextErrorState extends CustomAdhkarState {
  final String error;

  const DelCustomDhikrByDhikrTextErrorState(this.error);
}

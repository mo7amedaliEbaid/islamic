part of 'adhkar_cubit.dart';

abstract class AdhkarState {
  const AdhkarState();
}

class AdhkarInitial extends AdhkarState {}

class AdhkarGetDataLoadingState extends AdhkarState {}

class AdhkarGetDataSuccessState extends AdhkarState {
  final List<AdhkarModel> adhkarList;

  const AdhkarGetDataSuccessState(this.adhkarList);
}

class AdhkarGetDataErrorState extends AdhkarState {
  final String error;

  const AdhkarGetDataErrorState(this.error);
}

class AdhkarCounterState extends AdhkarState {}

class AdhkarCounterResetState extends AdhkarState {}

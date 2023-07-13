part of 'hadith_cubit.dart';

abstract class HadithState {
  const HadithState();
}

class HadithInitial extends HadithState {}

class HadithGetDataLoadingState extends HadithState {}

class HadithGetDataSuccessState extends HadithState {
  final List<HadithModel> hadithList;

  const HadithGetDataSuccessState(this.hadithList);
}

class HadithGetDataErrorState extends HadithState {
  final String error;

  const HadithGetDataErrorState(this.error);
}

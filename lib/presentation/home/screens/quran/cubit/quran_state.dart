part of 'quran_cubit.dart';

abstract class QuranState {
  const QuranState();
}

class QuranInitial extends QuranState {}

class QuranGetDataLoadingState extends QuranState {}

class QuranGetDataSuccessState extends QuranState {
  final List<QuranModel> quranList;

  const QuranGetDataSuccessState(this.quranList);
}

class QuranGetDataErrorState extends QuranState {
  final String error;

  const QuranGetDataErrorState(this.error);
}

class QuranSearchGetDataLoadingState extends QuranState {}

class QuranSearchGetDataSuccessState extends QuranState {
  final List<QuranSearchModel> quranList;

  const QuranSearchGetDataSuccessState(this.quranList);
}

class QuranSearchGetDataErrorState extends QuranState {
  final String error;

  const QuranSearchGetDataErrorState(this.error);
}

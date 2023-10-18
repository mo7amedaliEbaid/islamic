
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/utils/constants.dart';
import '../../../../../di/di.dart';
import '../../../../../domain/models/quran/quran_model.dart';
import '../../../../../domain/models/quran/quran_search_model.dart';
import '../../../../../domain/usecase/base_usecase.dart';
import '../../../../../domain/usecase/quran_search_usecase.dart';
import '../../../../../domain/usecase/quran_usecase.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final QuranUseCase _quranUseCase = instance<QuranUseCase>();

  final QuranSearchUseCase _quranSearchUseCase = instance<QuranSearchUseCase>();

  QuranCubit() : super(QuranInitial());

  static QuranCubit get(context) => BlocProvider.of(context);

  List<QuranModel> quranData = [];

  Future getQuranData() async {
    emit(QuranGetDataLoadingState());
    final result = await _quranUseCase(const NoParameters());
    result.fold((l) => emit(QuranGetDataErrorState(l.message)), (r) {
      quranData = r;
      emit(QuranGetDataSuccessState(r));
    });
  }

  Future getQuranSearchData() async {
    emit(QuranSearchGetDataLoadingState());
    final result = await _quranSearchUseCase(const NoParameters());
    result.fold((l) => emit(QuranSearchGetDataErrorState(l.message)), (r) {
      quranSearchData = r;
      emit(QuranSearchGetDataSuccessState(r));
    });
  }

  List<AyahModel> getAyahsFromPageNo({
    required List<QuranModel> quranList,
    required int pageNo,
  }) {
    List<AyahModel> ayahs = List.from(quranList
        .expand((surah) => (surah.ayahs.where((ayah) => ayah.page == pageNo))));
    return ayahs;
  }

  List<QuranModel> getPageSurahs({
    required List<QuranModel> quran,
    required int pageNo,
  }) {
    List<QuranModel> pageSurahsNames = [];
    for (var i = 0; i < quran.length; i++) {
      final surah = quran[i];
      final List<AyahModel> ayahs = surah.ayahs;
      for (var ayah in ayahs) {
        if (ayah.page == pageNo) {
          pageSurahsNames.add(surah);
        }
      }
    }
    return pageSurahsNames.toSet().toList();
  }
}

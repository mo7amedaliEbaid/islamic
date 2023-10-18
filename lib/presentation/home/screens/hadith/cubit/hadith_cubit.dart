import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di/di.dart';
import '../../../../../domain/models/hadith/hadith_model.dart';
import '../../../../../domain/usecase/base_usecase.dart';
import '../../../../../domain/usecase/hadith_usecase.dart';


part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithUseCase _hadithUseCase = instance<HadithUseCase>();

  HadithCubit() : super(HadithInitial());

  static HadithCubit get(context) => BlocProvider.of(context);

  List<HadithModel> hadithList = [];

  Future getHadithData() async {
    emit(HadithGetDataLoadingState());
    final result = await _hadithUseCase(const NoParameters());
    result.fold((l) => emit(HadithGetDataErrorState(l.message)),
        (r) {
          hadithList = r;
          emit(HadithGetDataSuccessState(r));
        });
  }
}

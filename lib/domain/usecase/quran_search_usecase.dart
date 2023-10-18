import 'package:dartz/dartz.dart';


import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../models/quran/quran_search_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class QuranSearchUseCase implements BaseUseCase<void, List<QuranSearchModel>> {
  final Repository _repository = instance<Repository>();

  QuranSearchUseCase();

  @override
  Future<Either<Failure, List<QuranSearchModel>>> call(_) async {
    return await _repository.getQuranSearchData();
  }
}

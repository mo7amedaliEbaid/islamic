import 'package:dartz/dartz.dart';

import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../models/hadith/hadith_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';


class HadithUseCase implements BaseUseCase<void, List<HadithModel>> {
  final Repository _repository = instance<Repository>();

  HadithUseCase();

  @override
  Future<Either<Failure, List<HadithModel>>> call(_) async {
    return await _repository.getHadithData();
  }
}

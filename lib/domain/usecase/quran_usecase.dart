import 'package:dartz/dartz.dart';


import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../models/quran/quran_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class QuranUseCase implements BaseUseCase<void, List<QuranModel>> {
  final Repository _repository = instance<Repository>();

  QuranUseCase();

  @override
  Future<Either<Failure, List<QuranModel>>> call(_) async {
    return await _repository.getQuranData();
  }
}

import 'package:dartz/dartz.dart';

import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';


class DelCustomDhikrByDhikrTextUseCase implements BaseUseCase<String, void> {
  final Repository _repository = instance<Repository>();

  DelCustomDhikrByDhikrTextUseCase();

  @override
  Future<Either<Failure, void>> call(String dhikr) async {
    return await _repository.delDhikrByDhikrText(dhikr);
  }
}

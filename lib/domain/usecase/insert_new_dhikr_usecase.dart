import 'package:dartz/dartz.dart';

import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../models/adhkar/custom_adhkar_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';


class InsertNewDhikrUseCase implements BaseUseCase<CustomAdhkarEntity, void> {
  final Repository _repository = instance<Repository>();

  InsertNewDhikrUseCase();

  @override
  Future<Either<Failure, void>> call(CustomAdhkarEntity dhikr) async {
    return await _repository.insertDhikr(dhikr);
  }
}

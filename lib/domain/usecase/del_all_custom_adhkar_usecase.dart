import 'package:dartz/dartz.dart';

import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../models/adhkar/custom_adhkar_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';


class DelAllCustomAdhkarUseCase implements BaseUseCase<List<CustomAdhkarEntity>, void> {
  final Repository _repository = instance<Repository>();

  DelAllCustomAdhkarUseCase();

  @override
  Future<Either<Failure, void>> call(List<CustomAdhkarEntity> list) async {
    return await _repository.deleteAll(list);
  }
}

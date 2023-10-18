import 'package:dartz/dartz.dart';

import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../models/adhkar/custom_adhkar_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';


class GetAllCustomAdhkarUseCase implements BaseUseCase<void, List<CustomAdhkarEntity>> {
  final Repository _repository = instance<Repository>();

  GetAllCustomAdhkarUseCase();

  @override
  Future<Either<Failure, List<CustomAdhkarEntity>>> call(_) async {
    return await _repository.getAllCustomAdhkar();
  }
}

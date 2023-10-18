import 'package:dartz/dartz.dart';


import '../../app/error/failure.dart';
import '../../di/di.dart';
import '../models/adhkar/adhkar_model.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class AdhkarUseCase implements BaseUseCase<void, List<AdhkarModel>> {
  final Repository _repository = instance<Repository>();

  AdhkarUseCase();

  @override
  Future<Either<Failure, List<AdhkarModel>>> call(_) async {
    return await _repository.getAdhkarData();
  }
}

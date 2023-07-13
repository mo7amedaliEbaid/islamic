import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../app/error/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In input);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}

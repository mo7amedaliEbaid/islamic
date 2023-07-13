import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int? code;
  final String message;

  const Failure(
    this.code,
    this.message,
  );

  @override
  List<Object?> get props => [code, message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.code, super.message);
}

class LocalFailure extends Failure {
  const LocalFailure(super.code, super.message);
}

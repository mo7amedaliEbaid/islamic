import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class CustomAdhkarEntity extends Equatable {
  @primaryKey
  final String dhikr;
  final int count;

  const CustomAdhkarEntity({
    required this.dhikr,
    required this.count,
  });

  @override
  List<Object> get props => [
    dhikr,
    count,
  ];
}

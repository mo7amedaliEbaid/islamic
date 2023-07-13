import 'package:equatable/equatable.dart';

class AdhkarModel extends Equatable {
  final String category;
  final String count;
  final String description;
  final String reference;
  final String dhikr;

  const AdhkarModel({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.dhikr,
  });

  @override
  List<Object> get props => [
        category,
        count,
        description,
        reference,
        dhikr,
      ];
}

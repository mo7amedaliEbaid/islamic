import 'package:equatable/equatable.dart';

class HadithModel extends Equatable {
  final String? description;
  final String? hadith;

  const HadithModel({
    required this.description,
    required this.hadith,
  });

  @override
  List<Object?> get props => [
        description,
        hadith,
      ];
}

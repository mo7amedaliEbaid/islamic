import 'package:equatable/equatable.dart';

class QuranSearchModel extends Equatable {
  final int id;
  final String text;
  final int numberInSurah;
  final int surahNumber;

  const QuranSearchModel({
    required this.id,
    required this.text,
    required this.numberInSurah,
    required this.surahNumber,
  });

  @override
  List<Object> get props => [
        id,
        text,
        numberInSurah,
        surahNumber,
      ];
}

import 'package:json_annotation/json_annotation.dart';

part 'quran_response.g.dart';

@JsonSerializable()
class AyahResponse {
  @JsonKey(name: "number")
  int number;
  @JsonKey(name: "text")
  String text;
  @JsonKey(name: "numberInSurah")
  int numberInSurah;
  @JsonKey(name: "juz")
  int juz;
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "hizbQuarter")
  int hizbQuarter;

  AyahResponse(
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
    this.page,
    this.hizbQuarter,
  );

  //from Json
  factory AyahResponse.fromJson(Map<String, dynamic> json) =>
      _$AyahResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$AyahResponseToJson(this);
}

@JsonSerializable()
class QuranResponse {
  @JsonKey(name: "number")
  int number;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "englishName")
  String englishName;
  @JsonKey(name: "englishNameTranslation")
  String englishNameTranslation;
  @JsonKey(name: "revelationType")
  String revelationType;
  @JsonKey(name: "ayahs")
  List<AyahResponse> ayahs;

  QuranResponse(this.number, this.name, this.englishName,
      this.englishNameTranslation, this.revelationType, this.ayahs);

  //from Json
  factory QuranResponse.fromJson(Map<String, dynamic> json) =>
      _$QuranResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$QuranResponseToJson(this);
}

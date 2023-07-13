import 'package:json_annotation/json_annotation.dart';

part 'quran_search_response.g.dart';

@JsonSerializable()
class QuranSearchResponse {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "text_imlaei_simple")
  String text;
  @JsonKey(name: "verse_key")
  String verseKey;

  QuranSearchResponse(
    this.id,
    this.text,
    this.verseKey,
  );

  //from Json
  factory QuranSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$QuranSearchResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$QuranSearchResponseToJson(this);
}

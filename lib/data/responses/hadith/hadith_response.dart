import 'package:json_annotation/json_annotation.dart';

part 'hadith_response.g.dart';

@JsonSerializable()
class HadithResponse {
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "hadith")
  String? hadith;

  HadithResponse(
    this.description,
    this.hadith,
  );

  //from Json
  factory HadithResponse.fromJson(Map<String, dynamic> json) =>
      _$HadithResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$HadithResponseToJson(this);
}

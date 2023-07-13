import 'package:json_annotation/json_annotation.dart';

part 'adhkar_response.g.dart';

@JsonSerializable()
class AdhkarResponse {
  @JsonKey(name: "category")
  String category;
  @JsonKey(name: "count")
  String count;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "reference")
  String reference;
  @JsonKey(name: "dhikr")
  String dhikr;

  AdhkarResponse(
    this.category,
    this.count,
    this.description,
    this.reference,
    this.dhikr,
  );

  //from Json
  factory AdhkarResponse.fromJson(Map<String, dynamic> json) =>
      _$AdhkarResponseFromJson(json);

//to Json
  Map<String, dynamic> toJson() => _$AdhkarResponseToJson(this);
}

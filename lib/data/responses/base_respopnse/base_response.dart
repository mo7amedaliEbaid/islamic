import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "status")
  String? status;
}

import 'package:bloc_demo/repository/models/platform.dart';
import 'package:bloc_demo/repository/models/requirements.dart';
import 'package:json_annotation/json_annotation.dart';

part 'platform_element.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class PlatformElement {
  final PlatformPlatform? platform;
  final DateTime? releasedAt;
  final Requirements? requirementsEn;
  final Requirements? requirementsRu;

  PlatformElement(
      this.platform, this.releasedAt, this.requirementsEn, this.requirementsRu);

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      _$PlatformElementFromJson(json);
}

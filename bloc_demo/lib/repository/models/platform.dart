
import 'package:json_annotation/json_annotation.dart';

part 'platform.g.dart';
@JsonSerializable(fieldRename:FieldRename.snake)
class PlatformPlatform {
  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final int? yearStart;
  final int? gamesCount;
  final String? imageBackground;

  PlatformPlatform(this.id, this.name, this.slug, this.image, this.yearStart,
      this.gamesCount, this.imageBackground);

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      _$PlatformPlatformFromJson(json);
}

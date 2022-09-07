import 'package:json_annotation/json_annotation.dart';

import 'esrb_rating.dart';
part 'parent_platform.g.dart';
@JsonSerializable()
class ParentPlatform {
  final EsrbRating? platform;

  ParentPlatform(this.platform);

  factory ParentPlatform.fromJson(json) => _$ParentPlatformFromJson(json);
}

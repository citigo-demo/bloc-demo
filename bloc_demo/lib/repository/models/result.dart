import 'package:bloc_demo/repository/models/parent_platform.dart';
import 'package:bloc_demo/repository/models/platform_element.dart';
import 'package:bloc_demo/repository/models/rating.dart';
import 'package:bloc_demo/repository/models/short_screenshot.dart';
import 'package:bloc_demo/repository/models/store.dart';
import 'package:json_annotation/json_annotation.dart';

import 'added_by_status.dart';
import 'esrb_rating.dart';
import 'genre.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Result {
  final int id;
  final String? slug;
  final String? name;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final int? ratingCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatus? addedByStatus;
  final int? metacritic;
  final int? playtime;
  final int? suggestionCount;
  final DateTime? updated;
  final String? userGame;
  final int? reviewsCount;
  final String? saturatedColor;
  final String? dominantColor;
  final List<PlatformElement>? platforms;
  final List<ParentPlatform>? parrentPlatforms;
  final List<Genre>? genres;
  final List<Store>? stores;
  final String? clip;
  final List<Genre>? tags;
  final EsrbRating? esrbRating;
  final List<ShortScreenshot>? shortScreenshots;

  Result(
      this.id,
      this.slug,
      this.name,
      this.released,
      this.tba,
      this.backgroundImage,
      this.rating,
      this.ratingTop,
      this.ratings,
      this.ratingCount,
      this.reviewsTextCount,
      this.added,
      this.addedByStatus,
      this.metacritic,
      this.playtime,
      this.suggestionCount,
      this.updated,
      this.userGame,
      this.reviewsCount,
      this.saturatedColor,
      this.dominantColor,
      this.platforms,
      this.parrentPlatforms,
      this.genres,
      this.stores,
      this.clip,
      this.tags,
      this.esrbRating,
      this.shortScreenshots);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

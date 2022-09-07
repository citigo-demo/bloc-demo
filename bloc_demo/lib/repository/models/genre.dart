import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';
@JsonSerializable()
class Genre {
  final int id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? imageBackground;
  final String? domain;
  final String? language;

  Genre(this.id, this.name, this.slug, this.gamesCount, this.imageBackground,
      this.domain, this.language);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
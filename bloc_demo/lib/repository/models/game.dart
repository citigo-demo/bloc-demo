import 'package:bloc_demo/repository/models/result.dart';
import 'package:json_annotation/json_annotation.dart';

import 'filters.dart';

part 'game.g.dart';

@JsonSerializable()
class Game{
  final int? count;
  final String? next;
  final int? previous;
  final List<Result> result;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeywords;
  final String? seoH1;
  final bool? noindex;
  final bool? nofollow;
  final String? description;
  final Filters? filters;
  final List<String>? nofollowCollections;

  Game(
  {this.count,
      this.next,
      this.previous,
      required this.result,
      this.seoTitle,
      this.seoDescription,
      this.seoKeywords,
      this.seoH1,
      this.noindex,
      this.nofollow,
      this.description,
      this.filters,
      this.nofollowCollections});

  static Game empty = Game(
    count: 0,
    next:  '',
    previous: 0,
    result: [],
    seoTitle: '',
    seoDescription: '',
    seoKeywords: '',
    seoH1: '',
    noindex:false,
    nofollow: false,
    description: '',
    filters: Filters(years:[]),
    nofollowCollections: []
  );

  factory Game.fromJson(Map<String, dynamic> json ) => _$GameFromJson(json);
}
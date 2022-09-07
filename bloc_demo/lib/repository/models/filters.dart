import 'package:json_annotation/json_annotation.dart';

import 'filters_year.dart';

part 'filters.g.dart';

@JsonSerializable()
class Filters {
  final List<FiltersYear>? years;

  Filters({this.years});

  factory Filters.fromJson(Map<String, dynamic> json) =>
      _$FiltersFromJson(json);
}

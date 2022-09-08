// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_year.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FiltersYear _$FiltersYearFromJson(Map<String, dynamic> json) => FiltersYear(
      json['from'] as int?,
      json['to'] as int?,
      json['filter'] as String?,
      json['decade'] as int?,
      (json['years'] as List<dynamic>?)
          ?.map((e) => YearGame.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['nofollow'] as bool?,
      json['count'] as int?,
    );

Map<String, dynamic> _$FiltersYearToJson(FiltersYear instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'filter': instance.filter,
      'decade': instance.decade,
      'years': instance.years,
      'nofollow': instance.nofollow,
      'count': instance.count,
    };

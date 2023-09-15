// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => MainData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

MainData _$MainDataFromJson(Map<String, dynamic> json) => MainData(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    )..title = json['title'] as String?;

Map<String, dynamic> _$MainDataToJson(MainData instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
    };

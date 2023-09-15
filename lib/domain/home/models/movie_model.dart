import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {

  @JsonKey(name: 'page')
  int? page;
  @JsonKey(name: 'results')
  List<MainData> results;

  MovieModel({required this.page,required this.results});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}

@JsonSerializable()
class MainData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  MainData({
    this.backdropPath,
    this.id,
    thistitle,
    this.overview,
    this.posterPath,
    this.voteAverage,
  });

  factory MainData.fromJson(Map<String, dynamic> json) {
    return _$MainDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}


//  static List<ProductModel> parseProducts(List<dynamic> p) {
//     return List.generate(p.length, (index) => ProductModel.fromJson(p[index]));
//   }
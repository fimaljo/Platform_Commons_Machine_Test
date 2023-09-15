import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../core/failures.dart';
import '../core/string.dart';
import '../domain/home/models/movie_model.dart';
import 'api_key.dart';

class MovieService {
  static Future<Either<MainFailure, MovieModel>> getMovies(
      {required int page}) async {
    final Dio dio = Dio();


    try {
      final response = await dio.get(
        '$kBaseUrl/trending/movie/day',
        queryParameters: {
          'language': 'en-US',
          'api_key': apiKey,
          'page': page,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = response.data;
        print(json);
        MovieModel movie = MovieModel.fromJson(json);

        return Right(movie);
      } else {
        throw const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      
      throw  const Left(MainFailure.clientFailure());
    }
  }
}

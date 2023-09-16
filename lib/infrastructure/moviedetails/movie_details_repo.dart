import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:platform_commons_machine_test/core/string.dart';
import 'package:platform_commons_machine_test/domain/home/models/movie_model.dart';

import '../../core/error_model.dart';

import '../api_key.dart';

class MovieDetailsRepository {
  final Dio dio = Dio();

  Future<Either<Failure, MainData>> getMovieDetails(String movieId) async {
    try {
      final response = await dio.get(
        '$kBaseUrl/movie/$movieId',
        queryParameters: {
          'api_key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = response.data;

        MainData movie = MainData.fromJson(json);

        return Right(movie);
      } else {
        return const Left(Failure(message: 'Failed to fetch movie details'));
      }
    } catch (e) {
    
      return const Left(Failure(message: 'Something went wrong'));
    }
  }
}

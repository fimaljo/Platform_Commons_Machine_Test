import 'package:dartz/dartz.dart';

import '../../core/failures.dart';
import 'models/movie_model.dart';

abstract class HomeService {
  Future<Either<MainFailure, MovieModel>> pageQuery({
    required int pageQuery,
  });
}

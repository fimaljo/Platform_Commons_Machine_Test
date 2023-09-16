
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/home/models/movie_model.dart';


import '../../../infrastructure/moviedetails/movie_details_repo.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) async {
      if (event is MovieDetailsLoadEvent) {
        emit(MovieDetailsLoading());

        final response =
            await MovieDetailsRepository().getMovieDetails(event.movieId);

        response.fold(
          (l) =>
              emit(MovieDetailsError(message: 'Failed to load movie details')),
          (r) => emit(MovieDetailsLoaded(movie: r)),
        );
      }
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_commons_machine_test/infrastructure/home/movie_repo.dart';

import '../../../domain/home/models/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  MovieModel movies = MovieModel(
    results: [],
    page: 1,
  );
  HomeBloc() : super(MoviesInitial()) {
    on<HomeEvent>((event, emit) async {
      
      if (event is MovieLoadEvent) {
        bool isInitial = movies.page == 1;
        isInitial
            ? emit(MoviesInitialLoading(message: 'Fetching Movies....'))
            : emit(MoviesLoaded(
                movies: movies,
                loading: LoadingMore(message: 'Fetching more Movies...')));
        final response = await MovieService.getMovies(page: movies.page!);

        response.fold(
            (l) => isInitial
                ? emit(ProductInitialError(message: 'Failed to load Movies'))
                : emit(
                    MoviesLoaded(
                      movies: movies,
                      error:
                          LoadMoreError(message: 'Failed to load more Movies'),
                    ),
                  ), (r) {
          if (isInitial) {
            movies = MovieModel(
              results: r.results,
              page: r.page! + 1,
            );

            if (movies.results.isEmpty) {
              emit(MoviesEmpty());
            }
          } else {
            movies = MovieModel(
              results: movies.results + r.results,
              page: r.page! + 1,
            );
          }
          emit(MoviesLoaded(movies: movies));
        });
      }
    });
  }
}

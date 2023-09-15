part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class MoviesInitial extends HomeState {}

//State for initial Loading when current page will be 1
class MoviesInitialLoading extends HomeState {
  final String message;
  MoviesInitialLoading({required this.message});
}

class ProductInitialError extends HomeState {
  final String message;
  ProductInitialError({required this.message});
}

class MoviesEmpty extends HomeState {}

class MoviesLoaded extends HomeState {
  final MovieModel movies;
  final LoadingMore? loading;
  final LoadMoreError? error;
  MoviesLoaded({
    required this.movies,
    this.loading,
    this.error,
  });
}

class LoadingMore {
  final String message;
  LoadingMore({required this.message});
}

class LoadMoreError {
  final String message;
  LoadMoreError({required this.message});
}

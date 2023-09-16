part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsError extends MovieDetailsState {
  final String message;
  MovieDetailsError({required this.message});
}

class MovieDetailsLoaded extends MovieDetailsState {
  final MainData movie;
  MovieDetailsLoaded({required this.movie});
}

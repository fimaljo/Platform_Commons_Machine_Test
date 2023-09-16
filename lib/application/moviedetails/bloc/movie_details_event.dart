part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class MovieDetailsLoadEvent extends MovieDetailsEvent {
  final String movieId;
  MovieDetailsLoadEvent({required this.movieId});
}

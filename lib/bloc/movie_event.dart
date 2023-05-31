part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent {}

class MovieFetchEvent extends MovieEvent {
  final String movie;
  final dynamic trend;
  
  MovieFetchEvent({
    required this.movie,
    required this.trend
  });
}

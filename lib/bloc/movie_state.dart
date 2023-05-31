part of 'movie_bloc.dart';

@immutable
class MovieState{

  final MovieFetchModel? movieInfo;
  final MovieTrendModel? trend;
  
  const MovieState({
    this.movieInfo,
    this.trend
  });
}

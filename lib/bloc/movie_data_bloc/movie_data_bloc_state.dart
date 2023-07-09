part of 'movie_data_bloc_bloc.dart';

@immutable
class MovieDataState {
  final MovieFetchModel? data;
  final ActorGetModel? actorData;
  const MovieDataState({
    this.data,
    this.actorData,
  });
}


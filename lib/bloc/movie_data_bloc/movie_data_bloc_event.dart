part of 'movie_data_bloc_bloc.dart';

@immutable
class MovieDataEvent {
  final int? id;
  const MovieDataEvent({
    required this.id,
  });
}

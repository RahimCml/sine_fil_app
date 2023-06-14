import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/genre_movie_get_model.dart';
import '../../data/service/movie_service.dart';

part 'genre_movie_bloc_event.dart';
part 'genre_movie_bloc_state.dart';

class GenreMovieBloc extends Bloc<GenreMovieEvent, GenreMovieState> {
  final MovieService _movieService = MovieService();

  GenreMovieBloc() : super(GenreMovieState()) {
    getGenreIdFromService();
  }

  void getGenreIdFromService() async {
    on<GenreMovieEvent>(
      (event, emit) async {
        if (event is GenreMovieEvent) {
          GenreMovieGetModel result =
              await _movieService.movieInfoFromGenre(event.id.toString());
              print(result.results![1].title);
              emit(GenreMovieState(movies: result));
        }
      },
    );
  }
}




import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/genre_movie_get_model.dart';
import '../../data/service/movie_service.dart';

part 'genre_movie_bloc_event.dart';
part 'genre_movie_bloc_state.dart';

class GenreMovieBlocBloc extends Bloc<GenreMovieBlocEvent, GenreMovieBlocState> {
  final MovieService _movieService = MovieService();

  GenreMovieBlocBloc() : super(GenreMovieBlocState()) {
    getGenreIdFromService();
  }

  void getGenreIdFromService() async {
    on<GenreMovieBlocEvent>(
      (event, emit) async {
        if (event is GenreMovieBlocEvent) {
          GenreMovieGetModel result =
              await _movieService.movieInfoFromGenre(event.id.toString());
              print(result.results![1].title);
              emit(GenreMovieBlocState(movies: result));
        }
      },
    );
  }
}




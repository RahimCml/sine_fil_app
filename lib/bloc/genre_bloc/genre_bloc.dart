import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/genre_get_model.dart';
import '../../data/service/movie_service.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final MovieService _movieService = MovieService();

  GenreBloc() : super(const GenreState()) {
    getGenreFromService();
  }

  void getGenreFromService() async {
    GenresGetModel result = await _movieService.genresInfo();
    emit(GenreState(genres: result));
  }
}

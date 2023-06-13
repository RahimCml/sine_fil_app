import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sine_fil_app/bloc/movie_bloc.dart';
import 'package:sine_fil_app/data/models/movie_fetch_model.dart';

import '../../data/models/genre_get_model.dart';
import '../../data/models/genre_movie_get_model.dart';
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
    print('2 $result');
    emit(GenreState(genres: result));
  }
}

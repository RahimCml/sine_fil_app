
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sine_fil_app/data/models/movie_trend_model.dart';
import 'package:sine_fil_app/data/service/movie_service.dart';

import '../data/models/movie_fetch_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieService _movieService = MovieService();

  MovieBloc() : super(const MovieState()) {
    fetchDataFromAPI();
  }

  void fetchDataFromAPI() async {
    MovieTrendModel result = await _movieService.trendMovieInfo();
    emit(MovieState(trend: result));
  }
}

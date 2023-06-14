import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sine_fil_app/bloc/movie_bloc.dart';
import 'package:sine_fil_app/data/models/movie_fetch_model.dart';

import '../../data/service/movie_service.dart';

part 'movie_data_bloc_event.dart';
part 'movie_data_bloc_state.dart';

class MovieDataBloc extends Bloc<MovieDataEvent, MovieDataState> {
    final MovieService _movieService = MovieService();

  MovieDataBloc() : super(MovieDataState()) {
    getMovie();
  }


  void getMovie() async {
        on<MovieDataEvent>((event, emit) async {
      if(event is MovieDataEvent) {
        print('idididi2 ${event.id}');
        MovieFetchModel result = await _movieService.getMovieFromAPI(event.id as int);
        print('olaa $result');
        emit(MovieDataState(data: result));
      }
    });
  }
}

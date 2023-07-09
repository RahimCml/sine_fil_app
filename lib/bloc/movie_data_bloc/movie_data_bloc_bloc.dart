import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sine_fil_app/bloc/movie_bloc.dart';
import 'package:sine_fil_app/data/models/actor_get_model.dart';
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
        MovieFetchModel result = await _movieService.getMovieFromAPI(event.id);
        ActorGetModel actorsResult = await _movieService.getActorAPI(event.id);
        emit(MovieDataState(data: result, actorData: actorsResult));
      }
    });
  }

}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sine_fil_app/data/models/actor_get_model.dart';
import 'package:sine_fil_app/data/models/movie_fetch_model.dart';
import 'package:sine_fil_app/data/models/movie_trend_model.dart';

import '../data_constants/api_constants.dart';
import '../models/genre_get_model.dart';
import '../models/genre_movie_get_model.dart';

 String language = 'tr';

class MovieService {
  Future<dynamic> fetchMovieInfo(String movie) async {
    String searchUrl = 'search/multi?query=';
    Uri url = Uri.parse(
        '${ApiConstants.baseUrl}$searchUrl$movie&${ApiConstants.apiKey}&language=$language');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      return MovieFetchModel.fromJson(result);
    } else {
      throw Exception();
    }
  }

  Future<MovieTrendModel> trendMovieInfo() async {
    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}trending/all/day?${ApiConstants.apiKey}&language=$language'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResult = json.decode(response.body);
      String jsonString = json.encode(jsonResult);
      MovieTrendModel result = trendFromJson(jsonString);
      return result;
    }
    throw Exception('Failed to fetch trend data');
  }

  Future<GenresGetModel> genresInfo() async {
    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}genre/movie/list?${ApiConstants.apiKey}&language=$language'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResult = json.decode(response.body);
      return GenresGetModel.fromJson(jsonResult);
    }
    throw Exception('Failed to fetch trend data');
  }

  //better way in order to create
  Future<GenreMovieGetModel> movieInfoFromGenre(v) => movieInfo(v);
  Future<GenreMovieGetModel> movieInfo(id) async {
    Uri url = Uri.parse(
        '${ApiConstants.baseUrl}discover/movie?${ApiConstants.apiKey}&language=$language&with_genres=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResult = jsonDecode(response.body);
      GenreMovieGetModel movies = GenreMovieGetModel.fromJson(jsonResult);
      return movies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

Future<MovieFetchModel> getMovieFromAPI(v) => getMovie(v);
Future<ActorGetModel> getActorAPI(v) => getActor(v);
  Future<MovieFetchModel> getMovie(id) async {
  final url = Uri.parse('${ApiConstants.baseUrl}movie/$id?${ApiConstants.apiKey}&language=$language');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResult = json.decode(response.body);
    return MovieFetchModel.fromJson(jsonResult);
  }
  throw Exception('Failed to fetch trend data');
}

  Future<ActorGetModel> getActor(id) async {
      String language = 'tr';
  final url = Uri.parse('${ApiConstants.baseUrl}movie/$id/credits?${ApiConstants.apiKey}&language=$language');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResult = json.decode(response.body);
    return ActorGetModel.fromJson(jsonResult);
  }
  throw Exception('Failed to fetch trend data');
}

}

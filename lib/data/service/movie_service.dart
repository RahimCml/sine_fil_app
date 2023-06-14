import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sine_fil_app/data/models/movie_fetch_model.dart';
import 'package:sine_fil_app/data/models/movie_trend_model.dart';

import '../data_constants/api_constants.dart';
import '../models/genre_get_model.dart';
import '../models/genre_movie_get_model.dart';

class MovieService {
  Future<dynamic> fetchMovieInfo(String movie) async {
    String searchUrl = 'search/multi?query=';
    Uri url = Uri.parse(
        '${ApiConstants.baseUrl}$searchUrl$movie&${ApiConstants.apiKey}');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      // print(${result});
      return MovieFetchModel.fromJson(result);
    } else {
      throw Exception();
    }
  }

  Future<MovieTrendModel> trendMovieInfo() async {
    final response = await http.get(Uri.parse(
        '${ApiConstants.baseUrl}trending/all/day?${ApiConstants.apiKey}'));

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
        '${ApiConstants.baseUrl}genre/movie/list?${ApiConstants.apiKey}'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResult = json.decode(response.body);
      print('aaaa$response.body');
      return GenresGetModel.fromJson(jsonResult);
    }
    throw Exception('Failed to fetch trend data');
  }

  //better way in order to create
  Future<GenreMovieGetModel> movieInfoFromGenre(v) => movieInfo(v);
  Future<GenreMovieGetModel> movieInfo(id) async {
    String language = 'tr';
    Uri url = Uri.parse(
        '${ApiConstants.baseUrl}discover/movie?${ApiConstants.apiKey}&language=$language&with_genres=$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResult = jsonDecode(response.body);
      GenreMovieGetModel movies = GenreMovieGetModel.fromJson(jsonResult);
      print('abii $movies');
      return movies;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

Future<MovieFetchModel> getMovieFromAPI(v) => getMovie(v);
  Future<MovieFetchModel> getMovie(id) async {
  print('ididididi$id');
      String language = 'tr';
  final url = Uri.parse('${ApiConstants.baseUrl}movie/$id?${ApiConstants.apiKey}&language=$language');

  final response = await http.get(url);
  if (response.statusCode == 200) {
    print('oldu');
    Map<String, dynamic> jsonResult = json.decode(response.body);
    print(jsonResult);
    return MovieFetchModel.fromJson(jsonResult);
  }
  throw Exception('Failed to fetch trend data');
}

}

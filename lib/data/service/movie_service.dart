import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sine_fil_app/data/models/movie_fetch_model.dart';
import 'package:sine_fil_app/data/models/movie_trend_model.dart';

import '../data_constants/api_constants.dart';
import '../models/genre_get_model.dart';

class MovieService {
  Future<dynamic> fetchMovieInfo(String movie) async {
    String searchUrl = 'search/multi?query=';
    Uri url = Uri.parse('${ApiConstants.baseUrl}$searchUrl$movie&${ApiConstants.apiKey}');
        http.Response response = await http.get(url);
            if(response.statusCode == 200) {
      final result = json.decode(response.body);
      // print(${result});
      return MovieFetchModel.fromJson(result);
    } else {
      throw Exception();
    }
  }
Future<MovieTrendModel> trendMovieInfo() async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/all/day?api_key=bca5897ad38bcccecaa6e170c6849b7a'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResult = json.decode(response.body);
    String jsonString = json.encode(jsonResult);
    MovieTrendModel result = trendFromJson(jsonString);
    return result;
  }
  throw Exception('Failed to fetch trend data');
}

Future<GenresGetModel> genresInfo() async {
  final response = await http.get(Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=bca5897ad38bcccecaa6e170c6849b7a'));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResult = json.decode(response.body);
    print('aaaa$response.body');
    return GenresGetModel.fromJson(jsonResult);
  }
  throw Exception('Failed to fetch trend data');
}
}

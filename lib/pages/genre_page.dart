import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sine_fil_app/bloc/genre_bloc/genre_bloc.dart';
import 'package:sine_fil_app/bloc/genre_movie_bloc/genre_movie_bloc_bloc.dart';

import '../bloc/movie_data_bloc/movie_data_bloc_bloc.dart';
import '../constants/color.dart';
import '../global/global_image_url.dart';
import 'movie_page.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ConstantColor.kMainColor,
            title: const Text(
              'SINEFIL',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.lock_outline),
                onPressed: null,
                color: ConstantColor.kMainColor,
              ),
            ]),
        body: BlocBuilder<GenreMovieBloc, GenreMovieState>(
            builder: (context, state) {
          return Container(
            color: ConstantColor.secondarycolor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.movies?.results?.length,
                  itemBuilder: (context, index) {
                    final data = state.movies?.results?[index];
                    DateTime parsedDate = DateTime.parse(data?.releaseDate as String);
                    final year = parsedDate.year.toString();
                    dynamic imageUrl =
                        '${GlobalImage.baseUrl}${GlobalImage.imageSize}${data?.posterPath}';
                    return GestureDetector(
                      onTap: () {
                        context.read<MovieDataBloc>().add(MovieDataEvent(id: data.id));
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const MoviePage();
                    },
                  ));
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                                height: 250, imageUrl: imageUrl),
                          ),
                          SizedBox(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 70),
                              child: Column(
                                children: [
                                  Text(
                                    '${data!.title.toString()} ($year)',
                                    maxLines: 5,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ConstantColor.kMainColor),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    'KONUSU: ${data.overview.toString()}',
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 20,),
                                  //runtime or point from imdb
                                  // Text('$')
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          );
        }));
  }
}

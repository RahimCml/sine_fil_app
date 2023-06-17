import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/genre_movie_bloc/genre_movie_bloc_bloc.dart';
import '../../bloc/movie_data_bloc/movie_data_bloc_bloc.dart';
import '../../global/global_image_url.dart';
import '../movie_page.dart';

class GenresCompannent extends StatefulWidget {
  const GenresCompannent({Key? key}) : super(key: key);

  @override
  _GenresCompannentState createState() => _GenresCompannentState();
}

class _GenresCompannentState extends State<GenresCompannent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreMovieBloc, GenreMovieState>(
      builder: (context, state) {
        final movies = state.movies;
        return SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies?.results?.length,
            itemBuilder: (context, index) {
              final movie = movies?.results?[index];
              String? posterPath = state.movies?.results?[index].posterPath;
              print(posterPath);
              String imageUrl = "${GlobalImage.baseUrl}${GlobalImage.imageSize}$posterPath";
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<MovieDataBloc>().add(MovieDataEvent(id: movie?.id));
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const MoviePage();
                    },
                  ));
                  },
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        height: 150,
                        imageUrl: imageUrl,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 110,height: 30,
                        child: Text(
                          movie?.title ?? '',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

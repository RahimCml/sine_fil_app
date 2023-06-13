import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/genre_movie_bloc/genre_movie_bloc_bloc.dart';
import '../global/global_image_url.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({Key? key}) : super(key: key);

  @override
  _GenresPageState createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreMovieBlocBloc, GenreMovieBlocState>(
      builder: (context, state) {
        final movies = state.movies;
        return SizedBox(
          height: 200,
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 150,height: 30,
                      child: Text(
                        movie?.title ?? '',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

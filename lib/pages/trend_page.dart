import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sine_fil_app/bloc/movie_data_bloc/movie_data_bloc_bloc.dart';
import 'package:sine_fil_app/global/global_image_url.dart';
import 'package:sine_fil_app/pages/movie_page.dart';

import '../bloc/movie_bloc.dart';

class TrendPage extends StatefulWidget {
  const TrendPage({Key? key}) : super(key: key);

  @override
  State<TrendPage> createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return SizedBox(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.trend?.results?.length ?? 0,
            itemBuilder: (context, index) {
              dynamic data = state.trend?.results?[index];
              int? dataIp = state.trend?.results?[index].id;
              String imageUrl =
                  "${GlobalImage.baseUrl}${GlobalImage.imageSize}${data.posterPath}";
              return GestureDetector(
                onTap: () {
                  context.read<MovieDataBloc>().add(MovieDataEvent(id: dataIp));
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const MoviePage();
                    },
                  ));
                },
                child: Container(
                  width: 140,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      Text(
                        state.trend?.results?[index].title ?? '',
                        textAlign: TextAlign.center,
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

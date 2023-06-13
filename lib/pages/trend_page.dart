import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sine_fil_app/global/global_image_url.dart';

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
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.trend?.results?.length ?? 0,
            itemBuilder: (context, index) {
              String? posterPath = state.trend?.results?[index].posterPath;
              String imageUrl = "${GlobalImage.baseUrl}${GlobalImage.imageSize}$posterPath";
              return Container(
                width: 150,
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
                    Text(state.trend?.results?[index].title ?? '', textAlign: TextAlign.center,),
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

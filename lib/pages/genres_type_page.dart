import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/genre_bloc/genre_bloc.dart';
import '../bloc/genre_movie_bloc/genre_movie_bloc_bloc.dart';
import '../constants/color.dart';

class GenresTypePage extends StatefulWidget {
  const GenresTypePage({super.key});

  @override
  State<GenresTypePage> createState() => _GenresTypePageState();
}

class _GenresTypePageState extends State<GenresTypePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        final genres = state.genres?.genres;
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres?.length ?? 0,
          itemBuilder: (context, index) {
            final id = genres?[index].id;
            final genreName = genres?[index].name;
            context.read<GenreMovieBloc>().add(GenreMovieEvent(id: 28));
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    context.read<GenreMovieBloc>().add(GenreMovieEvent(id: id));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        color: ConstantColor.secondarycolor,
                        boxShadow: [
                          BoxShadow(
                            color: ConstantColor.kMainColor,
                            blurRadius: 3,
                          )
                        ]),
                    child: Chip(
                      label: Text(
                        genreName!,
                        style: const TextStyle(color: Color(0xFFFFD255)),
                      ),
                      backgroundColor: const Color(0xFF444A54),
                      padding: const EdgeInsets.only(left: 12, right: 12),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

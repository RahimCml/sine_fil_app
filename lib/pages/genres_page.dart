import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/genre_bloc/genre_bloc.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({super.key});

  @override
  State<GenresPage> createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        final genres = state.genres?.genres;
                    print('abuu ${state.genres?.genres}');
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres?.length ?? 0,
          itemBuilder: (context, index) {
            final genreName = genres?[index].name ?? '';
            print('abuu $genreName');
            return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        label: Text(
          genreName,
          style: const TextStyle(color: Color(0xFFFFD255)),
        ),
        backgroundColor: const Color(0xFF444A54),
        padding: const EdgeInsets.only(left: 12, right: 12),
      ),
    );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sine_fil_app/pages/layout_page.dart';

import 'bloc/genre_bloc/genre_bloc.dart';
import 'bloc/genre_movie_bloc/genre_movie_bloc_bloc.dart';
import 'bloc/movie_bloc.dart';
import 'bloc/movie_data_bloc/movie_data_bloc_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(),
        ),
        BlocProvider(
          create: (context) => GenreBloc(),
        ),
        BlocProvider(create: (context) => GenreMovieBloc()),
        BlocProvider(create: (context) => MovieDataBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LayoutPage(),
      ),
    );
  }
}

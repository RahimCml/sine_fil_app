import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sine_fil_app/bloc/genre_bloc/genre_bloc.dart';
import 'package:sine_fil_app/bloc/genre_movie_bloc/genre_movie_bloc_bloc.dart';
import 'package:sine_fil_app/bloc/movie_data_bloc/movie_data_bloc_bloc.dart';
import 'package:sine_fil_app/data/models/movie_fetch_model.dart';
import 'package:sine_fil_app/pages/genre_page.dart';

import '../constants/color.dart';
import '../global/global_image_url.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDataBloc, MovieDataState>(
      builder: (context, state) {
        MovieFetchModel? data = state.data;
        dynamic imgUrl =
            '${GlobalImage.baseUrl}${GlobalImage.imageSize}${data?.posterPath}';
        Size size = MediaQuery.of(context).size;
        if (data == null) {
          return Scaffold(
            backgroundColor: ConstantColor.secondarycolor,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: ConstantColor.secondarycolor,
          body: Column(
            children: [
              SizedBox(
                height: size.height / 2,
                child: Stack(children: [
                  Container(
                      height: size.height / 2,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        image: DecorationImage(
                          image: NetworkImage(imgUrl),
                          fit: BoxFit.cover,
                        ),
                      )),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                    child: Text(
                  data.title.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: SizedBox(
                            height: 60,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.genres?.length,
                              itemBuilder: (context, index) {
                                Genres? genresData = data.genres?[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 20, top: 8, bottom: 18),
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<GenreMovieBloc>()
                                          .add(GenreMovieEvent(id: genresData.id));
                                      Navigator.push(context,
                                          MaterialPageRoute<void>(
                                        builder: (BuildContext context) {
                                          return const GenrePage();
                                        },
                                      ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          color: ConstantColor.secondarycolor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: ConstantColor.kMainColor,
                                              blurRadius: 3,
                                            )
                                          ]),
                                      child: Chip(
                                        label: Text(
                                          genresData!.name.toString(),
                                          style: const TextStyle(
                                              color: Color(0xFFFFD255)),
                                        ),
                                        backgroundColor:
                                            const Color(0xFF444A54),
                                        padding: const EdgeInsets.only(
                                            left: 12, right: 12),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              data.overview.toString(),
                              overflow: TextOverflow.clip,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 18, left: 8, bottom: 18, top: 18),
                    child: Container(
                        width: size.width / 4,
                        height: 300,
                        decoration: BoxDecoration(
                            color: ConstantColor.kMainColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ConstantColor.kMainColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ConstantColor.secondarycolor
                                          .withOpacity(0.3),
                                      blurRadius: 5,
                                    )
                                  ],
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Center(
                                  child: Text(
                                '${data.runtime.toString()} dk.',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800),
                              )),
                            ),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: ConstantColor.kMainColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: ConstantColor.secondarycolor
                                        .withOpacity(0.3),
                                    blurRadius: 5,
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //add star in order to give star for this movie
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.star),
                                      Icon(Icons.star),
                                      Icon(Icons.star),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.star_border),
                                      Icon(Icons.star_border),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ConstantColor.kMainColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ConstantColor.secondarycolor
                                          .withOpacity(0.3),
                                      blurRadius: 5,
                                    )
                                  ],
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                              child: Center(
                                  child: Text(
                                data.releaseDate.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              )),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

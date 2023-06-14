import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sine_fil_app/bloc/movie_data_bloc/movie_data_bloc_bloc.dart';

import '../constants/color.dart';
import '../global/global_image_url.dart';
import 'drawer_page.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDataBloc, MovieDataState>(
      builder: (context, state) {
        print('ne diyonn ${state.data}');
        String? dataTitle = state.data?.title;
        String? dataInfo = state.data?.overview;
        dynamic imgUrl =
            '${GlobalImage.baseUrl}${GlobalImage.imageSize}${state.data?.posterPath}';
        Size size = MediaQuery.of(context).size;
        return Scaffold(
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
                child: Center(child: Text(dataTitle.toString(), style: const TextStyle(fontWeight: FontWeight.bold),)),
              ),
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          dataInfo.toString(),
                          overflow: TextOverflow.clip,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                    width: size.width / 4,
                    height: 300,
                    decoration: const BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: const Center(child: Text('imdb ve ya yildizla doldurun'))),
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

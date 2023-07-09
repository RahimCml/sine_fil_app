import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sine_fil_app/constants/color.dart';

import '../../bloc/movie_data_bloc/movie_data_bloc_bloc.dart';
import '../../global/global_image_url.dart';

class ActorComponent extends StatefulWidget {
  const ActorComponent({super.key});

  @override
  State<ActorComponent> createState() => _ActorComponentState();
}

class _ActorComponentState extends State<ActorComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDataBloc, MovieDataState>(
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.actorData?.cast?.length,
          itemBuilder: (context, index) {
            dynamic data = state.actorData?.cast?[index];
            dynamic imageUrl =
                '${GlobalImage.baseUrl}${GlobalImage.imageSize}${data?.profilePath}';
            return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(data.name, style: TextStyle(fontWeight: FontWeight.bold, color: ConstantColor.kTextColor),),
                  ],
                ));
          },
        );
      },
    );
  }
}

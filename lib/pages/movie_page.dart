import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: Container( color: Colors.black, height: 160, width: 140,),
          ),
          const SizedBox(height: 5,),
          const Text('Name'),
          const SizedBox(height: 5,)

        ],
      ),
    );
  }
}
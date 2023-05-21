import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/color.dart';

class MovieCompanent extends StatelessWidget {
  const MovieCompanent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: Container(
              color: ConstantColor.secondarycolor,
              height: 160,
              width: 140,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text('Name'),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarConstant.appBar(context),
      body: Column(
        children: [
          //films list
          Row()
        ],
      ),
    );
  }
}

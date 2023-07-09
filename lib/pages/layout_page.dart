import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/color.dart';

import 'drawer_page.dart';
import 'home_page.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  final Duration duration = const Duration(milliseconds: 300);

@override
  void initState() {
    _controller = AnimationController(duration: duration, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.kTextColor,
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(children: [
            DrawerPage(controller: _controller,),
            HomePage(controller: _controller, duration: duration,)
        ],),
      ),
    );
  }
}
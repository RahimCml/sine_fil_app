import 'package:flutter/material.dart';

import 'drawer_page.dart';
import 'home_page.dart';

class LayoutPage extends StatefulWidget {
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
      body: Stack(children: [
          DrawerPage(controller: _controller,),
          HomePage(controller: _controller, duration: duration,)
      ],),
    );
  }
}
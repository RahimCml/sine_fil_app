import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/color.dart';

import '../items/menu_item.dart';

class DrawerPage extends StatefulWidget {
  final AnimationController controller;

  const DrawerPage({Key? key, required this.controller}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Animation<double>? _scaleAnimation;
  Animation<Offset>? _slideAnimation;

  @override
  Widget build(BuildContext context) {
    _scaleAnimation ??= Tween<double>(begin: 0.6, end: 1).animate(widget.controller);
    _slideAnimation ??= Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
          .animate(widget.controller);
    return SlideTransition( 
      position: _slideAnimation!,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Container(
          color: ConstantColor.secondarycolor,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            const SizedBox(height: 50),
            Row(children: const [
              CircleAvatar(
                backgroundColor: Color(0xFFFFD255),
              ),
              SizedBox(width: 16),
              Expanded(
                  child: Text('Coding Tricks',
                      style: TextStyle(
                          color:  Color(0xFFFFD255),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)))
            ]),
            const SizedBox(height: 30),
            const MenuItem(title: 'Home', icon: Icons.home),
            const MenuItem(title: 'My Account', icon: Icons.person),
            const MenuItem(title: 'Wishlist', icon: Icons.list),
            const MenuItem(
              title: 'Settings',
              icon: Icons.settings,
            ),
            const MenuItem(title: 'Logout', icon: Icons.exit_to_app)
          ]),
        ),
      ),
    );
  }
}

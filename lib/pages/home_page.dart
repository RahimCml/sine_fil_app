import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/color.dart';

class HomePage extends StatefulWidget {
  final AnimationController controller;
  final Duration duration;

  const HomePage({Key? key, required this.controller, required this.duration})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool menuOpen = false;
    late Animation<double> _scaleAnimation;

  @override
  void initState() {
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(widget.controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(_scaleAnimation);
    print(menuOpen);
    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 30,
      left: menuOpen ? 0.2 * size.width : 0,
      right: menuOpen ? -0.4 * size.width : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
              color:ConstantColor.kMainColor, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                color: ConstantColor.kMainColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    !menuOpen
                        ? IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {
                              setState(() {
                                widget.controller.forward();
                                menuOpen = true;
                              });
                            },
                            color: Colors.white,
                          )
                        : IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              setState(() {
                                widget.controller.reverse();
                                menuOpen = false;
                              });
                            },
                            color: Colors.white,
                          ),
                          const Text('SINEFIL', style: TextStyle( fontSize: 20, color: Colors.black),),
                    IconButton(
                      icon: const Icon(Icons.lock_outline),
                      onPressed: null,
                      color: ConstantColor.kMainColor,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

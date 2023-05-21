import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/color.dart';
import 'package:sine_fil_app/pages/companents/category_component.dart';
import 'package:sine_fil_app/pages/companents/movie_companent.dart';

import '../delegates/custom_search_delegate.dart';

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
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0.6).animate(widget.controller);
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
              color: ConstantColor.kMainColor,
              borderRadius: BorderRadius.circular(30)),
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
                    const Text(
                      'SINEFIL',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.lock_outline),
                      onPressed: null,
                      color: ConstantColor.kMainColor,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                      color: ConstantColor.kMainColor,
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[100],
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                onPressed: () {
                                  showSearch(
                                    context: context,
                                    delegate: CustomSearchDelegate(),
                                  );
                                },
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 340),
                                  child: Icon(Icons.search),
                                ),
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 28),
                        child: Text('VİZYONDAKİLER'),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: SizedBox(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              MovieCompanent(),
                              MovieCompanent(),
                              MovieCompanent(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              CategoryComponent(
                                  categoryName: 'Akran zorbalığı'),
                              CategoryComponent(
                                  categoryName: 'Birinci dünya savaşı'),
                              CategoryComponent(
                                  categoryName: 'Sanal gerçeklik'),
                              CategoryComponent(categoryName: 'Ejderha'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
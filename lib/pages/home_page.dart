import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/color.dart';
import 'package:sine_fil_app/pages/companents/genre_companent.dart';
import 'package:sine_fil_app/pages/genres_type_page.dart';
import 'package:sine_fil_app/pages/trend_page.dart';

import '../data/service/movie_service.dart';
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
  final MovieService _movieService = MovieService();

  @override
  void initState() {
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0.6).animate(widget.controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 0,
      left: menuOpen ? 0.2 * size.width : 0,
      right: menuOpen ? -0.4 * size.width : 0,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
              color: ConstantColor.secondarycolor,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Container(
                color: ConstantColor.kMainColor,
                height: 60,
                width: double.infinity,
              ),
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
                      decoration:BoxDecoration(
                          color: ConstantColor.kMainColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16))
                              ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
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
                                flex: 1,
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
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 28),
                        child: Text('VİZYONDAKİLER'),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Expanded(flex: 1, child: TrendPage()),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: GenresTypePage()),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 16, right: 20),
                            child: SizedBox(height: 200, child: GenresCompannent()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'YORUMLAR',
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      bottom: 20,
                                    ),
                                    dragStartBehavior:
                                        DragStartBehavior.start,
                                    itemCount: 3,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: const [
                                              Align(
                                                alignment:
                                                    Alignment.bottomLeft,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xFF444A54),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text('Yorumlar...'),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

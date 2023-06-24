import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sine_fil_app/constants/color.dart';
import 'package:sine_fil_app/pages/companents/genre_companent.dart';
import 'package:sine_fil_app/pages/genres_type_page.dart';
import 'package:sine_fil_app/pages/log_in_page.dart';
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
                            icon: Icon(Icons.menu, color: ConstantColor.secondarycolor,),
                            onPressed: () {
                              setState(() {
                                widget.controller.forward();
                                menuOpen = true;
                              });
                            },
                            color: Colors.red,
                          )
                        : IconButton(
                            icon: const Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              setState(() {
                                widget.controller.reverse();
                                menuOpen = false;
                              });
                            },
                            color: ConstantColor.secondarycolor
                          ),
                    Text(
                      'SINEFIL',
                      style: TextStyle(fontSize: 20, color: ConstantColor.secondarycolor),
                    ),
                    IconButton(
                      icon: Icon(Icons.lock_outline, color: ConstantColor.secondarycolor,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                          return const LoginPage();
                        }));
                      },
                      color: ConstantColor.kMainColor,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: ConstantColor.kMainColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16))),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
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
                                  color: ConstantColor.secondarycolor,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 14),
                        child: Text('VİZYONDAKİLER', style: TextStyle(fontSize: 18,color: ConstantColor.kMainColor),),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Expanded(flex: 1, child: TrendPage()),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                            child: SizedBox(
                                height: 200, child: GenresCompannent()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'YORUMLAR', style: TextStyle(color: ConstantColor.kMainColor),
                                  ),
                                ),
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      bottom: 20,
                                    ),
                                    dragStartBehavior: DragStartBehavior.start,
                                    itemCount: 3,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Align(
                                                alignment: Alignment.bottomLeft,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xFF444A54),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text('Yorumlar...', style: TextStyle(color: ConstantColor.kMainColor),),
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

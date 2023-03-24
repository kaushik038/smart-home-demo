import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          SizedBox(height: 120),
          CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.69,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false),
              items: [
                Card(
                  margin: EdgeInsets.only(bottom: 30, top: 10),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  elevation: 10,
                  shadowColor: Colors.blue,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/water-pump.png",
                          width: 200,
                          height: 250,
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: (() async {}),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(300.0),
                            child: Image.asset("assets/images/off.png",
                                width: 150, height: 150),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.only(bottom: 30, top: 10),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  elevation: 10,
                  shadowColor: Colors.blue,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/light-bulb.png",
                          width: 250,
                          height: 250,
                          color:  Colors.black,
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                          onTap: (() async {}),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(300.0),
                            child: Image.asset("assets/images/off.png",
                                width: 150, height: 150),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ]),
        ],
      ),
    ));
  }
}

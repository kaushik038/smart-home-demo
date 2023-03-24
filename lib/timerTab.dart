import 'dart:convert';

import 'package:analog_clock_picker/analog_clock_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({super.key});

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedules"),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: ListView(
              children: [
                1,
                2,
                3,
                4,
              ].map((document) {
                List? days = [];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Stack(
                      children: [
                        ListTile(
                          title: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Trun on light",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("09:55 PM",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (() {}),
                                      child: Icon(Icons.toggle_on,
                                          size: 40, color: Colors.blue),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("ON",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  child: Flexible(
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        "sun",
                                        "mon",
                                        "wen",
                                        "thu",
                                        "fir"
                                      ].map((e) {
                                        return Container(
                                          height: 30,
                                          width: 30,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2, color: Colors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Center(
                                            child: Text(
                                              "$e",
                                              style: const TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      )),
    );
  }
}

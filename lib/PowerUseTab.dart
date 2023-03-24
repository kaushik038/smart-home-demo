import 'dart:convert';

import 'package:analog_clock_picker/analog_clock_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class PowerUseTab extends StatefulWidget {
  const PowerUseTab({super.key});

  @override
  State<PowerUseTab> createState() => _PowerUseTabState();
}

class _PowerUseTabState extends State<PowerUseTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Power usage"),
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
               
              ].map((document) {
                List? days = [];

                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    // padding: EdgeInsets.symmetric(vertical: 10),
                    child: Stack(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Energy usage",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "March, 2023",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                color: Colors.blue[50],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
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
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Text(
                                      "60%",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.blue[50],
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Icon(Icons.cable,
                                              size: 30, color: Colors.blue),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            Text("Monthly",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500)),
                                                    Text("296,81 kWh",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w700)),
                                          ],
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      child: Container(
                                         height: 40,
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        child: Center(child: Text("Details",style: TextStyle(
                                          color:Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        ),)),
                                        ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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

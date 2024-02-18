import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/controller/ServerControler.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverCards_screem.dart';

import '../../consts/global_varibels.dart';
import '../OrderUser/Cards_screem.dart';
import 'DriverDelivaryCards.dart';

class AirConditingAndFuelType extends StatefulWidget {
  const AirConditingAndFuelType({super.key});

  @override
  State<AirConditingAndFuelType> createState() =>
      _AirConditingAndFuelTypeState();
}

class _AirConditingAndFuelTypeState extends State<AirConditingAndFuelType> {
  bool airConController = false;
  bool gaz = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Охирги иш",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Сизда кондиционер борми?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE8E8E8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: airConController,
                            checkColor: cwhiteColor,
                            activeColor: cconfirmedColor,
                            onChanged: (val) {
                              setState(() {
                                airConController = true;
                              });
                            },
                          ),
                          Text('Бор'),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: !airConController,
                            checkColor: cwhiteColor,
                            activeColor: cconfirmedColor,
                            onChanged: (val) {
                              setState(() {
                                airConController = false;
                              });
                            },
                          ),
                          Text('Йўқ'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Сизда газми ёки бензинми?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffE8E8E8),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: gaz,
                            checkColor: cwhiteColor,
                            activeColor: cconfirmedColor,
                            onChanged: (val) {
                              setState(() {
                                gaz = true;
                              });
                            },
                          ),
                          Text('Газ'),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: !gaz,
                            checkColor: cwhiteColor,
                            activeColor: cconfirmedColor,
                            onChanged: (val) {
                              setState(() {
                                gaz = false;
                              });
                            },
                          ),
                          Text('Бензин'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: button(
                    text: "Кейингиси",
                    color: caccentColor,
                    onPressed: () async {
                      await LocalMemory.saveDataString(
                          "fuelType", gaz ? "gaz" : "oil");
                      await LocalMemory.saveDataString(
                          "airCond", airConController ? "true" : "false");
                      Get.defaultDialog(
                        title: "",
                        content: alert(
                          text1: 'Сафар фаоллаштирилди!',
                          text2:
                              'Сизнинг сафарингиз умумий саҳифага қўшилди, йўловчиларнинг қўнғироқларини кутинг ва сафат ҳолатини кузатиб боринг',
                          imageName: 'images/ptichka.svg',
                          buttonTExt: 'Сафарингиз ҳолатини кузатиш',
                          onClick: () {
                            ServerController.sendingOrder();
                            LocalMemory.saveDataString(
                                "doesDriverHaveOrder", "true");
                            if (LocalMemory.getValue("didGoToCards") ==
                                "true") {
                              if (LocalMemory.getValue("driverSeorchs") ==
                                  "passengers") {
                                Map<String, dynamic> tempData = jsonDecode(
                                    LocalMemory.getValue("passengerOrderInfo"));
                                Map<String, String> data = tempData.map(
                                    (key, value) =>
                                        MapEntry(key, value.toString()));
                                Get.offAll(DriverCards(), arguments: data);
                              } else {
                                Map<String, dynamic> tempData = jsonDecode(
                                    LocalMemory.getValue("delivaryOrderInfo"));
                                Map<String, String> data = tempData.map(
                                    (key, value) =>
                                        MapEntry(key, value.toString()));
                                Get.offAll(DriverDelivaryCard(),
                                    arguments: data);
                              }
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

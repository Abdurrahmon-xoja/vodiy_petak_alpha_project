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
      appBar: cDefoltAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Последний шаг",
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
                "У вас есть кондиционер ? ",
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
                          Text('ЕСТЬ'),
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
                          Text('НЕТ'),
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
                "У вас газ или бензин?",
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
                          Text('ГАЗ'),
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
                          Text('БЕНЗИН'),
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
                    text: "Далее",
                    color: caccentColor,
                    onPressed: () async {
                      await LocalMemory.saveDataString(
                          "fuelType", gaz ? "gaz" : "oil");
                      await LocalMemory.saveDataString(
                          "airCond", airConController ? "true" : "false");
                      Get.defaultDialog(
                        title: "",
                        content: alert(
                          text1: 'активирована',
                          text2:
                              'Ваша поездка добавилась в общую страницу, ждите звонков пассажиров и следите за статусом поездки ',
                          imageName: 'images/ptichka.svg',
                          buttonTExt: 'Отследить статус вашей поездки',
                          onClick: () {
                            // Get.to(DriverCards());
                            // here I need to send to server
                            // chack and send order for passanger and delivary
                            ServerController.sendingOrder();
                            // isOrderStartes = true;
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriversTrips.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/driverOrPassenger_screen.dart';

import '../../consts/castem_widgets_const.dart';
import '../../consts/colors_const.dart';
import '../DriverScreens/DriverCards_screem.dart';
import '../DriverScreens/DriverDelivaryCards.dart';
import 'client_edit_screen.dart';
import 'driver_edit_screen.dart';

class DriverAccount extends StatefulWidget {
  const DriverAccount({super.key});

  @override
  State<DriverAccount> createState() => _DriverAccountState();
}

class _DriverAccountState extends State<DriverAccount> {
  int _currentIndex = 2;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.directions_car_filled),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffD0D0D0),
                  ),
                  child: Center(
                    child: Icon(Icons.photo_camera),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  LocalMemory.getValue("name"),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: cclueColor,
                        ),
                        Text(
                          LocalMemory.getValue("rating") == "0"
                              ? " "
                              : LocalMemory.getValue("rating"),
                          style: TextStyle(
                            fontSize: 14,
                            color: cclueColor,
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(DriverAccountEdit());
                          },
                          icon: Icon(
                            Icons.edit_note,
                            color: cclueColor,
                          ),
                        ),
                        Text(
                          "Профилни таҳрирлаш",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffB8B8B8),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Телефон рақами",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: caccentBackingColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        LocalMemory.getValue("phoneNumber"),
                        style: TextStyle(
                          color: caccentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: cclueColor,
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Автомобил модели",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: caccentBackingColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        LocalMemory.getValue("carModel"),
                        style: TextStyle(
                          color: caccentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: cclueColor,
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Автомобил рақами",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: caccentBackingColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        LocalMemory.getValue("carNumber"),
                        style: TextStyle(
                          color: caccentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: cclueColor,
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Автомобил ранги",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        )),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: caccentBackingColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        LocalMemory.getValue("carColor"),
                        style: TextStyle(
                          color: caccentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: cclueColor,
                ),
                SizedBox(
                  height: 70,
                ),
                button(
                    text: "💺 Йўловчига айланинг",
                    color: caccentColor,
                    onPressed: () {
                      LocalMemory.clearAll();
                      Get.to(DriverOrPassenger());
                    }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: cmenuBackgroundColor,
        selectedItemColor: caccentColor,
        unselectedItemColor: cclueColor,
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          // here we can chechc a in withe screen we should navigate
          setState(() {
            _currentIndex = newIndex;
            if (newIndex == 0) {
              if (LocalMemory.getValue("didGoToCards") == "true") {
                if (LocalMemory.getValue("driverSeorchs") == "passengers") {
                  Map<String, dynamic> tempData =
                      jsonDecode(LocalMemory.getValue("passengerOrderInfo"));
                  Map<String, String> data = tempData
                      .map((key, value) => MapEntry(key, value.toString()));
                  Get.to(DriverCards(), arguments: data);
                } else {
                  Map<String, dynamic> tempData =
                      jsonDecode(LocalMemory.getValue("delivaryOrderInfo"));
                  Map<String, String> data = tempData
                      .map((key, value) => MapEntry(key, value.toString()));
                  Get.to(DriverDelivaryCard(), arguments: data);
                }
              } else {
                Get.to(ChoosePlace());
              }
            } else if (newIndex == 1) {
              Get.to(DriversTrips());
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Асосий",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Сафарлар",
            icon: Icon(Icons.directions_car_filled),
          ),
          BottomNavigationBarItem(
            label: "Кабинет",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

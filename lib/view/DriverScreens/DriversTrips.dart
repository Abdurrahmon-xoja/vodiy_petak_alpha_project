import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

import '../../consts/global_varibels.dart';
import '../../controller/LocalMemory.dart';
import '../OrderUser/ChoosePlace_screen.dart';
import '../ProfailScreens/driver_screen.dart';
import 'DriverCards_screem.dart';
import 'DriverDelivaryCards.dart';
import '../../Server/Api.dart';

class DriversTrips extends StatefulWidget {
  DriversTrips({super.key});

  @override
  State<DriversTrips> createState() => _DriversTripsState();
}

class _DriversTripsState extends State<DriversTrips> {
  late Future<List> _renderInformation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _renderInformation =
        Api.getDriveroOdesrs(LocalMemory.getValue("phoneNumber"));
  }

  int _currentIndex = 1;

  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.directions_car_filled),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Сафарлар тарихи",
                      style: TextStyle(
                        fontSize: 24,
                        color: cdarkTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                  future: _renderInformation,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.red)),
                        ),
                      );
                    } else {
                      if (snapshot.data.length == 0) {
                        return Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35,
                              ),
                              const Text(
                                "Сизда ҳали ҳеч қандай сафар йўқ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff262626),
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              SvgPicture.asset("images/transperentCar.svg"),
                              SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Барча саёҳатларингиз шу ерда сақланади",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff898989)),
                              ),
                            ],
                          ),
                        );
                      } else {
                        List data = snapshot.data;
                        print(data[0]["passengersNumber"]);
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['date'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: cdarkTextColor),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: cinputColor,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    "Саёҳат ҳақида:",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: cdarkTextColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SvgPicture.asset(
                                                'images/car.svg',
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Йўловчилар",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: cdarkTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Column(
                                                children: passangers(data[index]
                                                    ["passengersNumber"]),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Даставки",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: cdarkTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Column(
                                                children: delivarys(data[index]
                                                    ["delivaryNumbers"]),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: 'Қаердан:  ',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: cdarkTextColor,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: data[index]['from'],
                                                  style: TextStyle(
                                                      color: cdarkTextColor,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "Қаерга: ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: cdarkTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: data[index]['to'],
                                                    style: TextStyle(
                                                        color: cdarkTextColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                  )
                                                ]),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }
                    }
                  }),
            ],
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
            } else if (newIndex == 2) {
              Get.to(DriverAccount());
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

  List<Widget> passangers(List data) {
    if (data.length == 0) {
      return [
        Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          child: Text("йўловчилар олинмаган"),
        ),
      ];
    }
    List<Widget> result = List.generate(
        data.length,
        (index) => Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: caccentBackingColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                data[index]['phoneNumber'],
                style: TextStyle(
                  color: caccentColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ));

    return result;
  }

  List<Widget> delivarys(List data) {
    if (data.length == 0) {
      return [
        Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          child: Text("етказма олинмаган"),
        ),
      ];
    }

    List<Widget> result = List.generate(
        data.length,
        (index) => Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: caccentBackingColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("jonatuvchi: "),
                      Text(
                        data[index]['giverPhone'],
                        style: TextStyle(
                          color: caccentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text("oluchi: "),
                      Text(
                        data[index]['takerPhone'],
                        style: TextStyle(
                          color: caccentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ));

    return result;
  }
}

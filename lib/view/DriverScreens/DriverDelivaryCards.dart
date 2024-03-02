import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverCards_screem.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriversTrips.dart';

import '../../Server/Api.dart';
import '../../consts/colors_const.dart';
import '../../consts/filtering_const.dart';
import '../../consts/global_varibels.dart';
import '../../consts/methods_const.dart';
import '../../controller/LocalMemory.dart';
import '../../models/OrderDeliveryInfo.dart';
import '../OrderUser/BottomSliderDelivary.dart';
import '../OrderUser/Cards_screem.dart';
import '../OrderUser/ChoosePlace_screen.dart';
import '../OrderUser/mytrips_screen.dart';
import '../ProfailScreens/driver_screen.dart';
import 'DriverOrderScreen.dart';
import 'DriverTakesFrom_screen.dart';

class DriverDelivaryCard extends StatefulWidget {
  const DriverDelivaryCard({super.key});

  @override
  State<DriverDelivaryCard> createState() => _DriverDelivaryCardState();
}

class _DriverDelivaryCardState extends State<DriverDelivaryCard> {
  late Map<String, String> dataOfRendering;
  late Future<List<OrderDeliveryInfo>> _someInfo;
  late String from;
  late String to;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataOfRendering = Get.arguments;
    _someInfo = Api.getOrderDelivary(dataOfRendering);
  }

  Future<List<OrderDeliveryInfo>> getData(Map data) async {
    return Api.getOrderDelivary(data);
  }

  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.directions_car_filled),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    from = placesOrder.indexOf(dataOfRendering['from']!) < 11
        ? "Ташкент"
        : "Андижон";
    to = placesOrder.indexOf(dataOfRendering['to']!) < 11
        ? "Ташкент"
        : "Андижон";
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: cinputColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(ChoosePlace());
                                doesUserWentToCardScreen = false;
                              },
                              child: Container(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 24.0,
                                  color: cworkingHintColor,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$from → $to",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: cworkingHintColor,
                                  ),
                                ),
                                Text(
                                  dataOfRendering['date']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: cclueColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              // isScrollControlled: true,
                              context: context,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return BottomSliderDelivary(
                                  getVale: (val) {
                                    // some kind of api request
                                    setState(() {
                                      _someInfo = Api.getFilterForDelivary(val);
                                    });
                                  },
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color(0xffE2E2E2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Фильтры",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: cdarkTextColor,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.tune,
                              color: cclueColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                  future: _someInfo,
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
                      List<OrderDeliveryInfo> data = snapshot.data;
                      if (data.length == 0 &&
                          LocalMemory.getValue("order_willTakePassenger") ==
                              "true" &&
                          LocalMemory.getValue("doesDriverHaveOrder") ==
                              "true" &&
                          LocalMemory.getValue("order_takesDelivary") ==
                              "true") {
                        return Column(
                          children: [
                            cDriverOrderPassanger(),
                            SizedBox(
                              height: 10,
                            ),
                            cDriverOrderPassanger(),
                          ],
                        );
                      } else if (data.length == 0 &&
                          LocalMemory.getValue("order_willTakePassenger") ==
                              "true" &&
                          LocalMemory.getValue("doesDriverHaveOrder") ==
                              "true") {
                        return cDriverOrderPassanger();
                      } else if (data.length == 0 &&
                          LocalMemory.getValue("order_takesDelivary") ==
                              "true" &&
                          LocalMemory.getValue("doesDriverHaveOrder") ==
                              "true") {
                        return cDriverOrderDelivary();
                      } else if (data.length == 0) {
                        return Expanded(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 35,
                                  ),
                                  const Text(
                                    "Сиз қидираётган машина йўқ",
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
                                    "қайта уриниб кўринг",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff898989)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Expanded(
                            child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0 &&
                                LocalMemory.getValue(
                                        "order_willTakePassenger") ==
                                    "true" &&
                                LocalMemory.getValue("doesDriverHaveOrder") ==
                                    "true" &&
                                LocalMemory.getValue("order_takesDelivary") ==
                                    "true") {
                              return Column(
                                children: [
                                  cDriverOrderPassanger(),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  cDriverOrderDelivary(),
                                ],
                              );
                            } else if (index == 0 &&
                                LocalMemory.getValue(
                                        "order_willTakePassenger") ==
                                    "true" &&
                                LocalMemory.getValue("doesDriverHaveOrder") ==
                                    "true") {
                              return cDriverOrderPassanger();
                            } else if (index == 0 &&
                                LocalMemory.getValue("order_takesDelivary") ==
                                    "true" &&
                                LocalMemory.getValue("doesDriverHaveOrder") ==
                                    "true") {
                              return cDriverOrderDelivary();
                            }
                            return Container(
                              margin: EdgeInsets.only(bottom: 16),
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: cinputColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${data[index].carColor} ${data[index].carModel}",
                                                    style: TextStyle(
                                                      color: Color(0xFF262626),
                                                      fontSize: 16,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    data[index].carNumber,
                                                    style: TextStyle(
                                                      color: Color(0xFF262626),
                                                      fontSize: 16,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ]),
                                            SvgPicture.asset(
                                              'images/car.svg',
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${NumberFormat('###,###', 'en_US').format(int.parse(data[index].priceLowest)).replaceAll(",", " ")} сўмдан бошлаб",
                                              style: TextStyle(
                                                color: Color(0xFF2A2A2A),
                                                fontSize: 20,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Манзил: ${data[index].to} (${data[index].time})",
                                              style: TextStyle(
                                                color: Color(0xFF2A2A2A),
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  padding: EdgeInsets.all(15.0),
                                                  textStyle:
                                                      TextStyle(fontSize: 16),
                                                  side: BorderSide(
                                                    color: caccentColor,
                                                    width: 1,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: Text(
                                                  data[index].phoneNumber,
                                                  style: TextStyle(
                                                      color: caccentColor),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ));
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        // padding: EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 18,
        decoration: BoxDecoration(
            color: caccentColor, borderRadius: BorderRadius.circular(16.0)),
        child: FloatingActionButton(
          onPressed: () {
            if (LocalMemory.getValue("doesDriverHaveOrder") == "true" ||
                LocalMemory.getValue("doesDriverHaveOrder") == "") {
              Get.to(() => DriverOrderScreen());
            } else {
              // screen of order
              Get.to(DriverTakesFrom());
            }

            // Add your button onPressed logic here
          },
          child: Text(
            textAlign: TextAlign.center,
            LocalMemory.getValue("doesDriverHaveOrder") == "true"
                ? "Следить за статусом своей поездки"
                : "Начать свою поездку",
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
          ),
          backgroundColor: caccentColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          tooltip: 'Start Trip',
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
            if (newIndex == 1) {
              Get.to(DriversTrips());
            } else if (newIndex == 2) {
              //will go driver account
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
}

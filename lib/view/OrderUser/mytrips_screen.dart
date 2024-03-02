import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/ProfailScreens/client_screen.dart';

import '../../Server/Api.dart';
import '../../consts/global_varibels.dart';
import '../../controller/LocalMemory.dart';
import 'Cards_screem.dart';
import 'ChoosePlace_screen.dart';

class MyTrips extends StatefulWidget {
  MyTrips({super.key});

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  late Future<List> _renderInformation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _renderInformation = Api.getUserOrders(LocalMemory.getValue("phoneNumber"));
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
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]["date"],
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
                                      padding: const EdgeInsets.symmetric(
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
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Cоат ${data[index]['time']}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: cdarkTextColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
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
                                          Text(
                                            "${data[index]['carColor']} ${data[index]['carModel']}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: cworkingHintColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            data[index]['carNumber'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: cworkingHintColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Ҳайдовчи",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: cdarkTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                  color: caccentBackingColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Text(
                                                  data[index]['driverPhone'],
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
                                            height: 7.0,
                                          ),
                                          Text(
                                            data[index]['name'],
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: cworkingHintColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: '📍 Қаердан:',
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
                                                TextSpan(
                                                  text: '',
                                                  style: TextStyle(
                                                    color: cdarkTextColor,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                text: "📍 Қаерга:",
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
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }
                    }
                  })
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
                //some
                Get.to(ChoosePlace());
              } else {
                //go cards choose
                Get.to(ChoosePlace());
              }
            } else if (newIndex == 2) {
              Get.to(ClientAccount());
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

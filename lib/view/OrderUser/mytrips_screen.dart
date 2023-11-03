import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

import '../../consts/global_varibels.dart';
import 'Cards_screem.dart';
import 'ChoosePlace_screen.dart';

class MyTrips extends StatefulWidget {
  MyTrips({super.key});

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
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
              SizedBox(
                height: 16.0,
              ),
              Text(
                "История поездок",
                style: TextStyle(
                  fontSize: 24,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    // exaple of one card
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "08.10.23",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: cdarkTextColor),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10),
                          decoration: BoxDecoration(
                            color: cinputColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1 октября, в 18:00",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: cdarkTextColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "О поездке:",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: cdarkTextColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    'images/car.svg',
                                  ),
                                ],
                              ),
                              Text(
                                "Белый Chevrolet Cobalt",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: cworkingHintColor,
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "01V743JB",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: cworkingHintColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Водитель",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: cdarkTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: caccentBackingColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      "+998 99 999 99 99",
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
                                "Омонова Ирода",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: cworkingHintColor,
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: 'Адрес отправки:',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: cdarkTextColor,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Ташкент, Сергели ипподром',
                                      style: TextStyle(
                                          color: cdarkTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    TextSpan(
                                      text: ' (18:00)',
                                      style: TextStyle(
                                        color: cdarkTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              RichText(
                                text: const TextSpan(
                                    text: "Прибытие:",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: cdarkTextColor,
                                        fontWeight: FontWeight.bold),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Андижан, Пятак5",
                                        style: TextStyle(
                                            color: cdarkTextColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 35,
                          ),
                          const Text(
                            "У вас еще нет поездок",
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
                            "Все ваши поездки будут сохранены тут",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff898989)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
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
            if (newIndex == 1) {
              Get.to(MyTrips());
            } else if (newIndex == 0) {
              if (doesUserWentToCardScreen == false) {
                Get.to(ChoosePlace());
              } else {
                Get.to(Cards());
              }
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Главная",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Мои поездки",
            icon: Icon(Icons.directions_car_filled),
          ),
          BottomNavigationBarItem(
            label: "Профиль",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

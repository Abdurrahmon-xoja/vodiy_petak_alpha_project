import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverTakesFrom_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/BottomSliderPriceAndTime.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/mytrips_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/PassengerOrderInfo_screen.dart';

import '../../consts/filtering_const.dart';
import '../../consts/global_varibels.dart';
import '../OrderUser/BottomSliderAuto.dart';
// import 'BottomSliderAuto.dart';

class DriverCards extends StatefulWidget {
  const DriverCards({super.key});

  @override
  State<DriverCards> createState() => _DriverCardsState();
}

class _DriverCardsState extends State<DriverCards> {
  List<bool> filterOptionsIsChoosed =
      List.generate(filterOptionsNames.length, (index) => false);

  int _currentIndex = 0;
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
                                  "Ташкент → Андижан",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: cworkingHintColor,
                                  ),
                                ),
                                Text(
                                  "Завтра, 1 пассажир",
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
                                isScrollControlled: true,
                                context: context,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return BottomSliderPriceAndTime(
                                    getVale: (val) {
                                      print(val);
                                    },
                                  );
                                });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Color(0xffE2E2E2),
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
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: options(),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: cinputColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Белый Chevrolet Cobalt",
                                        style: TextStyle(
                                          color: Color(0xFF262626),
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "01V743JB",
                                        style: TextStyle(
                                          color: Color(0xFF262626),
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "❄️ Кондиционер   | ⛽️ Бензин   | 🚛 Кофр",
                                  style: TextStyle(
                                    color: Color(0xFFB8B8B8),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0.12,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "⏰ Занято мест: 2 из 4",
                                  style: TextStyle(
                                    color: Color(0xFFB8B8B8),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "от 25 000 сум",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  // textAlign: TextAlign.start,
                                  "Адрес отправки: Сергели ипподром (18:00)",
                                  style: TextStyle(
                                    color: Color(0xFF2A2A2A),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      padding: EdgeInsets.all(15.0),
                                      textStyle: TextStyle(fontSize: 16),
                                      side: BorderSide(
                                        color: caccentColor,
                                        width: 1,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      // Get.to(OrderInfo());
                                    },
                                    child: const Text(
                                      " Name +998 99 999 99 99",
                                      style: TextStyle(color: caccentColor),
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
                ),
              )
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
            if (isOrderStartes == false) {
              Get.to(DriverTakesFrom());
            } else {
              // screen of order
            }

            // Add your button onPressed logic here
          },
          child: Text(
            textAlign: TextAlign.center,
            isOrderStartes
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
              Get.to(MyTrips());
            } else if (newIndex == 0) {
              if (doesUserWentToCardScreen == false) {
                Get.to(ChoosePlace());
              } else {
                Get.to(DriverCards());
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

  List<Widget> options() {
    List<Widget> result = List.generate(
        filterOptionsNames.length,
        (index) => GestureDetector(
              onTap: () {
                if (filterOptionsNames[index] == "Avto") {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return BottomSliderAuto(
                          getValue: (val) {
                            print(val);
                          },
                        );
                      });
                }
                setState(() {
                  filterOptionsIsChoosed[index] =
                      filterOptionsIsChoosed[index] == true ? false : true;
                  // when it clicks a avto it will open slider
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 8.0),
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
                decoration: BoxDecoration(
                  color: filterOptionsIsChoosed[index] == true
                      ? caccentColor
                      : cinputColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    filterOptionsNames[index],
                    style: TextStyle(
                      color: filterOptionsIsChoosed[index] == true
                          ? cwhiteColor
                          : cworkingHintColor,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ));
    if (result.isNotEmpty) {
      return result;
    }
    return [];
  }
}

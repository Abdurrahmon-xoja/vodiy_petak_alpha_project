import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/Cards_screem.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/Places_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/mytrips_screen.dart';

import '../../consts/castem_widgets_const.dart';
import '../../consts/global_varibels.dart';
import '../DriverScreens/DriverCards_screem.dart';
import 'dart:io' show Platform;

class ChoosePlace extends StatefulWidget {
  const ChoosePlace({super.key});

  @override
  State<ChoosePlace> createState() => _ChoosePlaceState();
}

class _ChoosePlaceState extends State<ChoosePlace>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.directions_car_filled),
    Icon(Icons.person),
  ];

  final List<Tab> _tabs = [
    Tab(
      text: "Поездка",
    ),
    Tab(
      text: "Доставка",
    ),
  ];

  final List<Widget> _tabsBody = [
    OrderForPassenger(),
    OrderForDelivery(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: caccent2Color,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Здравствуйте,",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: cwhiteColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Ирода Омонова",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: cwhiteColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SvgPicture.asset(
                          'images/ChoosePlace.svg',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    color: cwhiteColor,
                    child: null,
                  ),
                )
              ],
            ),
            Align(
              alignment: Platform.isIOS ? Alignment(0, 0.6) : Alignment(0, 0.8),
              child: IntrinsicWidth(
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: Platform.isIOS
                      ? MediaQuery.of(context).size.height - 497
                      : MediaQuery.of(context).size.height - 430, //497
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ccover3,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: kToolbarHeight - 8.0,
                        decoration: BoxDecoration(
                          color: cnonWorkingColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          tabs: _tabs,
                          labelColor: caccentColor,
                          indicatorColor: caccentColor,
                          unselectedLabelColor: cworkingHintColor,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: caccentBackingColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: _tabsBody,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
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
            if (newIndex == 1) {
              Get.to(MyTrips());
            }
            _currentIndex = newIndex;
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

class OrderForPassenger extends StatefulWidget {
  const OrderForPassenger({super.key});

  @override
  State<OrderForPassenger> createState() => _OrderForPassengerState();
}

class _OrderForPassengerState extends State<OrderForPassenger> {
  String fromWhere = "";
  String toWhere = "";
  String date = DateTime.now().toString().split(" ")[0].replaceAll("-", "/");
  String numberOfPeople = "1";

  Future<void> _selectDate() async {
    DateTime? pickedDAte = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1700),
      lastDate: DateTime(2100),
    );

    if (pickedDAte != null) {
      setState(() {
        date = pickedDAte.toString().split(" ")[0].replaceAll("-", "/");
      });
    } else {
      print("Its not working");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ccover3,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        fromWhere = await Get.to(Places());
                        setState(() {
                          fromWhere;
                        });
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: cdarkTextColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Откуда",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: cdarkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(fromWhere),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  width: 180,
                  color: cclueColor,
                  margin: EdgeInsets.only(left: 90),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ccover3,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        toWhere = await Get.to(Places());
                        setState(() {
                          toWhere;
                        });
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: cdarkTextColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Куда",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: cdarkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(toWhere),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  width: 180,
                  color: cclueColor,
                  margin: EdgeInsets.only(left: 90),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: cwhiteColor,
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          String middleVaribel = fromWhere;
                          fromWhere = toWhere;
                          toWhere = middleVaribel;
                        });
                      },
                      icon: Icon(
                        Icons.swap_vert,
                        color: cdarkTextColor,
                      )),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: cwhiteColor,
                  ),
                  child: IconButton(
                    onPressed: () {
                      _selectDate();
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: cclueColor,
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Сегодня",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: cdarkTextColor),
                ),
              ],
            ),
            Container(
              // margin: EdgeInsets.only(left:0.0),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: cwhiteColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 24,
                    color: cclueColor,
                  ),
                  IconButton(
                    onPressed: () {
                      int passangerNumber = int.parse(numberOfPeople);
                      passangerNumber += 1;
                      if (passangerNumber < 7) {
                        setState(() {
                          numberOfPeople = passangerNumber.toString();
                        });
                      }
                    },
                    icon: Icon(
                      Icons.add,
                      color: cdarkTextColor,
                      size: 16,
                    ),
                  ),
                  Text(
                    numberOfPeople,
                    style: TextStyle(color: cdarkTextColor, fontSize: 12),
                  ),
                  IconButton(
                    onPressed: () {
                      int passangerNumber = int.parse(numberOfPeople);
                      passangerNumber -= 1;
                      if (passangerNumber > 0) {
                        setState(() {
                          numberOfPeople = passangerNumber.toString();
                        });
                      }
                    },
                    icon: Icon(
                      Icons.remove,
                      color: cdarkTextColor,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        button(
            text: "Поиск",
            color: caccentColor,
            onPressed: () {
              // here we should write to memoer new order
              doesUserWentToCardScreen = true;
              if (isDriver = true) {
                // will write
                Get.to(DriverCards());
              }
              Get.to(Cards());
            }),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class OrderForDelivery extends StatefulWidget {
  const OrderForDelivery({super.key});

  @override
  State<OrderForDelivery> createState() => _OrderForDeliveryState();
}

class _OrderForDeliveryState extends State<OrderForDelivery> {
  String fromWhere = "";
  String toWhere = "";
  String date = DateTime.now().toString().split(" ")[0].replaceAll("-", "/");
  String numberOfPeople = "1";

  Future<void> _selectDate() async {
    DateTime? pickedDAte = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1700),
      lastDate: DateTime(2100),
    );

    if (pickedDAte != null) {
      setState(() {
        date = pickedDAte.toString().split(" ")[0].replaceAll("-", "/");
      });
    } else {
      print("Its not working");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ccover3,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        fromWhere = await Get.to(Places());
                        setState(() {
                          fromWhere;
                        });
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: cdarkTextColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Откуда",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: cdarkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(fromWhere),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  width: 180,
                  color: cclueColor,
                  margin: EdgeInsets.only(left: 90),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ccover3,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        toWhere = await Get.to(Places());
                        setState(() {
                          toWhere;
                        });
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.radio_button_checked,
                            color: cdarkTextColor,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "Куда",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: cdarkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(toWhere),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 1,
                  width: 180,
                  color: cclueColor,
                  margin: EdgeInsets.only(left: 90),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: cwhiteColor,
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          String middleVaribel = fromWhere;
                          fromWhere = toWhere;
                          toWhere = middleVaribel;
                        });
                      },
                      icon: Icon(
                        Icons.swap_vert,
                        color: cdarkTextColor,
                      )),
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 18,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Row(
        //       children: [
        //         Container(
        //           margin: EdgeInsets.only(left: 10.0),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10.0),
        //             color: cwhiteColor,
        //           ),
        //           child: IconButton(
        //             onPressed: () {
        //               _selectDate();
        //             },
        //             icon: Icon(
        //               Icons.calendar_month,
        //               color: cclueColor,
        //               size: 24,
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           width: 10,
        //         ),
        //         Text(
        //           "Сегодня",
        //           style: TextStyle(
        //               fontSize: 16,
        //               fontWeight: FontWeight.w700,
        //               color: cdarkTextColor),
        //         ),
        //       ],
        //     ),
        //     Container(
        //       // margin: EdgeInsets.only(left:0.0),
        //       padding: EdgeInsets.symmetric(horizontal: 10),
        //       decoration: BoxDecoration(
        //         color: cwhiteColor,
        //         borderRadius: BorderRadius.circular(10.0),
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Icon(
        //             Icons.person_outline,
        //             size: 24,
        //             color: cclueColor,
        //           ),
        //           IconButton(
        //             onPressed: () {
        //               int passangerNumber = int.parse(numberOfPeople);
        //               passangerNumber += 1;
        //               if (passangerNumber < 7) {
        //                 setState(() {
        //                   numberOfPeople = passangerNumber.toString();
        //                 });
        //               }
        //             },
        //             icon: Icon(
        //               Icons.add,
        //               color: cdarkTextColor,
        //               size: 16,
        //             ),
        //           ),
        //           Text(
        //             numberOfPeople,
        //             style: TextStyle(color: cdarkTextColor, fontSize: 12),
        //           ),
        //           IconButton(
        //             onPressed: () {
        //               int passangerNumber = int.parse(numberOfPeople);
        //               passangerNumber -= 1;
        //               if (passangerNumber > 0) {
        //                 setState(() {
        //                   numberOfPeople = passangerNumber.toString();
        //                 });
        //               }
        //             },
        //             icon: Icon(
        //               Icons.remove,
        //               color: cdarkTextColor,
        //               size: 16,
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        SizedBox(
          height: 24,
        ),
        button(
            text: "Поиск",
            color: caccentColor,
            onPressed: () {
              // here we should write to memoer new order
              doesUserWentToCardScreen = true;
              if (isDriver = true) {
                // will write
                Get.to(DriverCards());
              }
              Get.to(Cards());
            }),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/Cards_screem.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/driverOrPassenger_screen.dart';
import 'package:vodiy_petak_alpha_project/view/loginOrRegistration_screen.dart';

import '../../Server/Api.dart';
import '../../controller/LocalMemory.dart';
import '../OrderUser/mytrips_screen.dart';
import 'client_edit_screen.dart';

class ClientAccount extends StatefulWidget {
  const ClientAccount({super.key});

  @override
  State<ClientAccount> createState() => _ClientAccountState();
}

class _ClientAccountState extends State<ClientAccount> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      LocalMemory.getValue("name"),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.to(ClienAccountEdit());
                        },
                        icon: Icon(
                          Icons.edit_note,
                          color: cclueColor,
                        ),
                      ),
                      Text(
                        "Редактировать профиль",
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
                  Text("Номер телефона",
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
                height: 71,
              ),
              button(
                  text: "🚕  Стать водителем",
                  color: caccentColor,
                  onPressed: () {
                    LocalMemory.clearAll();
                    Get.to(DriverOrPassenger());
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
                //some
                Get.to(ChoosePlace());
              } else {
                Get.to(ChoosePlace());
              }
            } else if (newIndex == 1) {
              Get.to(MyTrips());
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

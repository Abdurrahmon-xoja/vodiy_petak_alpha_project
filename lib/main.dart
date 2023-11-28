import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/AirConditiningAndFuelType.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/CarRegistration_screen.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DRiverTime.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverCards_screem.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverOrderScreen.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverTakesFrom_screen.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriversTrips.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/PlaceAndPrice.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/SeatsChoose.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/WillTakeDelivary.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/WillTakePassangers.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/mytrips_screen.dart';

import 'package:vodiy_petak_alpha_project/view/loginOrRegistration_screen.dart';

void main() {
  runApp(const MyApp()); /**/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Next Screen"),
            onPressed: () {
              Get.to(ChoosePlace());
            },
          ),
        ),
      ),
    );
  }
}

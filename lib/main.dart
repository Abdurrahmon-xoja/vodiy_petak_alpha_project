import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/Cards_screem.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/Places_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/mytrips_screen.dart';
import 'package:vodiy_petak_alpha_project/view/ServisScreens/noInternet.dart';
import 'package:vodiy_petak_alpha_project/view/driverOrPassenger_screen.dart';
import 'package:vodiy_petak_alpha_project/view/loginOrRegistration_screen.dart';
import 'package:vodiy_petak_alpha_project/view/registration/registrationPhone_screen.dart';

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
              Get.to(LoginOrRegistration());
            },
          ),
        ),
      ),
    );
  }
}

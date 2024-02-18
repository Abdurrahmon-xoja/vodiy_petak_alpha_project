import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/loginOrRegistration_screen.dart';

import '../consts/castem_widgets_const.dart';
import '../controller/LocalMemory.dart';

class DriverOrPassenger extends StatelessWidget {
  const DriverOrPassenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Сиз кимсиз?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'images/driverOrPassenger2.svg',
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              button(
                text: "💺 Мен йўловчиман",
                color: caccentColor,
                onPressed: () async {
                  await LocalMemory.saveDataString("user", "passenger");
                  Get.to(() => LoginOrRegistration());
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              buttonBorder("🚕 Мен ҳайдовчиман", () async {
                await LocalMemory.saveDataString("user", "driver");
                Get.to(() => LoginOrRegistration());
              }),
            ],
          ),
        ),
      ),
    );
  }
}

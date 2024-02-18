import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/SizeAndPrice.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/WillTakePassangers.dart';

class WillTakeDelivary extends StatelessWidget {
  const WillTakeDelivary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: BoxDecoration(
                color: caccentBackingColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //svg image
                  SvgPicture.asset(
                    'images/takeDelivary.svg',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Йетказмага тайёрмисиз?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2A2A2A),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  button(
                    text: "Ҳа, мен йетказиб бера оламан",
                    color: caccentColor,
                    onPressed: () async {
                      await LocalMemory.saveDataString(
                          "order_takesDelivary", "true");
                      Get.to(() => SizeAndPrice());
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  buttonBorder(
                    "Йўқ мен йетказиб бера олмайман",
                    () async {
                      await LocalMemory.saveDataString(
                          "order_takesDelivary", "false");
                      Get.to(() => WillTakePassangers());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

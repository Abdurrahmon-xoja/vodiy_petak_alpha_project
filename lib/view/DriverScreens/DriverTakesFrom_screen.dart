import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverGoesTo.dart';

import '../../consts/filtering_const.dart';

class DriverTakesFrom extends StatefulWidget {
  const DriverTakesFrom({super.key});

  @override
  State<DriverTakesFrom> createState() => _DriverTakesFromState();
}

class _DriverTakesFromState extends State<DriverTakesFrom> {
  String from = "";

  @override
  Widget build(BuildContext context) {
    DropdownSearchCastom dropdownSearchPlacdeFrom = DropdownSearchCastom(
      getValue: (v) {
        from = v;
      },
      items: placesOrder,
      icon: Icons.home_outlined,
      height: 300,
    );
    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Йўловчиларни қабул қиладиган жойни белгиланг",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: cdarkTextColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text("Йетказиб бериш манзилини белгиланг",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    dropdownSearchPlacdeFrom,
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: button(
                    text: "Кейингиси",
                    color: caccentColor,
                    onPressed: () {
                      if (from == "") {
                        Get.snackbar(
                          "toldir ohirgacha",
                          "iltimos",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: cerrorColor,
                          colorText: cwhiteColor,
                        );
                      } else {
                        LocalMemory.saveDataString("order_from", from);
                        Get.to(() => DriverGoesTo());
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

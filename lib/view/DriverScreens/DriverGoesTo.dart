import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DRiverTime.dart';

import '../../consts/filtering_const.dart';

class DriverGoesTo extends StatefulWidget {
  const DriverGoesTo({super.key});

  @override
  State<DriverGoesTo> createState() => _DriverGoesToState();
}

class _DriverGoesToState extends State<DriverGoesTo> {
  String to = " ";

  @override
  Widget build(BuildContext context) {
    DropdownSearchCastom dropdownSearchPlacdeFrom = DropdownSearchCastom(
      getValue: (v) {
        to = v;
      },
      items: placesOrder,
      icon: Icons.home_outlined,
      height: 300,
    );
    return Scaffold(
      appBar: cDefoltAppBar(),
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
                      "Укажите адрес высадки",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: cdarkTextColor),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text("Укажите адрес отправки",
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
                    text: "Next",
                    color: caccentColor,
                    onPressed: () async {
                      await LocalMemory.saveDataString("order_to", to);
                      Get.to(() => DriverTime());
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

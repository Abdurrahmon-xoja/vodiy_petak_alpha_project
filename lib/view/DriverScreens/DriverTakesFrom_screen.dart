import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';

import '../../consts/filtering_const.dart';

class DriverTakesFrom extends StatefulWidget {
  const DriverTakesFrom({super.key});

  @override
  State<DriverTakesFrom> createState() => _DriverTakesFromState();
}

class _DriverTakesFromState extends State<DriverTakesFrom> {
  String some = " ";

  @override
  Widget build(BuildContext context) {
    DropdownSearchCastom dropdownSearchPlacdeFrom = DropdownSearchCastom(
      getValue: (v) {
        some = v;
      },
      items: autoChevroletOptions,
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
                      "Уточните место откуда заберете пассажиров",
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
                child: SvgPicture.asset('images/DriverTakseFrom.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '';

import '../../consts/filtering_const.dart';
import '../../consts/methods_const.dart';

class CarRegistration extends StatefulWidget {
  @override
  State<CarRegistration> createState() => _CarRegistrationState();
}

class _CarRegistrationState extends State<CarRegistration> {
  String some = " ";

  @override
  Widget build(BuildContext context) {
    DropdownSearchCastom dropdownSearch1 = DropdownSearchCastom(
      items: autoChevroletOptions,
      getValue: (val) {
        some = val;
      },
      icon: Icons.directions_car_filled,
      height: 200,
    );
    return Scaffold(
      appBar: cDefoltAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Осталось совсем не много",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Заполните данные авто Их вам нужно заполнить один раз, далее приложение запомнить ваши данные",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff646464),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Марка авто",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff262626),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              dropdownSearch1,
              SizedBox(
                height: 16,
              ),
              Text(
                "Модель авто",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff262626),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              dropdownSearch1,
              SizedBox(
                height: 16,
              ),
              Text(
                "Марка авто",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff262626),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                // controller: carNumberController,
                decoration: InputDecoration(
                    fillColor: cinputColor,
                    filled: true,
                    hintText: '01V743JB',
                    hintStyle: TextStyle(
                      color: cclueColor,
                      fontSize: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: cinputColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: cinputColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(
                      Icons.directions_car,
                      color: cclueColor,
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Цвет авто",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff262626),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              dropdownSearch1,
              SizedBox(
                height: 40,
              ),
              button(
                text: "hello",
                color: caccentColor,
                onPressed: () {
                  print(some);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

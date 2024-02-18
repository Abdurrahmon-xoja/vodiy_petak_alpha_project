import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';

import 'colors_const.dart';

AppBar cDefoltAppBar(Function()? onPressed) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: cworkingHintColor,
      ),
      onPressed: onPressed,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

Container cDriverOrderPassanger() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: cinputColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${LocalMemory.getValue("carColor")} ${LocalMemory.getValue("carModel")}",
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          LocalMemory.getValue("carNumber"),
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ]),
                  SvgPicture.asset(
                    'images/car.svg',
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${LocalMemory.getValue("airCond") == "true" ? "❄️ Кондиционер | " : ""}${LocalMemory.getValue("fuel") == "oil" ? "⛽️ Бензин " : "⛽️ Газ "} ",
                    style: TextStyle(
                      color: Color(0xFFB8B8B8),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0.12,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    // i nedd to add how many plasas avalibel for now will how many was exsisted
                    "⏰ Банд ўриндиқлар: ${LocalMemory.getValue("driverOrderInfoPassengerHowOrdersTaken")} / ${LocalMemory.getValue("driverOrderInfoPassengerHowManySeats")}",
                    style: TextStyle(
                      color: Color(0xFFB8B8B8),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    // make lowest price point
                    "${NumberFormat('###,###', 'en_US').format(double.parse(LocalMemory.getValue("driverOrderInfoPassengerLowestPrice"))).replaceAll(",", " ")} сўмдан бошлаб",
                    // data[index].priceLowest,
                    style: TextStyle(
                      color: Color(0xFF2A2A2A),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Манзил: ${LocalMemory.getValue("order_to")} (${LocalMemory.getValue("order_time")})",
                    style: TextStyle(
                      color: Color(0xFF2A2A2A),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Хайдовчининг исми: ${LocalMemory.getValue("name")}",
                    style: TextStyle(
                      color: Color(0xFF2A2A2A),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.all(15.0),
                        textStyle: TextStyle(fontSize: 16),
                        side: BorderSide(
                          color: caccentColor,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            color: caccentColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            LocalMemory.getValue("phoneNumber"),
                            style: TextStyle(color: caccentColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

Container cDriverOrderDelivary() {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              color: cinputColor, borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${LocalMemory.getValue("carColor")} ${LocalMemory.getValue("carModel")}",
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          LocalMemory.getValue("carNumber"),
                          style: TextStyle(
                            color: Color(0xFF262626),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ]),
                  SvgPicture.asset(
                    'images/car.svg',
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${NumberFormat('###,###', 'en_US').format(double.parse(LocalMemory.getValue("driverOrderInfoDelivaryLowestPrice"))).replaceAll(",", " ")} сўмдан бошлаб",
                    style: TextStyle(
                      color: Color(0xFF2A2A2A),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Манзил: ${LocalMemory.getValue("order_to")} (${LocalMemory.getValue("order_time")})",
                    style: TextStyle(
                      color: Color(0xFF2A2A2A),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.all(15.0),
                        textStyle: TextStyle(fontSize: 16),
                        side: BorderSide(
                          color: caccentColor,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            color: caccentColor,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            LocalMemory.getValue("phoneNumber"),
                            style: TextStyle(color: caccentColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

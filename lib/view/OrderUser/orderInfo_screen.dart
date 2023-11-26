import 'package:flutter/material.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

import 'BottomSliderPlacecs.dart';

class OrderInfo extends StatefulWidget {
  const OrderInfo({super.key});

  @override
  State<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: cnonWorkingColor,
            size: 28,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 63,
                    height: 63,
                    decoration: BoxDecoration(
                      color: Color(0xffD0D0D0),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  SizedBox(
                    width: 128,
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: cinputColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "до",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: cdarkTextColor,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "25 000",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: cdarkTextColor,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text("сум",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: cdarkTextColor,
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "Белый Chevrolet Cobalt",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "01V743JB",
                style: TextStyle(
                  fontSize: 24,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: cclueColor,
                  ),
                  Text(
                    "4.9",
                    style: TextStyle(
                      fontSize: 14,
                      color: cclueColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 13,
              ),
              RichText(
                text: const TextSpan(
                    text: "1 октября :",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff2A2A2A),
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Ташкент-Андижан",
                        style: TextStyle(
                            color: Color(0xff2A2A2A),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: "( 18:00)",
                        style: TextStyle(
                            color: Color(0xff2A2A2A),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Text(
                    "Водитель",
                    style: TextStyle(
                        fontSize: 16,
                        color: cdarkTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: caccentBackingColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      "+998 99 999 99 99",
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
                height: 13,
              ),
              Text(
                "Ирода Омонова",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff2A2A2A),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text("Характеристики",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(
                height: 13,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color(0xffb7d8ff),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: caccentColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "Кондицинер",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: cwhiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color(0xffb7d8ff),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: caccentColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "Кофр (крыша машины)",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: cwhiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Color(0xffb7d8ff),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: caccentColor,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "Oil type",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: cwhiteColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              button(
                  text: "Позвонить и забронировать место",
                  color: caccentColor,
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return BottomSliderPlaces();
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

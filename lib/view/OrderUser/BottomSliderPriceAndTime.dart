import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';

import '../../consts/colors_const.dart';
import '../../consts/filtering_const.dart';

class BottomSliderPriceAndTime extends StatefulWidget {
  final Function(Map) getVale;

  const BottomSliderPriceAndTime({required this.getVale});

  @override
  State<BottomSliderPriceAndTime> createState() =>
      _BottomSliderPriceAndTimeState();
}

class _BottomSliderPriceAndTimeState extends State<BottomSliderPriceAndTime> {
  double startPrice = 25000;
  double endPrice = 55000;

  RangeValues values = const RangeValues(20000, 40000);

  List<bool> timeOfGoingBool =
      List.generate(timeOfGoing.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    var startPriceFormatter = NumberFormat('###,###', 'en_US')
        .format(startPrice)
        .replaceAll(',', ' ');
    var endPriceFormatter =
        NumberFormat('###,###', 'en_US').format(endPrice).replaceAll(',', ' ');
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            width: 50,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: const Color(0xffD9D9D9),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          IntrinsicWidth(
            child: Container(
              // width: 50,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xffE2E2E2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Фильтры",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: cdarkTextColor,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(
                    Icons.tune,
                    color: cclueColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Диапазон цен",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: cinputColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "от",
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
                                startPriceFormatter,
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
                      SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
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
                                endPriceFormatter,
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
                    height: 25,
                  ),
                  RangeSlider(
                      activeColor: caccentColor,
                      inactiveColor: cinputColor,
                      values: values,
                      divisions: ((300000 - 10000) ~/ 5000),
                      // here we going to change thing for defolt
                      min: 10000,
                      max: 300000,
                      onChanged: (nvalue) {
                        setState(() {
                          startPrice = nvalue.start;
                          endPrice = nvalue.end;
                          values = nvalue;
                        });
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Примерное время отбытия",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: timeOfGo(),
                  ),
                  button(
                      text: "hello",
                      color: caccentColor,
                      onPressed: () {
                        // here we going to ask backen for cars
                        // Navigator.pop(context);

                        List<Map> timeData = [];

                        for (int i = 0; i < timeOfGoingBool.length; i++) {
                          if (timeOfGoingBool[i]) {
                            List<String> times = timeOfGoing[i].split('-');
                            Map<String, String> data = {
                              'timeFrom': times[0],
                              'timeTo': times[1],
                            };

                            timeData.add(data);
                          } else {
                            continue;
                          }
                        }

                        Map<String, String> dataSend = {
                          'priceFrom': startPrice.toInt().toString(),
                          'priceTo': endPrice.toInt().toString(),
                          'timeArray': jsonEncode(timeData),
                        };

                        widget.getVale(dataSend);
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> timeOfGo() {
    List<Widget> result = List.generate(
      timeOfGoing.length,
      (index) => GestureDetector(
        onTap: () {
          setState(() {
            timeOfGoingBool[index] = !(timeOfGoingBool[index]);
          });
        },
        child: Container(
          width: 150,
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: timeOfGoingBool[index] ? caccentColor : cinputColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  timeOfGoName[index],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: timeOfGoingBool[index]
                          ? cwhiteColor
                          : cworkingHintColor),
                ),
              ),
              // SizedBox(
              //   width: 20,
              // ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: timeOfGoingBool[index] ? caccentColor : cinputColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  timeOfGoing[index],
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: timeOfGoingBool[index]
                          ? cwhiteColor
                          : cworkingHintColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
    return result;
  }
}

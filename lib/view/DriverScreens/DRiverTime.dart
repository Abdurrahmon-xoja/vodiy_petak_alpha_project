import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';

class DriverTime extends StatefulWidget {
  const DriverTime({super.key});

  @override
  State<DriverTime> createState() => _DriverTimeState();
}

class _DriverTimeState extends State<DriverTime> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeF = DateTime.parse(dateTime.toString());
    String formattedTime = formatTime(dateTimeF);
    return Scaffold(
      appBar: cDefoltAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  "Во сколько будете выезжать?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              color: cwhiteColor,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Закрыть",
                                          style: TextStyle(
                                            color: caccentColor,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.time,
                                      onDateTimeChanged: (DateTime value) {
                                        setState(() {
                                          dateTime = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                width: 1,
                                color: cclueColor,
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      formattedTime,
                                      style: TextStyle(
                                        fontSize: 36.0,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff898A8D),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Icon(
                                    Icons.expand_more,
                                    color: Color(0xff898A8D),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: button(
                    text: "Далее", color: caccentColor, onPressed: () {}),
              )),
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(DateTime dateTime) {
    return DateFormat('h:mm').format(dateTime);
  }
}

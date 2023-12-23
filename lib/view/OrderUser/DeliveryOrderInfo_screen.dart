import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

import '../../models/OrderPassengerInfo.dart';
import 'BottomSliderPlacecs.dart';

class DeliveryOrderInfo extends StatefulWidget {
  const DeliveryOrderInfo({super.key});

  @override
  State<DeliveryOrderInfo> createState() => _DeliveryOrderInfoState();
}

class _DeliveryOrderInfoState extends State<DeliveryOrderInfo> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  late OrderPassengerInfo _dataRebdering;

  @override
  void initState() {
    super.initState();
    _dataRebdering = Get.arguments;
  }

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
        child: SingleChildScrollView(
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
                  "OQ ${_dataRebdering.carModel}",
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
                  _dataRebdering.carNumber,
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
                  text: TextSpan(
                      text: "${_dataRebdering.name}",
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
                          text: "(${_dataRebdering.time})",
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
                        _dataRebdering.phoneNumber,
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
                  _dataRebdering.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff2A2A2A),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Места",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  decoration: BoxDecoration(
                    color: caccentBackingColor,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: caccentColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Место спереди",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: caccentColor,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            textAlign: TextAlign.end,
                            "не займет пасадочное место",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: caccentColor,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Text(
                              textAlign: TextAlign.end,
                              "40 000",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: caccentColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Container(
                            width: 22.0,
                            height: 22.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: caccentColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Оставьте контакты получателя",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        // controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: cinputColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: cinputColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: cinputColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 70,
                            child: Row(
                              children: [
                                Text(
                                  "🇺🇿 +998 ",
                                  style: TextStyle(
                                    color: cclueColor,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 20,
                                  color: cclueColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (v) {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Оставьте контакты получателя",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: formKey2,
                  child: Column(
                    children: [
                      TextFormField(
                        // controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: cinputColor,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: cinputColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: cinputColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: Container(
                            margin: EdgeInsets.only(left: 10),
                            width: 70,
                            child: Row(
                              children: [
                                Text(
                                  "🇺🇿 +998 ",
                                  style: TextStyle(
                                    color: cclueColor,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  height: 20,
                                  color: cclueColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (v) {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
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
                  },
                ),
                SizedBox(
                  height: 13,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

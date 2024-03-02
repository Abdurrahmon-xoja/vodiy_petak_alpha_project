import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/OrderScreenPassenger.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/reasonCanceling.dart';

import '../../Server/Api.dart';
import '../../models/Convertion.dart';
import '../../models/OrderPassengerInfo.dart';
import 'BottomSliderPlacecs.dart';

class PassengerOrderInfo extends StatefulWidget {
  const PassengerOrderInfo({super.key});

  @override
  State<PassengerOrderInfo> createState() => _PassengerOrderInfoState();
}

class _PassengerOrderInfoState extends State<PassengerOrderInfo> {
  late OrderPassengerInfo _dataRendering;
  late List newList;
  late List newListBool;

  @override
  void initState() {
    super.initState();
    _dataRendering = Get.arguments;
    newList = [
      ..._dataRendering.passengerInfo,
      ..._dataRendering.addPassengerInfo
    ];

    newListBool = List.generate(newList.length, (index) => false);
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
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${NumberFormat('###,###', 'en_US').format(int.parse(_dataRendering.priceHighest)).replaceAll(",", " ")}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: cdarkTextColor,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Сом Гача",
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
                  "${_dataRendering.carColor} ${_dataRendering.carModel}",
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
                  _dataRendering.carNumber,
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
                      _dataRendering.rating == "0"
                          ? " "
                          : _dataRendering.rating,
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
                      text: "${_dataRendering.date}   ",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff2A2A2A),
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${_dataRendering.from}-${_dataRendering.to} ",
                          style: TextStyle(
                              color: Color(0xff2A2A2A),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "(${_dataRendering.time})",
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
                      "Ҳайдовчи",
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
                        _dataRendering.phoneNumber,
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
                  _dataRendering.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff2A2A2A),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Жойлар",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Ўзингиз хоҳлаган ўриндиқни танланг ва ҳайдовчига қўнғироқ қилинг",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: cclueColor,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Column(
                  children: seatas(),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Хусусиятлар",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
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
                      _dataRendering.airConditinar == "true"
                          ? "Кондиционер"
                          : "Кондиционер ёқ",
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
                      _dataRendering.fuel,
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
                    text: "Қўнғироқ қилинг ва жой банд қилинг",
                    color: caccentColor,
                    onPressed: () async {
                      bool allFalse =
                          newListBool.every((element) => element == false);
                      if (allFalse) {
                        Get.snackbar("Биттасини танлашкере", "Илтимос",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: cerrorColor,
                            colorText: cwhiteColor);
                      } else {
                        final Uri url = Uri(
                          scheme: 'tel',
                          path: _dataRendering.phoneNumber,
                        );

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print("CouldNot launche this");
                        }

                        //--------------------widget
                        Get.defaultDialog(
                            title: "",
                            content: Container(
                              width: MediaQuery.of(context).size.width + 100,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              // width: double.infinity,
                              child: Column(
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Вы только что говорили с водителем",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: cdarkTextColor),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    "Агар сафарга келишиб олган бўлсангиз, “Сафарни тасдиқлаш” тугмасини босинг, бўлмаса, “Орқага қайтиш” тугмасини босинг",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: cworkingHintColor),
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  button(
                                    text: "Давом этиш",
                                    color: caccentColor,
                                    onPressed: () {
                                      List<Map> oldRegistration =
                                          convertFromInstOfOrderToMap(
                                              _dataRendering.orderTakenFrom);
                                      List orderTaken = [...oldRegistration];
                                      List<Map> passangerInfo =
                                          convertFromInstToMap(
                                              _dataRendering.passengerInfo);
                                      List<Map> passangerInfoAdd =
                                          convertFromInstToMap(
                                              _dataRendering.addPassengerInfo);

                                      print(passangerInfo[0]['price']);
                                      for (int i = 0;
                                          i < newListBool.length;
                                          i++) {
                                        if (newListBool[i] == true) {
                                          if (i <
                                              _dataRendering
                                                  .passengerInfo.length) {
                                            orderTaken.add({
                                              "seatName": passangerInfo[i]
                                                  ['name'],
                                              "price": passangerInfo[i]
                                                  ['price'],
                                              "phoneNumber":
                                                  LocalMemory.getValue(
                                                      "phoneNumber"),
                                            });
                                            passangerInfo.removeAt(i);
                                          } else {
                                            orderTaken.add({
                                              "seatName": passangerInfo[i -
                                                  passangerInfo.length]["name"],
                                              "price": passangerInfo[
                                                      i - passangerInfo.length]
                                                  ["price"],
                                              "phoneNumber":
                                                  LocalMemory.getValue(
                                                      "phoneNumber"),
                                            });
                                            passangerInfoAdd.removeAt(
                                                i - passangerInfo.length);
                                          }
                                        }
                                      }

                                      Map<String, String> updateData = {
                                        "id": _dataRendering.id,
                                        "passengerInfo":
                                            jsonEncode(passangerInfo)
                                                .toString(),
                                        "addPassengerInfo":
                                            jsonEncode(passangerInfoAdd)
                                                .toString(),
                                        "orderTaken":
                                            jsonEncode(orderTaken).toString(),
                                      };
                                      //important
                                      Api.sendNewOrderPassangerInfo(updateData);

                                      LocalMemory.saveDataString(
                                          "useOrderInsideInfoPassenger",
                                          jsonEncode(_dataRendering
                                              .getMapOfPassengerOrderInfo()));

                                      LocalMemory.saveDataString(
                                          "doesUserHasOrderPassenger", "true");

                                      Get.offAll(OrderScreenPassenger());
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buttonBorder(
                                    "Биз келиша олмадик",
                                    () {
                                      // Get.to(ChoosePlace());
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ));
                      }
                    }),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> seatas() {
    List<Widget> result = List.generate(
      newList.length,
      (index) => GestureDetector(
        onTap: () {
          setState(() {
            newListBool[index] = !newListBool[index];
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: newListBool[index] ? caccentBackingColor : cinputColor,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: newListBool[index] ? caccentColor : cworkingHintColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                newList[index].name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: newListBool[index] ? caccentColor : cworkingHintColor,
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      newList[index].price,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: newListBool[index]
                            ? caccentColor
                            : cworkingHintColor,
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
                      border: newListBool[index]
                          ? null
                          : Border.all(color: cworkingHintColor, width: 2),
                      color: newListBool[index] ? caccentColor : cinputColor,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );

    return result;
  }
}

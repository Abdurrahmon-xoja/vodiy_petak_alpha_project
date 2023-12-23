import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/reasonCanceling.dart';

import '../../models/OrderPassengerInfo.dart';
import 'BottomSliderPlacecs.dart';

class PassengerOrderInfo extends StatefulWidget {
  const PassengerOrderInfo({super.key});

  @override
  State<PassengerOrderInfo> createState() => _PassengerOrderInfoState();
}

class _PassengerOrderInfoState extends State<PassengerOrderInfo> {
  late OrderPassengerInfo _dataRebdering;
  late List newList;
  late List newListBool;

  @override
  void initState() {
    super.initState();
    _dataRebdering = Get.arguments;
    newList = [
      ..._dataRebdering.passengerInfo,
      ..._dataRebdering.addPassengerInfo
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
                              "${NumberFormat('###,###', 'en_US').format(int.parse(_dataRebdering.priceHighest)).replaceAll(",", " ")}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: cdarkTextColor,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Som Gacha",
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
                      text: "${_dataRebdering.date}   ",
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
                  height: 5,
                ),
                Text(
                  "selec the seat of your choise then call to driver ",
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
                  "Характеристики",
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
                      _dataRebdering.airConditinar == "true"
                          ? "Konditsiyaner"
                          : "netu kanditsiyanera",
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
                      _dataRebdering.fuel,
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
                    onPressed: () async {
                      final Uri url = Uri(
                        scheme: 'tel',
                        path: _dataRebdering.phoneNumber,
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
                                  "Если вы договорились о поездке нажмите подтвердить поездку если нет нажмите вернуться назад",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: cworkingHintColor),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                button(
                                  text: "Продолжить",
                                  color: caccentColor,
                                  onPressed: () {
                                    // Get.defaultDialog(
                                    //   title: "",
                                    //   content: alert(
                                    //     text1: 'Поездка активирована!',
                                    //     text2:
                                    //         'Если вы передумали отмените поездку, но перед этим позвоните водителю',
                                    //     imageName: 'images/ptichka.svg',
                                    //     buttonTExt: 'Отменить поездку',
                                    //     onClick: () {},
                                    //   ),
                                    // );
                                    Get.defaultDialog(
                                      title: "",
                                      content: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Поездка завершена",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            RatingBar(
                                              minRating: 1,
                                              maxRating: 5,
                                              initialRating: 3,
                                              ratingWidget: RatingWidget(
                                                full: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 22,
                                                ),
                                                empty: Icon(
                                                  Icons.star,
                                                  color: cclueColor,
                                                  size: 22,
                                                ),
                                                half: Icon(
                                                  Icons.star,
                                                  color: cclueColor,
                                                  size: 22,
                                                ),
                                              ),
                                              onRatingUpdate: (double value) {},
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Text(
                                              "Напишите комментарий",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff898989),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            TextFormField(
                                              // controller: _dateController,
                                              decoration: InputDecoration(
                                                // fillColor: fmaleInputColor,
                                                filled: true,
                                                hintText: 'Ваш комментарий',
                                                hintStyle: TextStyle(
                                                    color: cclueColor),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: BorderSide(
                                                      color: cinputColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: cinputColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            button(
                                                text: "Готово",
                                                color: caccentColor,
                                                onPressed: () {})
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                buttonBorder(
                                  "Мы не смогли договориться",
                                  () {
                                    Get.to(ReasonCanceling());
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ));
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/models/OrderDeliveryInfo.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/OrderScreenDelivary.dart';

import '../../Server/Api.dart';
import '../../consts/filtering_const.dart';
import '../../consts/methods_const.dart';
import '../../controller/LocalMemory.dart';
import '../../models/Convertion.dart';
import '../../models/OrderPassengerInfo.dart';
import 'BottomSliderPlacecs.dart';
import 'ChoosePlace_screen.dart';

class DeliveryOrderInfo extends StatefulWidget {
  const DeliveryOrderInfo({super.key});

  @override
  State<DeliveryOrderInfo> createState() => _DeliveryOrderInfoState();
}

class _DeliveryOrderInfoState extends State<DeliveryOrderInfo> {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final phoneControllerGiver = TextEditingController();
  final phoneControllerTaker = TextEditingController();
  late OrderDeliveryInfo _dataRendering;
  late List<bool> newListBool;

  @override
  void initState() {
    super.initState();
    _dataRendering = Get.arguments;
    newListBool =
        List.generate(_dataRendering.deliverySizeInfo.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
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
                              _dataRendering.priceHighest,
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
                  "OQ ${_dataRendering.carModel}",
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
                      text: "",
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
                  "Места",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Column(
                  children: goodContioner(),
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
                        controller: phoneControllerGiver,
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
                        controller: phoneControllerTaker,
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
                  onPressed: () async {
                    //take phone number
                    //validation
                    RegExp regExp = new RegExp(r'^\d{10}$');
                    bool allFalse =
                        newListBool.every((element) => element == false);
                    print((regExp.hasMatch(phoneControllerGiver.text)));
                    print((regExp.hasMatch(phoneControllerTaker.text)));
                    if (allFalse) {
                      Get.snackbar(
                        "Bittasini talla",
                        "iltimoss",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: cerrorColor,
                        colorText: cwhiteColor,
                      );
                    } else if (phoneControllerGiver.text == '' ||
                        (regExp.hasMatch(phoneControllerGiver.text))) {
                      Get.snackbar(
                        "Beradigan odammi nomerini ber",
                        "yoki notogri yozilgan",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: cerrorColor,
                        colorText: cwhiteColor,
                      );
                    } else if (phoneControllerTaker.text == '' ||
                        (regExp.hasMatch(phoneControllerTaker.text))) {
                      Get.snackbar(
                        "Oladigan nomerini ber",
                        "yoki notogri yozilgan",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: cerrorColor,
                        colorText: cwhiteColor,
                      );
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
                                      //Sending Information
                                      List<Map<String, String>> orderTaken = [];
                                      List<Map<String, String>> deliveryInfo =
                                          [];
                                      for (int i = 0;
                                          i < newListBool.length;
                                          i++) {
                                        if (newListBool[i] == true) {
                                          orderTaken.add({
                                            "name": _dataRendering
                                                .deliverySizeInfo[i].name,
                                            "price": _dataRendering
                                                .deliverySizeInfo[i].price,
                                            "orderGiverPhone":
                                                LocalMemory.getValue(
                                                    "phoneNumber"),
                                            "phonenumberGiver":
                                                "+998${phoneControllerGiver.text}",
                                            "phonenumberTaker":
                                                "+998${phoneControllerTaker.text}",
                                          });
                                        } else {
                                          deliveryInfo.add({
                                            "name": _dataRendering
                                                .deliverySizeInfo[i].name,
                                            "price": _dataRendering
                                                .deliverySizeInfo[i].price,
                                          });
                                        }
                                      }

                                      Map<String, String> dataSend = {
                                        "id": _dataRendering.id,
                                        "deliveryInfo":
                                            jsonEncode(deliveryInfo),
                                        "orderDelivaryTaken":
                                            jsonEncode(orderTaken),
                                      };

                                      //Api staff
                                      Api.sendNewOrderDelivaryInfo(dataSend);
                                      // convert to Map
                                      LocalMemory.saveDataString(
                                          "useOrderInsideInfoDelivary",
                                          jsonEncode(_dataRendering
                                              .getMapOfDelivaryOrderInfo()));
                                      LocalMemory.saveDataString(
                                          "doesUserHasOrderPassenger", "true");
                                      //go to order screen
                                      Get.offAll(OrderScreenDelivary());
                                    }),
                                SizedBox(
                                  height: 10,
                                ),
                                buttonBorder(
                                  "Мы не смогли договориться",
                                  () {
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

  List<Widget> goodContioner() {
    List<Widget> result = List.generate(
      newListBool.length,
      (index) => GestureDetector(
        onTap: () {
          setState(() {
            newListBool[index] = !newListBool[index];
          });
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _dataRendering.deliverySizeInfo[index].name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color:
                          newListBool[index] ? caccentColor : cworkingHintColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    goodsSizedDefinition[goodsSizedName.indexWhere((item) =>
                        item == _dataRendering.deliverySizeInfo[index].name)],
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color:
                          newListBool[index] ? caccentColor : cworkingHintColor,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      textAlign: TextAlign.end,
                      NumberFormat('###,###', 'en_US')
                          .format(double.parse(
                              _dataRendering.deliverySizeInfo[index].price))
                          .replaceAll(",", " "),
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

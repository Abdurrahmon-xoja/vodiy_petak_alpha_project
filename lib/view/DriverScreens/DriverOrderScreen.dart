import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';

import '../../Server/Api.dart';
import '../../consts/filtering_const.dart';
import '../../models/OrderDeliveryInfo.dart';
import '../../models/OrderPassengerInfo.dart';
import 'BottomSliderNumberOfSeats.dart';
import 'DriverCards_screem.dart';
import 'DriverDelivaryCards.dart';

class DriverOrderScreen extends StatefulWidget {
  const DriverOrderScreen({super.key});

  @override
  State<DriverOrderScreen> createState() => _DriverOrderScreenState();
}

class _DriverOrderScreenState extends State<DriverOrderScreen> {
  //call function here
  late Future<List<OrderPassengerInfo>> _renderPassangerInfo;
  late Future<List<OrderDeliveryInfo>> _renderDelivaryInfo;
  late int howManyPassengers = 0;
  late int howManyDelivary = 0;
  String orderPassengerId = "";
  String orderDelivaryId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //LocalMemory.getValue("phoneNumber")
    _renderPassangerInfo = Api.getPassengerOrderFromPhoneNumber(
        {"phoneNumber": LocalMemory.getValue("phoneNumber")});
    _renderDelivaryInfo = Api.getDelivaryOrderFromPhoneNumber(
        {"phoneNumber": LocalMemory.getValue("phoneNumber")});
    //data.orderTakenFrom.length
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(() {
        if (LocalMemory.getValue("didGoToCards") == "true") {
          if (LocalMemory.getValue("driverSeorchs") == "passengers") {
            Map<String, dynamic> tempData =
                jsonDecode(LocalMemory.getValue("passengerOrderInfo"));
            Map<String, String> data =
                tempData.map((key, value) => MapEntry(key, value.toString()));
            Get.to(DriverCards(), arguments: data);
          } else {
            Map<String, dynamic> tempData =
                jsonDecode(LocalMemory.getValue("delivaryOrderInfo"));
            Map<String, String> data =
                tempData.map((key, value) => MapEntry(key, value.toString()));
            Get.to(DriverDelivaryCard(), arguments: data);
          }
        }
      }),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Сизнинг буюртмаларингиз",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor,
                  )),
              SizedBox(
                height: 24,
              ),
              FutureBuilder(
                  future: _renderPassangerInfo,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.red)),
                        ),
                      );
                    } else {
                      if (snapshot.data.length == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.1),
                          child: Center(
                            child: SvgPicture.asset(
                              'images/noPassanger.svg',
                              // alignment: Alignment.center,
                            ),
                          ),
                        );
                      } else {
                        OrderPassengerInfo data = snapshot.data[0];
                        LocalMemory.saveDataString(
                            "driverOrderInfoPassengerHowOrdersTaken",
                            data.orderTakenFrom.length.toString());
                        howManyPassengers = data.orderTakenFrom.length;
                        orderPassengerId = data.id;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Жойларингиз:",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: cdarkTextColor,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              children: [
                                Column(
                                  children: getPassengerOrderTaken(
                                      data.orderTakenFrom),
                                ),
                                Column(
                                  children: getPassengerSeatLeft([
                                    ...data.passengerInfo,
                                    ...data.addPassengerInfo
                                  ]),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        );
                      }
                    }
                  }),
              Text(
                "Сизнинг етказмаларингиз",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // delivery card
              FutureBuilder(
                  future: _renderDelivaryInfo,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.red)),
                        ),
                      );
                    } else {
                      if (snapshot.data.length == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.1),
                          child: Center(
                            child: SvgPicture.asset(
                              'images/noDelevary.svg',
                              // alignment: Alignment.center,
                            ),
                          ),
                        );
                      } else {
                        OrderDeliveryInfo data = snapshot.data[0];
                        howManyDelivary = data.orderTakenFrom.length;
                        orderDelivaryId = data.id;

                        return Column(
                          children: [
                            Column(
                              children:
                                  getDelivarySeatsTaken(data.orderTakenFrom),
                            ),
                            Column(
                              children:
                                  getDelivaryPlaceLeft(data.deliverySizeInfo),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      }
                    }
                  }),

              SizedBox(
                height: 10,
              ),
              buttonBorder(
                "Сафарни якунланг",
                () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Сафарни якунланг",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: cdarkTextColor)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text("Қайерга:  ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff262626),
                                          )),
                                      //TODO: make automatik
                                      Text(
                                        "Ташкент",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: cdarkTextColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Сизда ${howManyDelivary} етказма(лар) бор",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff262626),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Сизда ${howManyPassengers} Йўловчи(лар) бор",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff262626),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Диққат! Барча йўловчиларни ташиш ва барча этказиб беришларни етказиб бермагунингизча саёҳатни тугатманг!",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff898989),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              button(
                                text: "Cафарни тугатиш",
                                color: caccentColor,
                                onPressed: () {
                                  //delete from LocalMemory
                                  LocalMemory.saveDataString(
                                      "doesDriverHaveOrder", "false");
                                  //Api
                                  Map data = {
                                    "idDelivary": orderDelivaryId,
                                    "idPassenger": orderPassengerId,
                                  };
                                  Api.endTheOrder(data);
                                  //Redirection
                                  // Local memery did went to cards
                                  LocalMemory.saveDataString(
                                      "didGoToCards", "false");
                                  LocalMemory.saveDataString(
                                      "order_willTakePassenger", "flase");
                                  LocalMemory.saveDataString(
                                      "order_takesDelivary", "false");
                                  Get.offAll(ChoosePlace());
                                },
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getPassengerOrderTaken(List<OrderTakenFrom> data) {
    List<Widget> result = List.generate(
      data.length,
      (index) => Container(
        margin: EdgeInsets.only(bottom: 8),
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
            Text(
              data[index].seatName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: caccentColor,
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: cwhiteColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                data[index].phoneNumber,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: caccentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );

    return result;
  }

  List<Widget> getPassengerSeatLeft(List<PassengerSetsInfo> data) {
    // for our local order show
    List<Widget> result = List.generate(
      data.length,
      (index) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: cinputColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: cclueColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data[index].name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: cworkingHintColor,
              ),
            ),
            Text(
              "Бўш",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: cworkingHintColor,
              ),
            ),
          ],
        ),
      ),
    );
    return result;
  }

  List<Widget> getDelivarySeatsTaken(List<OrderTakenDelivary> data) {
    List<Widget> resulr = List.generate(
      data.length,
      (index) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              "Контакты",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: cdarkTextColor),
            ),
            SizedBox(
              height: 12,
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data[index].name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: caccentColor,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              textAlign: TextAlign.end,
                              goodsSizedDefinition[goodsSizedName.indexWhere(
                                  (item) => item == data[index].name)],
                              style: TextStyle(
                                fontSize: 10,
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
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        "ЗАКАЗЧИК:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff262626),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: caccentBackingColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          data[index].phonenumberGiver,
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
                    height: 12,
                  ),
                  Row(
                    children: [
                      Text(
                        "ПОЛУЧАТЕЛЬ :",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff262626),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: caccentBackingColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          data[index].phonenumberTaker,
                          style: TextStyle(
                            color: caccentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return resulr;
  }

  List<Widget> getDelivaryPlaceLeft(List<DeliveryInfoSize> data) {
    List<Widget> result = List.generate(
        data.length,
        (index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: cinputColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: cclueColor,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data[index].name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: cworkingHintColor,
                    ),
                  ),
                  Text(
                    "Бўш",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: cworkingHintColor,
                    ),
                  ),
                ],
              ),
            ));
    return result;
  }
}

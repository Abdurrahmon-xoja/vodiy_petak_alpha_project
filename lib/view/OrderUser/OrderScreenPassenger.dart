import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';

import '../../Server/Api.dart';
import '../../consts/colors_const.dart';

class OrderScreenPassenger extends StatefulWidget {
  const OrderScreenPassenger({super.key});

  @override
  State<OrderScreenPassenger> createState() => _OrderScreenPassengerState();
}

class _OrderScreenPassengerState extends State<OrderScreenPassenger>
    with WidgetsBindingObserver {
  //get map from the Local Memory
  late bool isUsersOrderInProggres = false;
  late Map renderingData;

  void initRideInfo() async {
    isUsersOrderInProggres =
        await Api.isUsersRideInProgress({'id': renderingData['id']});
    setState(() {
      isUsersOrderInProggres;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    renderingData =
        jsonDecode(LocalMemory.getValue("useOrderInsideInfoPassenger"));
    initRideInfo();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Remove observer
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // The app is resumed (brought to the foreground)
      initRideInfo(); // Trigger your async function here
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isUsersOrderInProggres) {
      return Scaffold(
        body: Container(
          color: caccentColor,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // To make the container wrap its child
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Rate us',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10), // For spacing
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                      Get.to(ChoosePlace());
                      //from the local memory delete
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('images/ptichka.svg'),
                    Text("You order activated"),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "${renderingData['carColor']} ${renderingData['carModel']}",
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
                renderingData['carNumber'],
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
                    text: "${renderingData['date']}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff2A2A2A),
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "   ${renderingData['from']}-${renderingData['to']}",
                        style: TextStyle(
                            color: Color(0xff2A2A2A),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: "(${renderingData['time']})",
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
                      renderingData['phoneNumber'],
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
                renderingData['name'],
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff2A2A2A),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              SizedBox(
                height: 50,
              ),
              button(
                  text: "end the order call to driver",
                  color: caccentColor,
                  onPressed: () async {
                    print(renderingData['id']);
                    // give the phonenumber, and order id,
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: renderingData['phoneNumber'],
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
                                "Driver tell qill",
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
                                text: "Pozvonit",
                                color: caccentColor,
                                onPressed: () async {
                                  //phoneCall

                                  //then Api
                                  Api.cancelTheRight({
                                    "id": renderingData['id'],
                                    "phoneNumber":
                                        LocalMemory.getValue("phoneNumber"),
                                  });

                                  LocalMemory.saveDataString(
                                      "doesUserHasOrderPassenger", "false");

                                  Get.offAll(ChoosePlace());
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              buttonBorder(
                                "Cancel",
                                () {
                                  // Get.to(ChoosePlace());
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

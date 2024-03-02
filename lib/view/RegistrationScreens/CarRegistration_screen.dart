import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverCards_screem.dart';
import '';

import '../../Server/Api.dart';
import '../../consts/filtering_const.dart';
import '../../consts/methods_const.dart';
import '../OrderUser/ChoosePlace_screen.dart';

class CarRegistration extends StatefulWidget {
  @override
  State<CarRegistration> createState() => _CarRegistrationState();
}

class _CarRegistrationState extends State<CarRegistration> {
  String carModel = "";
  String carColor = "";
  TextEditingController carNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DropdownSearchCastom carModelDropDown = DropdownSearchCastom(
      items: [...autoChevroletOptions, ...autoOthersOptions],
      getValue: (val) {
        carModel = val;
      },
      icon: Icons.directions_car_filled,
      height: 200,
    );
    DropdownSearchCastom carColorDropDown = DropdownSearchCastom(
      items: carColors,
      getValue: (val) {
        carColor = val;
      },
      icon: Icons.directions_car_filled,
      height: 200,
    );
    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Озгина қолди",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Заполните данные авто Их вам нужно заполнить один раз, далее приложение запомнить ваши данные",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff646464),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Автомобил модели",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff262626),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                carModelDropDown,
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Давлат автомобил рақами",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff262626),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: carNumberController,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      fillColor: cinputColor,
                      filled: true,
                      hintText: '01V743JB',
                      hintStyle: TextStyle(
                        color: cclueColor,
                        fontSize: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: cinputColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cinputColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(
                        Icons.directions_car,
                        color: cclueColor,
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Автомобил ранги",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff262626),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                carColorDropDown,
                SizedBox(
                  height: 40,
                ),
                button(
                  text: "Кейингиси",
                  color: caccentColor,
                  onPressed: () async {
                    //car number I will waliadate it throve forloop
                    if (carModel == "") {
                      Get.snackbar(
                        "Moshinani Modelini tekshiring",
                        "iltimos",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: cerrorColor,
                        colorText: cwhiteColor,
                      );
                    } else {
                      String carNumber = carNumberController.text;
                      RegExp regExp =
                          new RegExp(r'^[0-9]{2}[A-Z]{1}[0-9]{3}[A-Z]{2}$');
                      // Iterable<Match> matches = regExp.allMatches(carNumber);
                      if (!(regExp.hasMatch(carNumber))) {
                        Get.snackbar(
                          "Moshinani nomeri notogri yozilgan",
                          "iltimos",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: cerrorColor,
                          colorText: cwhiteColor,
                        );
                      } else {
                        if (carColor == "") {
                          Get.snackbar(
                            "Moshiani rangini tanlang",
                            "iltimos",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: cerrorColor,
                            colorText: cwhiteColor,
                          );
                        } else {
                          LocalMemory.saveDataString("carModel", carModel);
                          LocalMemory.saveDataString("carColor", carColor);
                          LocalMemory.saveDataString(
                              "carNumber", carNumberController.text);
                          Get.defaultDialog(
                              title: "",
                              content: SizedBox(
                                // margin: EdgeInsets.symmetric(horizontal: 100),
                                width: MediaQuery.of(context).size.width,
                                // width: double.infinity,
                                child: Column(
                                  children: [
                                    SvgPicture.asset('images/ptichka.svg'),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Text(
                                      "Табриклаймиз!",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                          color: cdarkTextColor),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Сиз рўйхатдан ўтдингиз",
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
                                          //Saving the rating of driver
                                          LocalMemory.saveDataString(
                                              "rating", "0");
                                          Map driverInfo = LocalMemory
                                              .getDriverRegisterInfo();
                                          print(driverInfo);

                                          Api.addDriver(driverInfo);
                                          LocalMemory.saveDataString(
                                              "doesUserHaveAccount", "true");

                                          Get.offAll(ChoosePlace());
                                        })
                                  ],
                                ),
                              ));
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';

import '../../Server/Api.dart';
import '../../consts/castem_widgets_const.dart';
import '../../consts/filtering_const.dart';
import '../../controller/LocalMemory.dart';
import '../driverOrPassenger_screen.dart';

class DriverAccountEdit extends StatefulWidget {
  const DriverAccountEdit({super.key});

  @override
  State<DriverAccountEdit> createState() => _DriverAccountEditState();
}

class _DriverAccountEditState extends State<DriverAccountEdit> {
  final nameController = TextEditingController();
  String carModel = " ";
  String carColor = " ";
  TextEditingController carNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DropdownSearchCastom carModelDropDown = DropdownSearchCastom(
      items: autoChevroletOptions,
      getValue: (val) {
        carModel = val;
      },
      icon: Icons.directions_car_filled,
      height: 200,
    );
    DropdownSearchCastom carColorDropDown = DropdownSearchCastom(
      items: autoChevroletOptions,
      getValue: (val) {
        carColor = val;
      },
      icon: Icons.directions_car_filled,
      height: 200,
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Бекор қилиш",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        //api check if empy I will not include it to Map
                        Map<String, String> data = {};
                        if (nameController.text != " ") {
                          LocalMemory.saveDataString(
                              "name", nameController.text);
                          data["name"] = nameController.text;
                        }
                        if (carNumberController.text != " ") {
                          LocalMemory.saveDataString(
                              "carNumber", carNumberController.text);
                          data["carNumber"] = carNumberController.text;
                        }
                        if (carModel != " ") {
                          LocalMemory.saveDataString("carModel", carModel);
                          data["carModel"] = carModel;
                        }

                        if (carColor != " ") {
                          LocalMemory.saveDataString("carColor", carColor);
                          data["carColor"] = carColor;
                        }

                        data["phoneNumber"] =
                            LocalMemory.getValue("phoneNumber");
                        Api.updateDriver(data);
                        Get.to(ChoosePlace());
                        //then you should write them to Local memory
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: caccentColor,
                        padding: EdgeInsets.all(10.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        "Тайёр",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffD0D0D0),
                  ),
                  child: Center(
                    child: Icon(Icons.photo_camera),
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      fillColor: cinputColor,
                      filled: true,
                      hintText: 'Исмингиз нима?',
                      hintStyle: TextStyle(color: cclueColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: cinputColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cinputColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: cclueColor,
                      )),
                ),
                SizedBox(
                  height: 24,
                ),
                Text("Илтимос, ҳақиқий исмингизни киритинг",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: caccentColor,
                    )),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Телефон рақамини ўзгартиринг",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff262626),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onTap: () {
                    Get.defaultDialog(
                        title: "",
                        content: SizedBox(
                          // margin: EdgeInsets.symmetric(horizontal: 100),
                          width: MediaQuery.of(context).size.width,
                          // width: double.infinity,
                          child: Column(
                            children: [
                              SvgPicture.asset('images/exklamashinMark.svg'),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Номерри озгартириб бомиди",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: cdarkTextColor),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              button(
                                  text: "Янги аккаунтни синаи кўринг",
                                  color: caccentColor,
                                  onPressed: () async {
                                    LocalMemory.clearAll();
                                    Get.to(DriverOrPassenger());
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              buttonBorder(
                                  "Бекор қилиш",
                                  () => {
                                        Navigator.pop(context),
                                      })
                            ],
                          ),
                        ));
                  },
                  readOnly: true,
                  // controller: phoneController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: LocalMemory.getValue("phoneNumber"),
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
                ),
                SizedBox(
                  height: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      "Автомобил рақами",
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
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    LocalMemory.clearAll();
                    Get.to(DriverOrPassenger());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cerrorSubstrateColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  icon: Icon(
                    Icons.logout,
                    color: cwhiteColor,
                  ),
                  label: Text(
                    "Профилдан чиқиш",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

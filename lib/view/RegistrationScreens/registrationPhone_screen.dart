import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/RegistrationScreens/registrationOtp_screen.dart';
import 'package:vodiy_petak_alpha_project/view/RegistrationScreens/registration_password.dart';
import 'package:vodiy_petak_alpha_project/view/loginOrRegistration_screen.dart';

import '../../Server/Api.dart';
import '../../consts/methods_const.dart';
import '../../controller/LocalMemory.dart';

class RegistrationPhone extends StatefulWidget {
  RegistrationPhone({super.key});

  @override
  State<RegistrationPhone> createState() => _RegistrationPhoneState();
}

class _RegistrationPhoneState extends State<RegistrationPhone> {
  final formKey = GlobalKey<FormState>();
  Color buttonColor = cnonWorkingColor;
  bool isButtonAvalible = false;
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Телефон рақамингизни киритинг",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  "Рақамингизни тасдиқлаш учун сизга код юборамиз",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: cclueColor,
                  ),
                ),
                const SizedBox(
                  height: 16.0,
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
                            )),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (v) {
                          if (v.isEmpty || !(v.length >= 9) || v.length > 9) {
                            setState(() {
                              buttonColor = cnonWorkingColor;
                              isButtonAvalible = false;
                            });
                          } else {
                            setState(() {
                              buttonColor = caccentColor;
                              isButtonAvalible = true;
                              phoneNumber = v;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      button(
                        text: "Кейингиси",
                        color: buttonColor,
                        onPressed: () async {
                          if (isButtonAvalible) {
                            if (LocalMemory.getValue("user") == "passenger" &&
                                LocalMemory.getValue("entariPoint") ==
                                    "login") {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              if (await Api.isUserPhoneExistInDB(
                                  "+998" + phoneNumber)) {
                                Navigator.pop(context);
                                Get.to(() => PasswordRegistration(),
                                    arguments: phoneNumber);
                              } else {
                                Navigator.pop(context);
                                //number do not exist in database
                                Get.defaultDialog(
                                    title: "",
                                    content: SizedBox(
                                      // margin: EdgeInsets.symmetric(horizontal: 100),
                                      width: MediaQuery.of(context).size.width,
                                      // width: double.infinity,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'images/exklamashinMark.svg'),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Text(
                                            "Hato bu nomer yoq dbda!",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: cdarkTextColor),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Вы успешно зарегистрировались",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: cworkingHintColor),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          button(
                                              text: "Try agina",
                                              color: caccentColor,
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          buttonBorder(
                                              "Register",
                                              () => {
                                                    Get.to(
                                                        LoginOrRegistration())
                                                  })
                                        ],
                                      ),
                                    ));
                              }
                            } else if (LocalMemory.getValue("user") ==
                                    "passenger" &&
                                LocalMemory.getValue("entariPoint") ==
                                    "registration") {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              if (await Api.isDriverPhoneExistInDB(
                                  "+998" + phoneNumber)) {
                                Navigator.pop(context);
                                Get.defaultDialog(
                                    title: "",
                                    content: SizedBox(
                                      // margin: EdgeInsets.symmetric(horizontal: 100),
                                      width: MediaQuery.of(context).size.width,
                                      // width: double.infinity,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'images/exklamashinMark.svg'),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Text(
                                            "Терган рақамингиз рўйҳатдан ўтилган!",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: cdarkTextColor),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Системага рақамингиз орқали киринг ёки бошқа рақам билан рўйҳатдан ўтинг",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: cworkingHintColor),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          button(
                                              text: "Try agina",
                                              color: caccentColor,
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          buttonBorder(
                                              "Register",
                                              () => {
                                                    Get.to(
                                                        LoginOrRegistration())
                                                  })
                                        ],
                                      ),
                                    ));
                              } else {
                                Navigator.pop(context);
                                Get.to(() => PasswordRegistration(),
                                    arguments: phoneNumber);
                              }
                            }

                            if (LocalMemory.getValue("user") == "driver" &&
                                LocalMemory.getValue("entariPoint") ==
                                    "login") {
                              // cheking if number exist in database of passanges
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });

                              if (await Api.isDriverPhoneExistInDB(
                                  "+998" + phoneNumber)) {
                                Navigator.pop(context);
                                Get.to(() => PasswordRegistration(),
                                    arguments: phoneNumber);
                              } else {
                                //number do not exist in database
                                Navigator.pop(context);
                                Get.defaultDialog(
                                    title: "",
                                    content: SizedBox(
                                      // margin: EdgeInsets.symmetric(horizontal: 100),
                                      width: MediaQuery.of(context).size.width,
                                      // width: double.infinity,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'images/exklamashinMark.svg'),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Text(
                                            "Hato bu nomer yoq dbda!",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: cdarkTextColor),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Вы успешно зарегистрировались",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: cworkingHintColor),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          button(
                                              text: "Try agina",
                                              color: caccentColor,
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          buttonBorder(
                                              "Register",
                                              () => {
                                                    Get.to(
                                                        LoginOrRegistration())
                                                  })
                                        ],
                                      ),
                                    ));
                              }
                            } else if (LocalMemory.getValue("user") ==
                                    "driver" &&
                                LocalMemory.getValue("entariPoint") ==
                                    "registration") {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  });
                              if (await Api.isDriverPhoneExistInDB(
                                  "+998" + phoneNumber)) {
                                // Navigator.pop(context);
                                Navigator.pop(context);
                                Get.defaultDialog(
                                    title: "",
                                    content: SizedBox(
                                      // margin: EdgeInsets.symmetric(horizontal: 100),
                                      width: MediaQuery.of(context).size.width,
                                      // width: double.infinity,
                                      child: Column(
                                        children: [
                                          SvgPicture.asset(
                                              'images/exklamashinMark.svg'),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          Text(
                                            "Терган рақамингиз рўйҳатдан ўтилган!",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: cdarkTextColor),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Системага рақамингиз орқали киринг ёки бошқа рақам билан рўйҳатдан ўтинг",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: cworkingHintColor),
                                          ),
                                          SizedBox(
                                            height: 24,
                                          ),
                                          button(
                                              text: "Try agina",
                                              color: caccentColor,
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              }),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          buttonBorder(
                                              "Register",
                                              () => {
                                                    Get.to(
                                                        LoginOrRegistration())
                                                  })
                                        ],
                                      ),
                                    ));
                              } else {
                                //number do not exist in database
                                Navigator.pop(context);
                                Get.to(() => PasswordRegistration(),
                                    arguments: phoneNumber);
                              }
                            }

                            // Get.to(() => RegistrationOtp(),
                            //     arguments: [phoneNumber]);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Давом этиш орқали сиз фойдаланувчи шартномаси ва махфийлик сиёсати шартларини қабул қиласиз",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: cclueColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

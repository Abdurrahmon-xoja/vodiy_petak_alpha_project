import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/RegistrationScreens/CarRegistration_screen.dart';
import '../../Server/Api.dart';
import '../../consts/colors_const.dart';
import '../../controller/LocalMemory.dart';

class RegistrationSex extends StatefulWidget {
  const RegistrationSex({super.key});

  @override
  State<RegistrationSex> createState() => _RegistrationSexState();
}

class _RegistrationSexState extends State<RegistrationSex> {
  Color maleInputColor = cinputColor;
  Color maleInputTextColor = cclueColor;
  bool maleInputCliced = false;

  Color fmaleInputColor = cinputColor;
  Color fmaleInputTextColor = cclueColor;
  bool fmaleInputCliced = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Пожалуйста, укажите свой пол",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      // controller: _dateController,
                      decoration: InputDecoration(
                          fillColor: maleInputColor,
                          filled: true,
                          hintText: 'Женский',
                          hintStyle: TextStyle(color: maleInputTextColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: cinputColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: cinputColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffixIcon: Icon(
                            Icons.chevron_right,
                            color: maleInputTextColor,
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: maleInputTextColor,
                          )),

                      readOnly: true,
                      onTap: () {
                        setState(() {
                          if (!maleInputCliced) {
                            maleInputColor = caccentColor;
                            maleInputTextColor = cwhiteColor;
                            maleInputCliced = !maleInputCliced;

                            fmaleInputColor = cinputColor;
                            fmaleInputTextColor = cclueColor;
                            fmaleInputCliced = !maleInputCliced;
                          } else {
                            maleInputColor = cinputColor;
                            maleInputTextColor = cclueColor;
                            maleInputCliced = !maleInputCliced;

                            fmaleInputColor = caccentColor;
                            fmaleInputTextColor = cwhiteColor;
                            fmaleInputCliced = !maleInputCliced;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      // controller: _dateController,
                      decoration: InputDecoration(
                          fillColor: fmaleInputColor,
                          filled: true,
                          hintText: 'Мужской',
                          hintStyle: TextStyle(color: fmaleInputTextColor),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: cinputColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: cinputColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          suffixIcon: Icon(
                            Icons.chevron_right,
                            color: fmaleInputTextColor,
                          ),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: fmaleInputTextColor,
                          )),

                      readOnly: true,
                      onTap: () {
                        setState(() {
                          if (!fmaleInputCliced) {
                            fmaleInputColor = caccentColor;
                            fmaleInputTextColor = cwhiteColor;
                            fmaleInputCliced = !maleInputCliced;

                            maleInputColor = cinputColor;
                            maleInputTextColor = cclueColor;
                            maleInputCliced = !maleInputCliced;
                          } else {
                            fmaleInputColor = cinputColor;
                            fmaleInputTextColor = cclueColor;
                            fmaleInputCliced = !maleInputCliced;

                            maleInputColor = caccentColor;
                            maleInputTextColor = cwhiteColor;
                            maleInputCliced = !maleInputCliced;
                          }
                        });
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    button(
                        text: "Далее",
                        color: caccentColor,
                        onPressed: () async {
                          if (maleInputCliced) {
                            await LocalMemory.saveDataString("sex", "male");
                          } else {
                            await LocalMemory.saveDataString("sex", "female");
                          }

                          if (LocalMemory.getValue("user") != "driver") {
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
                                        "Поздравляем!",
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
                                          text: "Продолжить",
                                          color: caccentColor,
                                          onPressed: () async {
                                            Map driverInfo = await LocalMemory
                                                .getDriverRegisterInfo();
                                            print(driverInfo);
                                            Api.addDriver(driverInfo);
                                            Get.to(() => ChoosePlace());
                                          })
                                    ],
                                  ),
                                ));
                          } else {
                            Get.to(() => CarRegistration());
                          }
                        }),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

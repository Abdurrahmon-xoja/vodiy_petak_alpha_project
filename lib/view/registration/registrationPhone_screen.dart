import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/registration/registrationOtp_screen.dart';

import '../../consts/methods_const.dart';

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
      appBar: cDefoltAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Введите номер телефона",
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
                  "Мы пришлем вам код, чтобы подтвердить номер",
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
                          if (v.isEmpty || !(v.length >= 9)) {
                            print("not going to work");
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
                        text: "Далее",
                        color: buttonColor,
                        onPressed: () {
                          if (isButtonAvalible) {
                            //TODO: need to go otp screen and get number
                            Get.to(RegistrationOtp(), arguments: [phoneNumber]);
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
                  "Продолжая, вы принимаете условия пользовательского соглашения и политики конфиденциальности",
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

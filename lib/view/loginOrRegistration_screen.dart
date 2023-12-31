import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

import 'RegistrationScreens/registrationPhone_screen.dart';

class LoginOrRegistration extends StatelessWidget {
  const LoginOrRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        backgroundColor: caccent2Color,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: caccent2Color,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Междугородние поездки с максимальным удобством для вас",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: cwhiteColor,
                        fontSize: 24,
                      ),
                    ),
                    SvgPicture.asset('images/Character.svg'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    button(
                      text: "Войти ",
                      color: caccentColor,
                      onPressed: () {},
                    ),
                    SizedBox(height: 15.0),
                    buttonBorder("Зарегистрироваться", () {
                      Get.to(RegistrationPhone());
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

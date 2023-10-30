import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/registration/registrationAge_screen.dart';

class RegistrationNameAndEmail extends StatelessWidget {
  const RegistrationNameAndEmail({super.key});

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
                Text(
                  "Заполните профиль (optional)",
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
                        // controller: nameController,
                        decoration: InputDecoration(
                            fillColor: cinputColor,
                            filled: true,
                            hintText: 'Как вас зовут?',
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
                        height: 16,
                      ),
                      TextFormField(
                        // controller: nameController,
                        decoration: InputDecoration(
                            fillColor: cinputColor,
                            filled: true,
                            hintText: 'Ваш email (optional)',
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
                              Icons.email,
                              color: cclueColor,
                            )),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      button(
                          text: "Далее",
                          color: caccentColor,
                          onPressed: () {
                            //TODO: add validation for email ana chake for empty and aother staff
                            Get.to(RegistrationAge());
                          }),
                    ],
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

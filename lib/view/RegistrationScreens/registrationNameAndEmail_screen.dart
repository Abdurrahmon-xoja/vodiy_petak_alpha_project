import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/RegistrationScreens/registrationAge_screen.dart';

import '../../controller/LocalMemory.dart';

class RegistrationNameAndEmail extends StatelessWidget {
  const RegistrationNameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();

    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Профилингизни тўлдиринг",
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
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty ||
                              !RegExp(r'[a-z A-z]+$').hasMatch(val)) {
                            return "Name should not contain";
                          } else {
                            return null;
                          }
                        },
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
                        height: 16,
                      ),
                      // we he need this
                      TextFormField(
                        // controller: nameController,
                        decoration: InputDecoration(
                            fillColor: cinputColor,
                            filled: true,
                            hintText: 'Электрон почтангиз(ихтиёрий)',
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
                          text: "Кейингиси",
                          color: caccentColor,
                          onPressed: () async {
                            //TODO: add validation for email ana chake for empty and aother staff
                            // saveDataString("name", nameController.text);
                            if (formKey.currentState!.validate()) {
                              LocalMemory.saveDataString(
                                  "name", nameController.text);
                              Get.to(() => RegistrationAge());
                            }
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

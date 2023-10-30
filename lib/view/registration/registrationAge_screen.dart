import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/registration/registrationSex_screen.dart';

import '../../consts/colors_const.dart';

class RegistrationAge extends StatefulWidget {
  const RegistrationAge({super.key});

  @override
  State<RegistrationAge> createState() => _RegistrationAgeState();
}

class _RegistrationAgeState extends State<RegistrationAge> {
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? _pickedDAte = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1700),
      lastDate: DateTime(2100),
    );

    if (_pickedDAte != null) {
      setState(() {
        _dateController.text =
            _pickedDAte.toString().split(" ")[0].replaceAll("-", "/");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Когда вы родились?",
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
                    controller: _dateController,
                    decoration: InputDecoration(
                        fillColor: cinputColor,
                        filled: true,
                        hintText: 'ДД/ММ/ГГГГ',
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
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  button(
                      text: "Далее",
                      color: caccentColor,
                      onPressed: () {
                        Get.to(RegistrationSex());
                      }),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/registration/registrationNameAndEmail_screen.dart';

class RegistrationOtp extends StatefulWidget {
  const RegistrationOtp({super.key});

  @override
  State<RegistrationOtp> createState() => _RegistrationOtpState();
}

class _RegistrationOtpState extends State<RegistrationOtp> {
  Color buttonColor = cnonWorkingColor;
  Color codeContainersColor = cclueColor;
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
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Введите код",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Мы отправили вам код на номер ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: cclueColor,
                  ),
                ),
                Text(
                  "+998 " + Get.arguments[0],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: cclueColor,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                OtpTextField(
                  numberOfFields: 4,
                  fillColor: codeContainersColor,
                  filled: true,
                  borderColor: cinputColor,
                  focusedBorderColor: caccentColor,
                  borderWidth: 6.0,
                  onSubmit: (code) {
                    setState(() {
                      buttonColor = caccentColor;
                    });
                    // here going to chaked
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                button(
                    text: "Далее",
                    color: buttonColor,
                    onPressed: () {
                      Get.to(RegistrationNameAndEmail());
                      // setState(() {
                      //   codeContainersColor = cerrorColor;
                      // });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

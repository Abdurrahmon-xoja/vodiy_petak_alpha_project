import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/RegistrationScreens/registrationNameAndEmail_screen.dart';

import '../../Server/Api.dart';
import '../../controller/LocalMemory.dart';

class RegistrationOtp extends StatefulWidget {
  const RegistrationOtp({super.key});

  @override
  State<RegistrationOtp> createState() => _RegistrationOtpState();
}

class _RegistrationOtpState extends State<RegistrationOtp> {
  late String phoneNumber;
  Color buttonColor = cnonWorkingColor;
  Color codeContainersColor = cclueColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumber = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Кодни киритинг",
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
                  "Биз сизнинг рақамингизга код юбордик",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: cclueColor,
                  ),
                ),
                Text(
                  "+998 " + phoneNumber,
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
                    text: "Кейингиси",
                    color: buttonColor,
                    onPressed: () async {
                      // Get.to(RegistrationNameAndEmail());
                      // TODO: need to che otp sms was correct or not
                      if (LocalMemory.getValue("user") == "passenger" &&
                          LocalMemory.getValue("entariPoint") == "login") {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                        //getting user information from db and saving it in LocalMemory
                        Map data = await Api.getUserAccountInfoFromPhone(
                            "+998" + phoneNumber);
                        LocalMemory.saveDataString("name", data["name"]);
                        LocalMemory.saveDataString("dateOfBirth", data["age"]);
                        LocalMemory.saveDataString(
                            "phoneNumber", data["phoneNumber"]);
                        LocalMemory.saveDataString("sex", data["sex"]);
                        LocalMemory.saveDataString("user", "passenger");
                        Navigator.pop(context);
                        Get.offAll(ChoosePlace());
                        LocalMemory.saveDataString(
                            "doesUserHaveAccount", "true");
                        // save data
                      } else if (LocalMemory.getValue("user") == "passenger" &&
                          LocalMemory.getValue("entariPoint") ==
                              "registration") {
                        LocalMemory.saveDataString(
                            "phoneNumber", "+998" + phoneNumber);
                        Get.to(RegistrationNameAndEmail());
                      }

                      if (LocalMemory.getValue("user") == "driver" &&
                          LocalMemory.getValue("entariPoint") == "login") {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                        Map data = await Api.getDriverAccountInfoFromPhone(
                            "+998" + phoneNumber);

                        print(data);
                        print("-----------");
                        print(data['rating']);

                        LocalMemory.saveDataString("rating", data["rating"]);
                        LocalMemory.saveDataString("name", data["name"]);
                        LocalMemory.saveDataString("dateOfBirth", data["age"]);
                        LocalMemory.saveDataString(
                            "phoneNumber", data["phoneNumber"]);
                        LocalMemory.saveDataString("sex", data["sex"]);
                        LocalMemory.saveDataString(
                            "carModel", data["carModel"]);
                        LocalMemory.saveDataString(
                            "carColor", data["carColor"]);
                        LocalMemory.saveDataString(
                            "carNumber", data["carNumber"]);
                        LocalMemory.saveDataString("user", "driver");

                        Navigator.pop(context);
                        Get.offAll(ChoosePlace());
                        LocalMemory.saveDataString(
                            "doesUserHaveAccount", "true");
                      } else if (LocalMemory.getValue("user") == "driver" &&
                          LocalMemory.getValue("entariPoint") ==
                              "registration") {
                        LocalMemory.saveDataString(
                            "phoneNumber", "+998" + phoneNumber);
                        Get.to(RegistrationNameAndEmail());
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

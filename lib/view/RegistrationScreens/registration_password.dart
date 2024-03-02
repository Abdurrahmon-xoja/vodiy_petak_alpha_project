import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/RegistrationScreens/registrationNameAndEmail_screen.dart';

import '../../Server/Api.dart';
import '../../consts/colors_const.dart';
import '../../controller/LocalMemory.dart';
import '../OrderUser/ChoosePlace_screen.dart';

class PasswordRegistration extends StatefulWidget {
  const PasswordRegistration({super.key});

  @override
  State<PasswordRegistration> createState() => _PasswordRegistrationState();
}

class _PasswordRegistrationState extends State<PasswordRegistration> {
  bool isButtonAvalibel = false;
  final passwordController = TextEditingController();
  late String phoneNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneNumber = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(() => Get.back()),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Кодни киритинг",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: cdarkTextColor,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(LocalMemory.getValue("entariPoint") == "login"
                  ? "Аввалги 4 рақамли кодни киритинг"
                  : "4 рақамли кодни киритинг"),

              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: cinputColor,
                  hintText: "Кодни шу йерга киритинг",
                  hintStyle: TextStyle(color: cnonWorkingColor),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: cinputColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: cinputColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (v) {
                  if (passwordController.text.length == 4) {
                    setState(() {
                      isButtonAvalibel = true;
                    });
                  } else {
                    setState(() {
                      isButtonAvalibel = false;
                    });
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              button(
                  text: "Кейингиси",
                  color: isButtonAvalibel ? caccentColor : cnonWorkingColor,
                  onPressed: () async {
                    if (isButtonAvalibel) {
                      // I am shore I will add code here
                      if (LocalMemory.getValue("user") == "passenger" &&
                          LocalMemory.getValue("entariPoint") == "login") {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                        bool isUsersPasswordCorrect =
                            await Api.isUserssPasswordCorrect({
                          'phoneNumber': "+998" + phoneNumber,
                          'password': passwordController.text,
                        });
                        if (isUsersPasswordCorrect) {
                          //getting user information from db and saving it in LocalMemory
                          Map data = await Api.getUserAccountInfoFromPhone(
                              "+998" + phoneNumber);
                          LocalMemory.saveDataString("name", data["name"]);
                          LocalMemory.saveDataString(
                              "dateOfBirth", data["age"]);
                          LocalMemory.saveDataString(
                              "phoneNumber", data["phoneNumber"]);
                          LocalMemory.saveDataString("sex", data["sex"]);
                          LocalMemory.saveDataString("user", "passenger");
                          Navigator.pop(context);
                          Get.offAll(ChoosePlace());
                          LocalMemory.saveDataString(
                              "doesUserHaveAccount", "true");
                        } else {
                          Navigator.pop(context);
                          Get.snackbar(
                            "Password is in correct",
                            "it is in correct",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: cerrorColor,
                            colorText: cwhiteColor,
                          );
                        }

                        // save data
                      } else if (LocalMemory.getValue("user") == "passenger" &&
                          LocalMemory.getValue("entariPoint") ==
                              "registration") {
                        LocalMemory.saveDataString(
                            "phoneNumber", "+998" + phoneNumber);
                        LocalMemory.saveDataString(
                            "password", passwordController.text);
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
                        // Api request if trye get data if not show snakbar
                        bool isDriversPasswordCorrect =
                            await Api.isDriversPasswordCorrect({
                          'phoneNumber': "+998" + phoneNumber,
                          'password': passwordController.text,
                        });
                        if (isDriversPasswordCorrect) {
                          Map data = await Api.getDriverAccountInfoFromPhone(
                              "+998" + phoneNumber);

                          print(data);

                          LocalMemory.saveDataString("rating", data["rating"]);
                          LocalMemory.saveDataString("name", data["name"]);
                          LocalMemory.saveDataString(
                              "dateOfBirth", data["age"]);
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
                        } else {
                          Navigator.pop(context);
                          Get.snackbar(
                            "Password is in correct",
                            "it is in correct",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: cerrorColor,
                            colorText: cwhiteColor,
                          );
                        }
                      } else if (LocalMemory.getValue("user") == "driver" &&
                          LocalMemory.getValue("entariPoint") ==
                              "registration") {
                        LocalMemory.saveDataString(
                            "phoneNumber", "+998" + phoneNumber);
                        LocalMemory.saveDataString(
                            "password", passwordController.text);
                        Get.to(RegistrationNameAndEmail());
                      }
                    } else {
                      Get.snackbar(
                        "4 digit bolishi ker",
                        "iltimos ohirgacha toldirila",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: cerrorColor,
                        colorText: cwhiteColor,
                      );
                    }
                  }),
              //button
            ],
          ),
        ),
      ),
    );
  }
}

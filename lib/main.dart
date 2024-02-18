import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/DriverOrderScreen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/ChoosePlace_screen.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/OrderScreenDelivary.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/OrderScreenPassenger.dart';
import 'package:vodiy_petak_alpha_project/view/driverOrPassenger_screen.dart';

import 'controller/LocalMemory.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //do not use land scape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocalMemory.init();

  runApp(const MyApp()); /**/
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    checkAccount();
  }

  checkAccount() async {
    await LocalMemory.init();

    if (LocalMemory.getValue("doesUserHaveAccount") == "true") {
      if (LocalMemory.getValue("doesDriverHaveOrder") == "true") {
        Get.off(() => DriverOrderScreen());
      } else if (LocalMemory.getValue("doesUserHasOrderPassenger") == "true") {
        if (LocalMemory.getValue("driverSeorchs") == "passengers") {
          Get.off(() => OrderScreenPassenger());
        } else {
          Get.off(() => OrderScreenDelivary());
        }
      } else {
        Get.off(() => ChoosePlace());
      }
    } else {
      Get.off(() => DriverOrPassenger());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/WillTakePassangers.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/Cards_screem.dart';

import '../../consts/filtering_const.dart';
import '../OrderUser/BottomSliderPriceAndTime.dart';
import 'BottomSliderPriceChoose.dart';

class SizeAndPrice extends StatefulWidget {
  const SizeAndPrice({super.key});

  @override
  State<SizeAndPrice> createState() => _SizeAndPriceState();
}

class _SizeAndPriceState extends State<SizeAndPrice> {
  List<bool> seatsBool = List.generate(goodsSizedName.length, (index) => false);
  List<double> seatsPrice =
      List.generate(goodsSizedName.length, (index) => 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                "Қандай йетказма ўлчамларини олишингиз мумкин?",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor),
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                children: goodsSize(),
              ),
              SizedBox(
                height: 16.0,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: button(
                      text: "Кейингиси",
                      color: caccentColor,
                      onPressed: () async {
                        if (seatsBool.every((element) => element == false)) {
                          Get.snackbar(
                            "Bittasini tanla",
                            "Iltimos",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: cerrorColor,
                            colorText: cwhiteColor,
                          );
                        } else {
                          LocalMemory.setDeliveryPriceAndSeats(
                            seatsBool,
                            seatsPrice,
                          );
                          Get.to(() => WillTakePassangers());
                        }
                      }),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> goodsSize() {
    double getResult = 0.0;
    // BottomSliderPriceChooser priceChooser = ;
    List<Widget> result = List.generate(
      goodsSizedName.length,
      (index) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              builder: (BuildContext context) {
                return BottomSliderPriceChooser(
                  getValue: (val) {
                    setState(() {
                      if (val == 0) {
                        seatsBool[index] = false;
                        seatsPrice[index] = 0;
                      } else {
                        seatsBool[index] = true;
                        seatsPrice[index] = val;
                      }
                    });
                  },
                );
              });
          // setState(() {
          //   seatsBool[index] = !seatsBool[index];
          // });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          margin: EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: seatsBool[index]
                ? Border.all(color: caccentColor, width: 1)
                : Border.all(color: cworkingHintColor, width: 1),
            color: seatsBool[index] ? caccentBackingColor : cinputColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    goodsSizedName[index],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: seatsBool[index] ? caccentColor : cclueColor,
                    ),
                  ),
                  Text(
                    goodsSizedDefinition[index],
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: seatsBool[index] ? caccentColor : cclueColor,
                    ),
                  ),
                ],
              ),
              Text(
                seatsPrice[index] > 0
                    ? NumberFormat('###,###', 'en_US')
                        .format(seatsPrice[index])
                        .replaceAll(',', ' ')
                    : " ",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: seatsBool[index] ? caccentColor : cclueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return result;
  }
}

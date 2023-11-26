import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/Cards_screem.dart';

import '../../consts/filtering_const.dart';
import '../OrderUser/BottomSliderPriceAndTime.dart';
import 'BottomSliderPriceChoose.dart';

class PlaceAndPrice extends StatefulWidget {
  const PlaceAndPrice({super.key});

  @override
  State<PlaceAndPrice> createState() => _PlaceAndPriceState();
}

class _PlaceAndPriceState extends State<PlaceAndPrice> {
  List<bool> seatsBool = List.generate(goodsSizedName.length, (index) => false);
  List<double> seatsPrice =
      List.generate(goodsSizedName.length, (index) => 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(),
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
                "Какие габариты доставки сможете взять?",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor),
              ),
              SizedBox(
                height: 16.0,
              ),
              Column(
                children: reasons(),
              ),
              SizedBox(
                height: 16.0,
              ),
              button(
                text: "Next",
                color: caccentColor,
                onPressed: () {
                  //here to memory save and to next screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> reasons() {
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
          setState(() {
            seatsBool[index] = !seatsBool[index];
          });
          print(getResult);
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

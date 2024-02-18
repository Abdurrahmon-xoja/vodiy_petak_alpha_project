import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';
import 'package:vodiy_petak_alpha_project/controller/LocalMemory.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/AirConditiningAndFuelType.dart';
import 'package:vodiy_petak_alpha_project/view/DriverScreens/BottomSliderNumberOfSeats.dart';

import '../../consts/filtering_const.dart';
import 'BottomSliderPriceChoose.dart';

class SeatsChoose extends StatefulWidget {
  const SeatsChoose({super.key});

  @override
  State<SeatsChoose> createState() => _SeatsChooseState();
}

class _SeatsChooseState extends State<SeatsChoose> {
  List<bool> seatsBool = List.generate(sitsePlcaeName.length, (index) => false);
  List<double> seatsPrice = List.generate(sitsePlcaeName.length, (index) => 0);

  int numOfAddSeats = 0;
  List<bool> additionalSeatsBool = List.generate(0, (index) => false);
  List<double> additionalSeatsPrice = List.generate(0, (index) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(() {
        Get.back();
      }),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Сизда қандай ўриндиқлар бош?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: seats(),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextButton(
                  onPressed: () {
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
                          return BottomSliderNumberOfSeats(
                            getValue: (val) {
                              setState(() {
                                numOfAddSeats = val;
                                additionalSeatsBool = List.generate(
                                    numOfAddSeats, (index) => false);
                                additionalSeatsPrice =
                                    List.generate(numOfAddSeats, (index) => 0);
                              });
                            },
                          );
                        });
                  },
                  child: Text("Қўшимча ўриндиқ қўшиш"),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Column(
                  children: addSeats(),
                ),
                SizedBox(
                  height: 20,
                ),
                button(
                  text: "Кейингиси",
                  color: caccentColor,
                  onPressed: () {
                    if (seatsBool.every((element) => element == false) &&
                        additionalSeatsBool
                            .every((element) => element == false)) {
                      Get.snackbar(
                        "Bittasini tanla",
                        "Iltimos",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: cerrorColor,
                        colorText: cwhiteColor,
                      );
                    } else {
                      LocalMemory.setPassengerPriceAndSeats(
                          seatsBool, seatsPrice);
                      LocalMemory.setAddPassengerPriceAndSeats(
                          additionalSeatsBool, additionalSeatsPrice);
                      Get.to(() => AirConditingAndFuelType());
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> seats() {
    // BottomSliderPriceChooser priceChooser = ;
    List<Widget> result = List.generate(
      sitsePlcaeName.length,
      (index) => GestureDetector(
        onTap: () {
          setState(() {
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
          });
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
              Text(
                sitsePlcaeName[index],
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: seatsBool[index] ? caccentColor : cclueColor,
                ),
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

  List<Widget> addSeats() {
    print(additionalSeatsBool);
    List<Widget> result = List.generate(
      numOfAddSeats,
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
                        additionalSeatsBool[index] = false;
                        additionalSeatsPrice[index] = 0;
                      } else {
                        additionalSeatsBool[index] = true;
                        additionalSeatsPrice[index] = val;
                      }
                    });
                  },
                );
              });
          // setState(() {
          //   additionalSeatsBool[index] = !additionalSeatsBool[index];
          // });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          margin: EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: additionalSeatsBool[index]
                ? Border.all(color: caccentColor, width: 1)
                : Border.all(color: cworkingHintColor, width: 1),
            color:
                additionalSeatsBool[index] ? caccentBackingColor : cinputColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "plca " + (index + 1).toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: additionalSeatsBool[index] ? caccentColor : cclueColor,
                ),
              ),
              Text(
                additionalSeatsPrice[index] > 0
                    ? NumberFormat('###,###', 'en_US')
                        .format(additionalSeatsPrice[index])
                        .replaceAll(',', ' ')
                    : " ",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: additionalSeatsBool[index] ? caccentColor : cclueColor,
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

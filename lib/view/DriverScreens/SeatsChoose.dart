import 'package:flutter/material.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';

import '../../consts/filtering_const.dart';

class SeatsChoose extends StatefulWidget {
  const SeatsChoose({super.key});

  @override
  State<SeatsChoose> createState() => _SeatsChooseState();
}

class _SeatsChooseState extends State<SeatsChoose> {
  List<bool> seatsBool = List.generate(sitsePlcaeName.length, (index) => false);
  int some = 0;
  List<bool> additionalSeatsBool = List.generate(0, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Какие места у вас свободны? ",
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
                  onPressed: () {},
                  child: Text("Add a places"),
                ),
                SizedBox(
                  height: 16.0,
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
            seatsBool[index] = !seatsBool[index];
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
                " ",
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

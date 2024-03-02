import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';

import '../../consts/colors_const.dart';

class BottomSliderNumberOfSeats extends StatefulWidget {
  final Function(int) getValue;

  BottomSliderNumberOfSeats({required this.getValue});

  @override
  State<BottomSliderNumberOfSeats> createState() =>
      _BottomSliderNumberOfSeatsState();
}

class _BottomSliderNumberOfSeatsState extends State<BottomSliderNumberOfSeats> {
  int seatsNumber = 0;
  @override
  Widget build(BuildContext context) {
    var stringPrice = NumberFormat('###,###', 'en_US')
        .format(seatsNumber)
        .replaceAll(',', ' ');
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: const Color(0xffD9D9D9),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            IntrinsicWidth(
              child: Container(
                // width: 50,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xffE2E2E2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ўриндиқларни сонини белгиланг",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: cdarkTextColor,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (seatsNumber > 0) {
                        seatsNumber -= 1;
                      }
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff979797),
                    ),
                    child: Icon(
                      Icons.remove,
                      color: cworkingHintColor,
                    ),
                  ),
                ),
                Text(stringPrice,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff898A8D),
                    )),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (seatsNumber < 12) {
                        seatsNumber += 1;
                      }
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff979797),
                    ),
                    child: Icon(
                      Icons.add,
                      color: cworkingHintColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            button(
              text: "Қўллаш",
              color: caccentColor,
              onPressed: () {
                widget.getValue(seatsNumber);
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 16,
            ),
            buttonBorder("Бекор қилиш", () {
              seatsNumber = 0;
              widget.getValue(seatsNumber);
              Navigator.pop(context);
            }),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

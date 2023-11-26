import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';

import '../../consts/colors_const.dart';

class BottomSliderPriceChooser extends StatefulWidget {
  final Function(double) getValue;

  BottomSliderPriceChooser({required this.getValue});

  @override
  State<BottomSliderPriceChooser> createState() =>
      _BottomSliderPriceChooserState();
}

class _BottomSliderPriceChooserState extends State<BottomSliderPriceChooser> {
  double price = 25000;
  @override
  Widget build(BuildContext context) {
    var stringPrice =
        NumberFormat('###,###', 'en_US').format(price).replaceAll(',', ' ');
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
                      "Укажыте Цену",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: cdarkTextColor,
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.attach_money_outlined,
                      color: cclueColor,
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
                      if (price > 10000) {
                        price -= 5000;
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
                      if (price < 300000) {
                        price += 5000;
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
              text: "Appley",
              color: caccentColor,
              onPressed: () {
                widget.getValue(price);
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 16,
            ),
            buttonBorder("cancel", () {
              price = 0;
              widget.getValue(price);
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';

class WillTakePassangers extends StatelessWidget {
  const WillTakePassangers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              decoration: BoxDecoration(
                color: caccentBackingColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //svg image
                  SvgPicture.asset(
                    'images/personWithBag.svg',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Вы готовы брать пасажиров ?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff2A2A2A),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  button(
                    text: "Да я могу взять пасажиров",
                    color: caccentColor,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  buttonBorder(
                    "Нет я не могу",
                    () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

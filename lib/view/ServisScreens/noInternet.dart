import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Ой что то пошло не так",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: cworkingHintColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 27,
            ),
            Text(
              "Проверьте сотовые данные или Wi Fi, затем обновите",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: cclueColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 27,
            ),
            SvgPicture.asset(
              'images/noInternet.svg',
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: caccentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Обновить",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

import '../../consts/filtering_const.dart';

class BottomSliderPlaces extends StatefulWidget {
  const BottomSliderPlaces({super.key});

  @override
  State<BottomSliderPlaces> createState() => _BottomSliderPlacesState();
}

class _BottomSliderPlacesState extends State<BottomSliderPlaces> {
  List<bool> sitsePlcaeBool =
      List.generate(sitsePlcaeName.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Забронировать место",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: cdarkTextColor,
                        ),
                      ),
                      SizedBox(
                        width: 21,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "от 25 000 сум",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Финальную цену озвучивает водитель",
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "У водителя свободны:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: cdarkTextColor),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: places(),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  button(
                    text: "Позвонить и забронировать место",
                    color: caccentColor,
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "После звонка место закрепляется за вами автоматически, либо же отмените поездку",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: cclueColor,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> places() {
    List<Widget> result = List.generate(
      sitsePlcaeBool.length,
      (index) => SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 16.0),
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          decoration: BoxDecoration(
            color: sitsePlcaeBool[index] ? caccentBackingColor : cinputColor,
            border: sitsePlcaeBool[index]
                ? Border.all(color: caccentColor, width: 1)
                : Border.all(color: cworkingHintColor, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                shape: CircleBorder(),
              ),
            ),
            child: CheckboxListTile(
              title: Text(
                sitsePlcaeName[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:
                      sitsePlcaeBool[index] ? caccentColor : cworkingHintColor,
                ),
              ),
              value: sitsePlcaeBool[index],
              onChanged: (value) {
                setState(() {
                  sitsePlcaeBool[index] = value!;
                });
              },
            ),
          ),
        ),
      ),
    );

    // chake if ther any addtional time
    return result;
  }
}

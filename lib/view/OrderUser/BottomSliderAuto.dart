import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';

import '../../consts/colors_const.dart';
import '../../consts/filtering_const.dart';

class BottomSliderAuto extends StatefulWidget {
  final Function(Map) getValue;

  const BottomSliderAuto({required this.getValue});

  @override
  State<BottomSliderAuto> createState() => _BottomSliderAutoState();
}

class _BottomSliderAutoState extends State<BottomSliderAuto> {
  List<bool> autoChevroletOptionsBool =
      List.generate(autoChevroletOptions.length, (index) => false);
  List<bool> autoOthersOptionsBool =
      List.generate(autoOthersOptions.length - 1, (index) => false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    "Филтр",
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
                    Icons.tune,
                    color: cclueColor,
                  ),
                ],
              ),
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
                  Text(
                    "Машинани танланг",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff000000)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Chevrolet",
                    style: TextStyle(fontSize: 16, color: Color(0xff000000)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 3,
                    runSpacing: 2,
                    children: autoOptions("Chevrolet"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Другие",
                    style: TextStyle(fontSize: 16, color: Color(0xff000000)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 3,
                    runSpacing: 2,
                    children: autoOptions("others"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  button(
                      text: "Қўллаш",
                      color: caccentColor,
                      onPressed: () {
                        // here we going to ask backen for cars
                        List<String> auto = [];
                        List<String> autoAdd = [];

                        for (int i = 0;
                            i < autoChevroletOptionsBool.length;
                            i++) {
                          if (autoChevroletOptionsBool[i] == true) {
                            auto.add(autoChevroletOptions[i]);
                          }
                        }

                        for (int i = 0; i < autoOthersOptionsBool.length; i++) {
                          if (autoOthersOptionsBool[i] == true) {
                            autoAdd.add(autoChevroletOptions[i]);
                          }
                        }

                        Map<String, List> data = {
                          "auto": auto,
                          "autoAdd": autoAdd,
                        };

                        widget.getValue(data);

                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> autoOptions(String name) {
    List<Widget> result = [];

    if (name == "Chevrolet") {
      result = List.generate(
        autoChevroletOptionsBool.length,
        (index) => ChoiceChip(
          labelStyle: TextStyle(
            color: autoChevroletOptionsBool[index] == true
                ? cwhiteColor
                : cworkingHintColor,
          ),
          label: Text(
            autoChevroletOptions[index],
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: autoChevroletOptionsBool[index],
          selectedColor: caccentColor,
          onSelected: (newSelection) {
            print(autoChevroletOptions[index]);
            setState(() {
              autoChevroletOptionsBool[index] = newSelection;
            });
          },
        ),
      );
    } else if (name == "others") {
      result = List.generate(
        autoOthersOptionsBool.length,
        (index) => ChoiceChip(
          labelStyle: TextStyle(
            color: autoOthersOptionsBool[index] == true
                ? cwhiteColor
                : cworkingHintColor,
          ),
          label: Text(
            autoOthersOptions[index],
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          selected: autoOthersOptionsBool[index],
          selectedColor: caccentColor,
          onSelected: (newSelection) {
            print(autoOthersOptions[index]);
            setState(() {
              autoOthersOptionsBool[index] = newSelection;
            });
          },
        ),
      );
    }

    return result;
  }
}

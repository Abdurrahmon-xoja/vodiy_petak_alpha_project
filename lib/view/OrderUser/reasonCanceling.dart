import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/Cards_screem.dart';

import '../../consts/filtering_const.dart';

class ReasonCanceling extends StatefulWidget {
  const ReasonCanceling({super.key});

  @override
  State<ReasonCanceling> createState() => _ReasonCancelingState();
}

class _ReasonCancelingState extends State<ReasonCanceling> {
  List<bool> reasonBool = List.generate(reasonName.length, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: cnonWorkingColor,
            size: 28,
          ),
          onPressed: () {},
        ),
      ),
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
                "Укажите причину отмены поездки:",
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
              button(
                  text: "Отменить поездку",
                  color: caccentColor,
                  onPressed: () {
                    Get.defaultDialog(
                      title: "",
                      content: alert(
                        text1: 'Ваша поездка отменена',
                        text2:
                            'Мы будем стараться делать наш сервис лучше для вашего комфорта',
                        imageName: 'images/takeDelivary.svg',
                        buttonTExt: 'Вернуться на главную',
                        onClick: () {
                          Get.to(Cards());
                        },
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> reasons() {
    List<Widget> result = List.generate(
      reasonName.length,
      (index) => GestureDetector(
        onTap: () {
          setState(() {
            reasonBool[index] = !reasonBool[index];
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          margin: EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: reasonBool[index]
                ? Border.all(color: caccentColor, width: 1)
                : Border.all(color: cworkingHintColor, width: 1),
            color: reasonBool[index] ? caccentBackingColor : cinputColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.help_outline,
                color: reasonBool[index] ? caccentColor : cclueColor,
                size: 28,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                reasonName[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: reasonBool[index] ? caccentColor : cclueColor,
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

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/view/OrderUser/reasonCanceling.dart';

import '../../consts/filtering_const.dart';
import 'ChoosePlace_screen.dart';

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
                    onPressed: () {
                      //ToDo defaultDialog is here
                      Get.defaultDialog(
                          title: "",
                          content: Container(
                            width: MediaQuery.of(context).size.width + 100,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            // width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  "Вы только что говорили с водителем",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: cdarkTextColor),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Если вы договорились о поездке нажмите подтвердить поездку если нет нажмите вернуться назад",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: cworkingHintColor),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                button(
                                  text: "Продолжить",
                                  color: caccentColor,
                                  onPressed: () {
                                    FlutterPhoneDirectCaller.callNumber(
                                        '+993911538881');
                                    launch('tel+998911638881');

                                    // Get.defaultDialog(
                                    //   title: "",
                                    //   content: alert(
                                    //     text1: 'Поездка активирована!',
                                    //     text2:
                                    //         'Если вы передумали отмените поездку, но перед этим позвоните водителю',
                                    //     imageName: 'images/ptichka.svg',
                                    //     buttonTExt: 'Отменить поездку',
                                    //     onClick: () {},
                                    //   ),
                                    // );
                                    Get.defaultDialog(
                                      title: "",
                                      content: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Поездка завершена",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            RatingBar(
                                              minRating: 1,
                                              maxRating: 5,
                                              initialRating: 3,
                                              ratingWidget: RatingWidget(
                                                full: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 22,
                                                ),
                                                empty: Icon(
                                                  Icons.star,
                                                  color: cclueColor,
                                                  size: 22,
                                                ),
                                                half: Icon(
                                                  Icons.star,
                                                  color: cclueColor,
                                                  size: 22,
                                                ),
                                              ),
                                              onRatingUpdate: (double value) {},
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            Text(
                                              "Напишите комментарий",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff898989),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            TextFormField(
                                              // controller: _dateController,
                                              decoration: InputDecoration(
                                                // fillColor: fmaleInputColor,
                                                filled: true,
                                                hintText: 'Ваш комментарий',
                                                hintStyle: TextStyle(
                                                    color: cclueColor),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: BorderSide(
                                                      color: cinputColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: cinputColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 24,
                                            ),
                                            button(
                                                text: "Готово",
                                                color: caccentColor,
                                                onPressed: () {})
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                buttonBorder(
                                  "Мы не смогли договориться",
                                  () {
                                    Get.to(ReasonCanceling());
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ));
                    },
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

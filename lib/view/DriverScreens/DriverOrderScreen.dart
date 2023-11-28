import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/castem_widgets_const.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';
import 'package:vodiy_petak_alpha_project/consts/methods_const.dart';

import 'BottomSliderNumberOfSeats.dart';

class DriverOrderScreen extends StatefulWidget {
  const DriverOrderScreen({super.key});

  @override
  State<DriverOrderScreen> createState() => _DriverOrderScreenState();
}

class _DriverOrderScreenState extends State<DriverOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cDefoltAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ваша поездка",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: cdarkTextColor,
                  )),
              SizedBox(
                height: 24,
              ),
              Text(
                "Поездка активирована в 09.09.23 в 17:25",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: cdarkTextColor),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Ваши места:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // no passanger case
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 50.1),
              //   child: Center(
              //     child: SvgPicture.asset(
              //       'images/noPassanger.svg',
              //       // alignment: Alignment.center,
              //     ),
              //   ),
              // ),
              // active input
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  color: caccentBackingColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: caccentColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Место спереди",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: caccentColor,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: cwhiteColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Text(
                        "Пассажир (+998 99 999 99 99)",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: caccentColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // not active
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  color: cinputColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: cclueColor,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Место слева",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: cworkingHintColor,
                      ),
                    ),
                    Text(
                      "Свободно",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: cworkingHintColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Ваши доставки:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: cdarkTextColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // delivery card
              // Container(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              //         decoration: BoxDecoration(
              //           color: caccentBackingColor,
              //           borderRadius: BorderRadius.circular(10.0),
              //           border: Border.all(
              //             color: caccentColor,
              //             width: 1,
              //           ),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Малые габариты",
              //               style: TextStyle(
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.w500,
              //                 color: caccentColor,
              //               ),
              //             ),
              //             Row(
              //               children: [
              //                 Container(
              //                   width: 100,
              //                   child: Text(
              //                     textAlign: TextAlign.end,
              //                     "не займет пасадочное место",
              //                     style: TextStyle(
              //                       fontSize: 10,
              //                       fontWeight: FontWeight.w500,
              //                       color: caccentColor,
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 9,
              //                 ),
              //                 Container(
              //                   width: 22.0,
              //                   height: 22.0,
              //                   decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: caccentColor,
              //                   ),
              //                 )
              //               ],
              //             )
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         height: 12,
              //       ),
              //       Text(
              //         "Контакты",
              //         style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w700,
              //             color: cdarkTextColor),
              //       ),
              //       SizedBox(
              //         height: 12,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             "ЗАКАЗЧИК:",
              //             style: TextStyle(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w400,
              //               color: Color(0xff262626),
              //             ),
              //           ),
              //           Container(
              //             padding: EdgeInsets.all(4),
              //             decoration: BoxDecoration(
              //               color: caccentBackingColor,
              //               borderRadius: BorderRadius.circular(10.0),
              //             ),
              //             child: Text(
              //               "+998 99 999 99 99",
              //               style: TextStyle(
              //                 color: caccentColor,
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //       SizedBox(
              //         height: 12,
              //       ),
              //       Row(
              //         children: [
              //           Text(
              //             "ПОЛУЧАТЕЛЬ :",
              //             style: TextStyle(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w400,
              //               color: Color(0xff262626),
              //             ),
              //           ),
              //           Container(
              //             padding: EdgeInsets.all(4),
              //             decoration: BoxDecoration(
              //               color: caccentBackingColor,
              //               borderRadius: BorderRadius.circular(10.0),
              //             ),
              //             child: Text(
              //               "+998 99 999 99 99",
              //               style: TextStyle(
              //                 color: caccentColor,
              //                 fontSize: 14,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.1),
                child: Center(
                  child: SvgPicture.asset(
                    'images/noDelevary .svg',
                    // alignment: Alignment.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buttonBorder(
                "Завершить поездку",
                () {
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
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Завершить поездку",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: cdarkTextColor)),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text("Куда:  ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff262626),
                                          )),
                                      Text(
                                        "Ташкент",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: cdarkTextColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "У вас 1 доставка",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff262626),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "У вас 2 пассажир",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff262626),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                "Внимание! Не завершайте поездку пока не отвезете всех пассажиров и не отдадите все доставки!",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff898989),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              button(
                                text: "Завершить поездку",
                                color: caccentColor,
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: "",
                                    content: alert(
                                      text1: 'активирована',
                                      text2:
                                          'Ваша поездка добавилась в общую страницу, ждите звонков пассажиров и следите за статусом поездки ',
                                      imageName: 'images/ptichka.svg',
                                      buttonTExt:
                                          'Отследить статус вашей поездки',
                                      onClick: () {},
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

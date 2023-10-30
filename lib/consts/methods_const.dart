import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'colors_const.dart';

AppBar cDefoltAppBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back_ios,
        color: cworkingHintColor,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

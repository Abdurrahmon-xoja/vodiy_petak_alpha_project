import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

class Places extends StatelessWidget {
  // const Places({super.key});

  // from here add additinal placec
  final List<String> citys = ["Ташкент", "Андижан"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: _buildListView(),
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (_, index) {
        return Column(
          children: [
            ListTile(
              title: Text(
                citys[index],
                style: const TextStyle(
                  color: cworkingHintColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: const Text(
                "Узбекистан",
                style: TextStyle(
                  color: cworkingHintColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                size: 40,
                color: cclueColor,
              ),
              onTap: () {
                Get.back(result: citys[index]);
              },
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: cclueColor,
            ),
          ],
        );
      },
    );
  }
}

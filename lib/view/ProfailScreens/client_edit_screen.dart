import 'package:flutter/material.dart';
import 'package:vodiy_petak_alpha_project/consts/colors_const.dart';

class ClientEdit extends StatelessWidget {
  const ClientEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Отмена",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: caccentColor,
                      padding: EdgeInsets.all(10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Готово",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD0D0D0),
                ),
                child: Center(
                  child: Icon(Icons.photo_camera),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              TextFormField(
                // controller: nameController,
                decoration: InputDecoration(
                    fillColor: cinputColor,
                    filled: true,
                    hintText: 'Как вас зовут?',
                    hintStyle: TextStyle(color: cclueColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: cinputColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: cinputColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: cclueColor,
                    )),
              ),
              SizedBox(
                height: 24,
              ),
              Text("Укажите ваше настоящее Имя",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: caccentColor,
                  )),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Сменить номер телефона",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff262626),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                // controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: cinputColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: cinputColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: cinputColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 70,
                    child: Row(
                      children: [
                        Text(
                          "🇺🇿 +998 ",
                          style: TextStyle(
                            color: cclueColor,
                            fontSize: 15,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          color: cclueColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: cerrorSubstrateColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                icon: Icon(
                  Icons.logout,
                  color: cwhiteColor,
                ),
                label: Text(
                  "Выйти из профиля",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

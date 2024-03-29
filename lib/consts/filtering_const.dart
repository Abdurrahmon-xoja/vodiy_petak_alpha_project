import 'dart:core';
import 'package:flutter/material.dart';

List<String> filterOptionsNames = [
  "Avto",
  "фақат бензин",
  "фақат газ",
  "опитни ҳайдочи",
  "эркак ҳайдовши",
];

List<String> autoChevroletOptions = [
  "Шевроле Джентра",
  "Шевроле Кобальт ",
  "Шевроле Нексия 3",
  "Шевроле Нексия",
  "Шевроле Каптива",
  "Шевроле Малибу",
  "Шевроле Матиз",
  "Шевроле Спарк",
  "Шевроле Трекер",
];

List<String> carColors = [
  "Оқ",
  "Қора",
  "Кўк",
  "Сариқ",
  "Темир ранг",
  "Қизил",
  "Яшил",
  "Кул ранг",
];

List<String> autoOthersOptions = [
  "КИА карнивал",
  "КИА Елантра",
  "Дамас",
];

List<String> timeOfGoing = [
  "05:00-12:00",
  "12:00-16:00",
  "16:00-23:00",
  "23:00-05:00",
];

List<String> timeOfGoName = [
  "Утром",
  "Днем",
  "Вечером",
  "Ночью",
];

// will chage is it taken then show
List<String> sitsePlcaeName = [
  "Олд ўриндиқ",
  "Ўнг ўриндиқ",
  "Чап ўриндиқ",
  "Ўрта ўриндиқ",
];

// server info
int additionSitsePlcaeNum = 0;

List<String> reasonName = [
  "Слишком долго ждать",
  "Водитель грубил",
  "Поменялись планы",
  "Случайная активация",
  "Уехал на другом такси",
  "Не смогли договориться с водителем",
];

List<String> goodsSizedName = [
  "Кичик ўлчамлар",
  "Ўртача ўлчамлар",
  "Катта ўлчамлар",
  "Юкхона",
  "Кофр (автомобил томи)",
];

List<String> goodsSizedDefinition = [
  "жой эгалламайди",
  "бир ўринни эгаллайди",
  "1-2 o‘rinni egallaydi",
  "бутун юкхонани эгаллайди",
  "бутун кофрни эгаллайди",
];

List<String> placesOrder = [
  //Tashkent
  "Бектемирский район",
  "Чиланзарский район",
  "Яшнабадский район",
  "Мирабадский район",
  "Мирзо-Улугбекский район",
  "Сергелийский район",
  "Шайхантахурский район",
  "Алмазарский район",
  "Учтепинский район",
  "Яккасарайский район",
  "Юнусабадский район"
      // Andijon
      "Андижан (город)",
  "Ханабад (город)",
  "Алтынкульский район",
  "Андижанский район",
  "Асакинский район",
  "Балыкчинский район",
  "Бустанский район",
  "Булакбашинский район",
  "Джалакудукский район",
  "Избасканский район",
  "Кургантепинский район",
  "Мархаматский район",
  "Пахтаабадский район",
  "Улугнорский район",
  "Ходжаабадский район",
  "Шахриханский район",
];

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/OrderPassengerInfo.dart';

class Api {
  static const url = "http://192.168.100.25/api/";

  static addDriver(Map pdata) async {
    try {
      final res = await http.post(Uri.parse(url + "app_product"), body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
      } else {
        print("Some thing went wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static addOrderForDelivery(Map data) async {
    try {
      final res =
          await http.post(Uri.parse(url + "add_orderDeliver"), body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
      } else {}
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static addOrderForPassenger(Map data) async {
    try {
      final res =
          await http.post(Uri.parse(url + "add_orderPassenger"), body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Some thing went wrong");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<OrderPassengerInfo>> getOrdersPassenger(Map data) async {
    List<OrderPassengerInfo> list = [];
    try {
      final res =
          await http.post(Uri.parse(url + "get_ordersPassengers"), body: data);

      if (res.statusCode == 200) {
        // you going to give the data
        var data = jsonDecode(res.body);

        print(data);

        list = transformDataToObjects(data);

        print(list);

        return list;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<OrderPassengerInfo>> getFilterForCars(Map data) async {
    List<OrderPassengerInfo> list = [];

    try {
      final res =
          await http.post(Uri.parse(url + "get_filterForCar"), body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        list = transformDataToObjects(data);

        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<OrderPassengerInfo>> getFilterTimeAndPrice(
      Map data) async {
    List<OrderPassengerInfo> list = [];
    print(data);

    try {
      final res = await http.post(Uri.parse(url + "get_filterForTimeAndPrice"),
          body: data);

      print(res.body);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        list = transformDataToObjects(data);

        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static List<OrderPassengerInfo> transformDataToObjects(Map data) {
    List<OrderPassengerInfo> list = [];

    for (int i = 0; i < data['products'].length; i++) {
      List<PassengerSetsInfo> passengerInfo = [];
      List<PassengerSetsInfo> passengerInfoAdd = [];

      for (int j = 0; j < data['products'][i]['passengerInfo'].length; j++) {
        passengerInfo.add(PassengerSetsInfo(
            data['products'][i]['passengerInfo'][j]['name'].toString(),
            data['products'][i]['passengerInfo'][j]['price'].toString()));
      }

      for (int j = 0; j < data['products'][i]['addPassengerInfo'].length; j++) {
        passengerInfoAdd.add(PassengerSetsInfo(
            data['products'][i]['addPassengerInfo'][j]['name'].toString(),
            data['products'][i]['addPassengerInfo'][j]['price'].toString()));
      }

      list.add(
        OrderPassengerInfo(
          data['products'][i]['name'],
          data['products'][i]['age'],
          data['products'][i]['phoneNumber'],
          data['products'][i]['sex'],
          data['products'][i]['carModel'],
          data['products'][i]['carColor'],
          data['products'][i]['carNumber'],
          data['products'][i]['time'],
          data['products'][i]['date'],
          data['products'][i]['from'],
          data['products'][i]['to'],
          data['products'][i]['airConditinar'],
          data['products'][i]['fuel'],
          data['products'][i]['priceLowest'].toString(),
          data['products'][i]['priceHighest'].toString(),
          data['products'][i]['numberOfPassangers'].toString(),
          passengerInfo,
          passengerInfoAdd,
        ),
      );
    }

    return list;
  }
}

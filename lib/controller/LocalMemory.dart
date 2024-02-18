import 'dart:convert';
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../consts/filtering_const.dart';
import '../models/DelivaryModule.dart';
import '../models/PassengerMemory.dart';

class LocalMemory {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future saveDataString(String name, String val) async {
    await _preferences?.setString(name, val);
  }

  static clearAll() async {
    await _preferences?.clear();
  }

  static String getValue(String _key) {
    return _preferences!.getString(_key).toString();
  }

  static Map getOrderPassengerInfo() {
    //order_passengerInfo"
    // I will come to this some kind of anamaly happaning
    // if array encoded it enught to give to backend
    // chake all things here
    var passengerInfo =
        _preferences!.getString("order_passengerInfo").toString();

    var addPassengerInfo =
        _preferences!.getString("order_addPassengerInfo").toString();

    Map data = {
      'name': _preferences!.getString("name").toString(),
      'age': _preferences!.getString("dateOfBirth").toString(),
      'phoneNumber': _preferences!.getString("phoneNumber").toString(),
      'sex': _preferences!.getString("sex").toString(),
      "carModel": _preferences!.getString("carModel").toString(),
      "carColor": _preferences!.getString("carColor").toString(),
      "carNumber": _preferences!.getString("carNumber").toString(),
      "time": _preferences!.getString("order_time").toString(),
      "date": _preferences!.getString("order_date").toString(),
      "from": _preferences!.getString("order_from").toString(),
      "to": _preferences!.getString("order_to").toString(),
      "airConditinar": _preferences!.getString("airCond").toString(),
      "fuel": _preferences!.getString("fuelType").toString(),
      "passengerInfo": passengerInfo.toString(),
      'addPassengerInfo': addPassengerInfo.toString(),
      'ordersTaken': [].toString(),
    };

    return data;
  }

  static Map getOrderDeliveryInfo() {
    //order_passengerInfo"
    var order_deliveryInfo =
        _preferences!.getString("order_deliveryInfo").toString();

    Map data = {
      'name': _preferences!.getString("name").toString(),
      'age': _preferences!.getString("dateOfBirth").toString(),
      'sex': _preferences!.getString("sex").toString(),
      'phoneNumber': _preferences!.getString("phoneNumber").toString(),
      "carModel": _preferences!.getString("carModel").toString(),
      "carColor": _preferences!.getString("carColor").toString(),
      "carNumber": _preferences!.getString("carNumber").toString(),
      "time": _preferences!.getString("order_time").toString(),
      "date": _preferences!.getString("order_date").toString(),
      "from": _preferences!.getString("order_from").toString(),
      "to": _preferences!.getString("order_to").toString(),
      "deliveryInfo": order_deliveryInfo.toString(),
    };

    return data;
  }

  static Map getUserRegistrationInfo() {
    Map<String, String> data = {
      'name': _preferences!.getString("name").toString(),
      'password': _preferences!.getString("password").toString(),
      'age': _preferences!.getString("dateOfBirth").toString(),
      'phoneNumber': _preferences!.getString("phoneNumber").toString(),
      'sex': _preferences!.getString("sex").toString(),
    };

    return data;
  }

  static Map getDriverRegisterInfo() {
    Map<String, String> data = {
      'name': _preferences!.getString("name").toString(),
      'password': _preferences!.getString("password").toString(),
      'age': _preferences!.getString("dateOfBirth").toString(),
      'phoneNumber': _preferences!.getString("phoneNumber").toString(),
      'sex': _preferences!.getString("sex").toString(),
      "carModel": _preferences!.getString("carModel").toString(),
      "carColor": _preferences!.getString("carColor").toString(),
      "carNumber": _preferences!.getString("carNumber").toString(),
    };

    return data;
  }

  static Future setStringArray(String name, List array) async {
    await _preferences?.setStringList(name, array.toString() as List<String>);
  }

  static setDeliveryPriceAndSeats(
      List<bool> boolList, List<double> doubleList) async {
    List<Map<String, String>> some = [];

    for (int i = 0; i < boolList.length; i++) {
      DeliveryMemory info = DeliveryMemory(
        price: doubleList[i].toString(),
        name: goodsSizedName[i],
      );
      if (boolList[i] == true) {
        some.add(
          info.getObject(),
        );
      }
    }

    double min = double.parse(some[0]['price']!);
    for (int i = 0; i < some.length; i++) {
      if (double.parse(some[i]['price']!) < min) {
        min = double.parse(some[0]['price']!);
      }
    }

    LocalMemory.saveDataString(
        "driverOrderInfoDelivaryLowestPrice", min.toString());
    var jsonString = jsonEncode(some);

    await _preferences?.setString("order_deliveryInfo", jsonString);
  }

  static setPassengerPriceAndSeats(
      List<bool> boolList, List<double> doubleList) async {
    List<Map> some = [];

    for (int i = 0; i < boolList.length; i++) {
      PassengerMemory info = PassengerMemory(
        price: doubleList[i].toString(),
        name: sitsePlcaeName[i],
      );
      if (boolList[i] == true) {
        some.add(
          info.getObject(),
        );
      }
    }

    double min = double.parse(some[0]['price']);
    for (int i = 0; i < some.length; i++) {
      if (double.parse(some[i]['price']) < min) {
        min = double.parse(some[0]['price']);
      }
    }

    LocalMemory.saveDataString(
        "driverOrderInfoPassengerLowestPrice", min.toString());

    LocalMemory.saveDataString(
        "driverOrderInfoPassengerHowManySeats", some.length.toString());

    var jsonString = jsonEncode(some);

    await _preferences?.setString("order_passengerInfo", jsonString);
  }

  static setAddPassengerPriceAndSeats(
      List<bool> boolList, List<double> doubleList) async {
    List<Map> some = [];

    for (int i = 0; i < boolList.length; i++) {
      PassengerMemory info = PassengerMemory(
        price: doubleList[i].toString(),
        name: (i + 1).toString(),
      );
      if (boolList[i] == true) {
        some.add(
          info.getObject(),
        );
      }
    }
    double min = double.parse(
        LocalMemory.getValue("driverOrderInfoPassengerLowestPrice"));
    for (int i = 0; i < some.length; i++) {
      if (double.parse(some[i]['price']) < min) {
        min = double.parse(some[0]['price']);
      }
    }

    LocalMemory.saveDataString(
        "driverOrderInfoPassengerLowestPrice", min.toString());
    // i am getting amount of seats to render order first
    int seatsAmount =
        int.parse(LocalMemory.getValue("driverOrderInfoPassengerHowManySeats"));
    seatsAmount += some.length;
    LocalMemory.saveDataString(
        "driverOrderInfoPassengerHowManySeats", seatsAmount.toString());
    LocalMemory.saveDataString("driverOrderInfoPassengerHowOrdersTaken", "0");
    var jsonString = jsonEncode(some);

    await _preferences?.setString("order_addPassengerInfo", jsonString);
  }
}

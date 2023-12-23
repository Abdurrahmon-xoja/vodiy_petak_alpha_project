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
    var parsedInfo = jsonDecode(passengerInfo);

    var addPassengerInfo =
        _preferences!.getString("order_addPassengerInfo").toString();
    var addParsedInfo = jsonDecode(addPassengerInfo);

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
    };

    return data;
  }

  static Map getOrderDeliveryInfo() {
    //order_passengerInfo"
    var order_deliveryInfo =
        _preferences!.getString("order_deliveryInfo").toString();
    var parsedInfo = jsonDecode(order_deliveryInfo);

    Map data = {
      'name': _preferences!.getString("name").toString(),
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

  static Map getDriverRegisterInfo() {
    Map<String, String> data = {
      'name': _preferences!.getString("name").toString(),
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
        name: i.toString(),
      );
      if (boolList[i] == true) {
        some.add(
          info.getObject(),
        );
      }
    }

    var jsonString = jsonEncode(some);

    print(jsonString);

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

    var jsonString = jsonEncode(some);

    await _preferences?.setString("order_addPassengerInfo", jsonString);
  }
}

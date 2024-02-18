import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:vodiy_petak_alpha_project/models/OrderDeliveryInfo.dart';

import '../controller/LocalMemory.dart';
import '../models/OrderPassengerInfo.dart';

class Api {
  static const url = "http://192.168.100.25/api/";

  static addDriver(Map pdata) async {
    try {
      final res = await http.post(Uri.parse(url + "add_driver"), body: pdata);
      print(res);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Some thing went wrong");
      }
    } catch (e) {
      print("some kind off error happende while connection");
      debugPrint(e.toString());
    }
  }

  static addUser(Map data) async {
    print(data);
    try {
      final res = await http.post(Uri.parse(url + "add_user"), body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Some thing went wrong");
      }
    } catch (e) {
      // TODO: add the getx widget
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
    print(data);
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

  static Future<List<OrderDeliveryInfo>> getOrderDelivary(Map data) async {
    List<OrderDeliveryInfo> list = [];
    try {
      final res =
          await http.post(Uri.parse(url + "get_ordersDelivery"), body: data);
      print(res.body);
      if (res.statusCode == 200) {
        // you going to give the data
        var data = jsonDecode(res.body);

        print(data);

        list = transformDataToObjectsDelivary(data);

        return list;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List<OrderPassengerInfo>> getOrdersPassenger(Map data) async {
    List<OrderPassengerInfo> list = [];
    try {
      final res =
          await http.post(Uri.parse(url + "get_ordersPassengers"), body: data);

      if (res.statusCode == 200) {
        // you going to give the data
        Map dataUserOrder = LocalMemory.getOrderPassengerInfo();
        print(dataUserOrder);
        var data = jsonDecode(res.body);
        print('-----------------');
        print(data);

        list = transformDataToObjectsPassaenger(data);

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

  static Future<List<OrderDeliveryInfo>> getFilterForDelivary(Map data) async {
    List<OrderDeliveryInfo> list = [];

    try {
      final res =
          await http.post(Uri.parse(url + "get_filtelDelivary"), body: data);

      print(res.body);
      if (res.statusCode == 200) {
        // you going to give the data
        var data = jsonDecode(res.body);

        print(data);

        list = transformDataToObjectsDelivary(data);

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

        list = transformDataToObjectsPassaenger(data);

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
    try {
      final res = await http.post(Uri.parse(url + "get_filterForTimeAndPrice"),
          body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        list = transformDataToObjectsPassaenger(data);

        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static sendNewOrderDelivaryInfo(Map data) async {
    try {
      final res =
          await http.post(Uri.parse(url + "updateDelivaryOrder"), body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static sendNewOrderPassangerInfo(Map data) async {
    try {
      final res =
          await http.post(Uri.parse(url + "updatePassangerOrder"), body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<OrderDeliveryInfo>> getDelivaryOrderFromPhoneNumber(
      Map data) async {
    List<OrderDeliveryInfo> list = [];
    try {
      final res = await http
          .post(Uri.parse(url + "getDelivaryOrderFromPhoneNumber"), body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        list = transformDataToObjectsDelivary(data);
        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return [];
  }

  static Future<List<OrderPassengerInfo>> getPassengerOrderFromPhoneNumber(
      Map data) async {
    List<OrderPassengerInfo> list = [];
    try {
      final res = await http.post(
          Uri.parse(url + "getPassengerOrderFromPhoneNumber"),
          body: data);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        list = transformDataToObjectsPassaenger(data);
        print("------------");
        print(list);
        return list;
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    return [];
  }

  static Future<bool> isUserPhoneExistInDB(String phoneNumber) async {
    try {
      final res = await http.post(Uri.parse(url + "isUserPhoneExistInDB"),
          body: {"phoneNumber": phoneNumber});

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        return data['products'];
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return false;
  }

  static Future<bool> isDriverPhoneExistInDB(String phoneNumber) async {
    try {
      final res = await http.post(Uri.parse(url + "isDriverPhoneExistInDB"),
          body: {"phoneNumber": phoneNumber});

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        return data['products'];
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
    return false;
  }

  static Future<Map> getUserAccountInfoFromPhone(String phoneNumber) async {
    try {
      final res = await http.post(
          Uri.parse(url + "getUserAccountInfoFromPhone"),
          body: {"phoneNumber": phoneNumber});

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        print(data['products']);
        print(data['products']['name']);

        Map<String, String> dataSend = {
          "name": data['products']['name'],
          "age": data['products']['age'],
          "phoneNumber": data['products']['phoneNumber'],
          "sex": data["products"]['sex'],
        };

        return dataSend;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return {};
  }

  static Future<Map> getDriverAccountInfoFromPhone(String phoneNumber) async {
    try {
      final res = await http.post(
          Uri.parse(url + "getDriverAccountInfoFromPhone"),
          body: {"phoneNumber": phoneNumber});

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        print(data['products']);
        print(data['products']['name']);

        Map<String, String> dataSend = {
          "name": data['products']['name'],
          "age": data['products']['age'],
          "phoneNumber": data['products']['phoneNumber'],
          "sex": data["products"]['sex'],
          "carModel": data['products']['carModel'],
          "carColor": data['products']['carColor'],
          "carNumber": data['products']['carNumber'],
        };

        return dataSend;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return {};
  }

  static updateUserName(Map data) {
    try {
      final res = http.post(Uri.parse(url + "updateUserName"), body: data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static updateDriver(Map data) {
    try {
      final res = http.post(Uri.parse(url + "updateDriver"), body: data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static cancelTheRight(Map data) {
    try {
      final res = http.post(Uri.parse(url + "cacelRight"), body: data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static cancelTheDelivary(Map data) {
    try {
      final res = http.post(Uri.parse(url + "cacelDelivary"), body: data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static endTheOrder(Map data) {
    try {
      final res = http.post(Uri.parse(url + "endOrder"), body: data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List> getDriveroOdesrs(String phoneNumber) async {
    try {
      final res = await http.post(Uri.parse(url + "getDriverOrdes"),
          body: {"phoneNumber": phoneNumber});

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        List some = data['products'];

        return some;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<List> getUserOrders(String phoneNumber) async {
    try {
      final res = await http.post(Uri.parse(url + "getUserOrdes"),
          body: {"phoneNumber": phoneNumber});
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        List some = data['products'];

        return some;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  static Future<bool> isDriversPasswordCorrect(Map data) async {
    try {
      final res = await http.post(Uri.parse(url + "isDriversPasswordCorrect"),
          body: data);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print(data['products']);
        return data['products'];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<bool> isUserssPasswordCorrect(Map data) async {
    try {
      final res = await http.post(Uri.parse(url + "isUserssPasswordCorrect"),
          body: data);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("-----------");
        print(data['products']);
        return data['products'];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<bool> isUsersRideInProgress(Map data) async {
    print("Function is working");
    try {
      final res =
          await http.post(Uri.parse(url + "isUsersRideInProgress"), body: data);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("-----------");
        print(data['products']);
        return data['products'];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<bool> isUsersDelivaryInProgress(Map data) async {
    print("Function is working");
    try {
      final res = await http.post(Uri.parse(url + "isUsersDelivaryInProgress"),
          body: data);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("-----------");
        print(data['products']);
        return data['products'];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static List<OrderDeliveryInfo> transformDataToObjectsDelivary(Map data) {
    List<OrderDeliveryInfo> list = [];
    for (int i = 0; i < data['products'].length; i++) {
      List<DeliveryInfoSize> delivarySizeInfo = [];
      List<OrderTakenDelivary> delivaryOrderInfo = [];

      for (int j = 0; j < data['products'][i]['deliveryInfo'].length; j++) {
        delivarySizeInfo.add(DeliveryInfoSize(
          data['products'][i]['deliveryInfo'][j]['name'].toString(),
          data['products'][i]['deliveryInfo'][j]['price'].toString(),
        ));
      }

      for (int j = 0;
          j < data['products'][i]['orderDelivaryTaken'].length;
          j++) {
        delivaryOrderInfo.add(OrderTakenDelivary(
          data['products'][i]['orderDelivaryTaken'][j]['name'].toString(),
          data['products'][i]['orderDelivaryTaken'][j]['phonenumberGiver']
              .toString(),
          data['products'][i]['orderDelivaryTaken'][j]['phonenumberTaker']
              .toString(),
        ));
      }

      list.add(OrderDeliveryInfo(
        data['products'][i]['_id'],
        data['products'][i]['name'],
        data['products'][i]['phoneNumber'],
        data['products'][i]['sex'],
        data['products'][i]['carModel'],
        data['products'][i]['carColor'],
        data['products'][i]['carNumber'],
        data['products'][i]['time'],
        data['products'][i]['date'],
        data['products'][i]['from'],
        data['products'][i]['to'],
        data['products'][i]['priceLowest'].toString(),
        data['products'][i]['priceHighest'].toString(),
        delivarySizeInfo,
        delivaryOrderInfo,
      ));
    }
    return list;
  }

  static List<OrderPassengerInfo> transformDataToObjectsPassaenger(Map data) {
    List<OrderPassengerInfo> list = [];

    for (int i = 0; i < data['products'].length; i++) {
      List<PassengerSetsInfo> passengerInfo = [];
      List<PassengerSetsInfo> passengerInfoAdd = [];
      List<OrderTakenFrom> orderTakenFrom = [];

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

      for (int j = 0; j < data['products'][i]['orderTaken'].length; j++) {
        orderTakenFrom.add(OrderTakenFrom(
            data['products'][i]['orderTaken'][j]['seatName'].toString(),
            data['products'][i]['orderTaken'][j]['phoneNumber'].toString()));
      }

      list.add(
        OrderPassengerInfo(
          data['products'][i]['_id'],
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
          orderTakenFrom,
        ),
      );
    }

    return list;
  }
}

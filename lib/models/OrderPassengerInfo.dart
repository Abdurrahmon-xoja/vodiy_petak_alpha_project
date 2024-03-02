import 'dart:ffi';

class OrderPassengerInfo {
  late final String id;
  late final String rating;
  late final String name;
  late final String age;
  late final String phoneNumber;
  late final String sex;
  late final String carModel;
  late final String carColor;
  late final String carNumber;
  late final String time;
  late final String date;
  late final String from;
  late final String to;
  late final String airConditinar;
  late final String fuel;
  late final String priceLowest;
  late final String priceHighest;
  late final String numberOfPassangers;
  late final List<PassengerSetsInfo> passengerInfo;
  late final List<PassengerSetsInfo> addPassengerInfo;
  late final List<OrderTakenFrom> orderTakenFrom;

  OrderPassengerInfo(
    this.id,
    this.rating,
    this.name,
    this.age,
    this.phoneNumber,
    this.sex,
    this.carModel,
    this.carColor,
    this.carNumber,
    this.time,
    this.date,
    this.from,
    this.to,
    this.airConditinar,
    this.fuel,
    this.priceLowest,
    this.priceHighest,
    this.numberOfPassangers,
    this.passengerInfo,
    this.addPassengerInfo,
    this.orderTakenFrom,
  );

  Map<String, String> getMapOfPassengerOrderInfo() {
    return {
      'id': id,
      'rating': rating,
      'name': name,
      'age': age,
      'phoneNumber': phoneNumber,
      'sex': sex,
      'carModel': carModel,
      'carColor': carColor,
      'carNumber': carNumber,
      'time': time,
      'date': date,
      'from': from,
      'to': to,
      'airConditinar': airConditinar,
      'fuel': fuel,
      'priceLowest': priceLowest,
      'priceHighest': priceHighest,
      'numberOfPassangers': numberOfPassangers,
    };
  }
}

class PassengerSetsInfo {
  late final String name;
  late final String price;

  PassengerSetsInfo(this.name, this.price);
}

class OrderTakenFrom {
  late final String seatName;
  late final String phoneNumber;

  OrderTakenFrom(this.seatName, this.phoneNumber);
}

import 'OrderPassengerInfo.dart';

List<Map> convertFromInstToMap(List<PassengerSetsInfo> data) {
  List<Map> list = [];
  // use getObkect fucke
  for (int i = 0; i < data.length; i++) {
    list.add({
      'name': data[i].name,
      'price': data[i].price,
    });
  }

  return list;
}

List<Map> convertFromInstOfOrderToMap(List<OrderTakenFrom> data) {
  List<Map> list = [];
  for (int i = 0; i < data.length; i++) {
    list.add({
      'seatName': data[i].seatName,
      'phoneNumber': data[i].phoneNumber,
    });
  }

  return list;
}

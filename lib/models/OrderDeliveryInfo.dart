class OrderDeliveryInfo {
  late final String id;
  late final String rating;
  late final String name;
  late final String phoneNumber;
  late final String sex;
  late final String carModel;
  late final String carColor;
  late final String carNumber;
  late final String time;
  late final String date;
  late final String from;
  late final String to;
  late final String priceLowest;
  late final String priceHighest;
  late final List<DeliveryInfoSize> deliverySizeInfo;
  late final List<OrderTakenDelivary> orderTakenFrom;

  OrderDeliveryInfo(
    this.id,
    this.rating,
    this.name,
    this.phoneNumber,
    this.sex,
    this.carModel,
    this.carColor,
    this.carNumber,
    this.time,
    this.date,
    this.from,
    this.to,
    this.priceLowest,
    this.priceHighest,
    this.deliverySizeInfo,
    this.orderTakenFrom,
  );
  Map<String, String> getMapOfDelivaryOrderInfo() {
    return {
      'id': id,
      'rating': rating,
      'name': name,
      'phoneNumber': phoneNumber,
      'sex': sex,
      'carModel': carModel,
      'carColor': carColor,
      'carNumber': carNumber,
      'time': time,
      'date': date,
      'from': from,
      'to': to,
      'priceLowest': priceLowest,
      'priceHighest': priceHighest,
    };
  }
}

class DeliveryInfoSize {
  late final String name;
  late final String price;

  DeliveryInfoSize(this.name, this.price);
}

class OrderTakenDelivary {
  late final String name;
  late final String phonenumberGiver;
  late final String phonenumberTaker;

  OrderTakenDelivary(this.name, this.phonenumberGiver, this.phonenumberTaker);
}

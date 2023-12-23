class DeliveryMemory {
  late final String name;
  late final String price;

  DeliveryMemory({required this.price, required this.name});

  Map<String, String> getObject() {
    var data = {
      'name': this.name,
      'price': this.price,
    };

    return data;
  }
}

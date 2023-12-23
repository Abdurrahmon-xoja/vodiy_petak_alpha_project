class PassengerMemory {
  late final String name;
  late final String price;

  PassengerMemory({required this.name, required this.price});

  Map<String, String> getObject() {
    var data = {
      'name': this.name,
      'price': this.price,
    };

    return data;
  }
}

class PassengerMemoryAdd {
  late final String name;
  late final String price;

  PassengerMemoryAdd({required this.name, required this.price});

  Map<String, String> getObject() {
    var data = {
      'name': this.name,
      'price': this.price,
    };

    return data;
  }
}
